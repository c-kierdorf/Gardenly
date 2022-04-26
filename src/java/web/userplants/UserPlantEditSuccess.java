package web.userplants;

import db.Plant;
import db.UserPlant;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.plant.PlantManager;
import model.user.UserManager;
import model.userplant.UserPlantManager;
import web.plants.GetFileName;

/**
 *
 * @author crill
 */
@WebServlet(name = "UserPlantEditSuccess", urlPatterns = {"/UserPlantEditSuccess"})
@MultipartConfig
public class UserPlantEditSuccess extends HttpServlet {

    @Inject
    private UserPlantManager upm;
    @Inject
    private PlantManager pm;
    @Inject
    private UserManager um;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            //Basics: identfy UserPlant
            Integer userPlantId = Integer.parseInt(request.getParameter("up_id"));
            UserPlant userPlant = upm.findUserPlantById(userPlantId);

            if (userPlant != null) {
                // Form-Data to Database
                Integer plantId = Integer.parseInt(request.getParameter("plantType"));
                Plant plant = pm.findPlantById(plantId);
                String userPlantName = request.getParameter("up_name");
                String picturePath = fileUpload(request, response, userPlant);
                boolean isConnected = checkHardwareId(request, response);

                userPlant.setUserPlantName(userPlantName);
                userPlant.setPlantsFk(plant);
                userPlant.setUserPlantPicturePath(picturePath);
                userPlant.setIsConnected(isConnected);

                upm.setUserPlant(userPlant);
                upm.update(userPlant);
                upm.setErrors(false);
            } else {
                upm.setErrors(true);
                upm.setStatus("Die UserPlant konnte nicht in der DB gefunden werden.");
            }

            RequestDispatcher rd
                    = request.getRequestDispatcher("/user-plants/UserPlantEditSuccess.jsp");
            rd.forward(request, response);
        } catch (FileNotFoundException fne) {
            upm.setErrors(true);
            upm.setStatus("Die Datei zum hochladen konnte auf dem Quellgerät nicht gefunden werden.");
            fne.printStackTrace();
        } catch (IOException ex) {
            upm.setErrors(true);
            upm.setStatus("Die Datei konnte nicht hochgeladen werden, auf dem Server ist ein Fehler aufgetreten.");
            ex.printStackTrace();
        } catch (Exception e) {
            upm.setErrors(true);
            upm.setStatus("Unbekanntes Problem aufgetreten.");
            e.printStackTrace();
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="fileUpload method. Click on the + sign on the left to edit the code.">
    private String fileUpload(HttpServletRequest request, HttpServletResponse response, UserPlant userPlant)
            throws ServletException, IOException {
        // File Upload. Goal: set a picturePath
        String picturePath = userPlant.getUserPlantPicturePath();

        // Now check, if a new upload is available
        Part filePart = request.getPart("picture");
        boolean isThereAFile = filePart.getSize() > 0;

        if (isThereAFile) {
            final String path = "/var/www/html/gardenly.garden/img/user-plants";
            final String fileName = GetFileName.of(filePart);

            OutputStream outputStream = null;
            InputStream filecontent = null;

            outputStream = new FileOutputStream(new File(path + File.separator
                    + fileName));
            filecontent = filePart.getInputStream();

            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = filecontent.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
            picturePath = fileName;
        }
        return picturePath;
    }// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="checkHardwareId method. Click on the + sign on the left to edit the code.">
    private boolean checkHardwareId(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean isConnected = false;
        int hardwareId = Integer.parseInt(request.getParameter("hardware_id"));
        if (hardwareId == 1) {
            List<UserPlant> userPlants = upm.findAll();
            if (userPlants != null) {
                userPlants
                        .stream()
                        .peek(i -> i.setIsConnected(false)) // alle verknüpften Pflanzen auf false setzen
                        .forEach(i -> upm.update(i)); // UserPlant per upm updaten
                isConnected = true; // um aktuelle UserPlant auf true zu setzen.
            }
        }
        return isConnected;
    }// </editor-fold>
}
