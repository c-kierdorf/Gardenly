package web.plants;

import db.Plant;
import db.User;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
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

/**
 *
 * @author CK
 */
@WebServlet(name = "PlantAddSuccess", urlPatterns = {"/plants/PlantAddSuccess"})
@MultipartConfig
public class PlantAddSuccess extends HttpServlet {

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
     * @throws IOException if an I/O error occurs Vorlage File Upload, aber
     * abgewandelt: https://docs.oracle.com/javaee/7/tutorial/servlets016.htm
     * Achtung: Der Code ERFORDERT ein Bild-Upload. Wenn der Bilder-Upload
     * optional werden soll, müssen entsprechende Zeilen an konditionale
     * Bedingungen was den Picture-Parameter angeht geknüpft werden. Update:
     * Bilder werden per FTP hochgeladen, weil der Proxy verhindert, dass das
     * Programm reguläre auf dem Server navigieren kann.
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        final Part filePart = request.getPart("picture");
        final String path = "/var/www/html/gardenly.garden/img/plants";
        final String fileName = GetFileName.of(filePart);

        OutputStream outputStream = null;
        InputStream filecontent = null;

        try (PrintWriter out = response.getWriter()) {
            // File Upload
            outputStream = new FileOutputStream(new File(path + File.separator + fileName));
            filecontent = filePart.getInputStream();

            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = filecontent.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }

            outputStream.close();
            filecontent.close();
            
            // Form-Data to Database            
            String name = request.getParameter("p_name").trim();
            String watering = request.getParameter("watering");
            String orderBiology = request.getParameter("orderBiology").trim();
            String familyBiology = request.getParameter("familyBiology").trim();
            String subfamilyBiology = request.getParameter("subfamilyBiology").trim();
            String scientificName = request.getParameter("scientificName").trim();
            Integer growingHeight = Integer.parseInt(request.getParameter("growingHeight"));
            String careRecommendations = request.getParameter("careRecommendations");
            String picturePath = fileName;
            User user = um.getUser();
            String location = GetLocation.of(request);

            Plant plant = new Plant(name, location, watering, orderBiology, familyBiology, subfamilyBiology, growingHeight, careRecommendations, picturePath, user, scientificName);
            pm.setPlant(plant);
            pm.create(plant);
            pm.setErrors(false);

            RequestDispatcher rd
                    = request.getRequestDispatcher("PlantAddSuccess.jsp");
            rd.forward(request, response);

            // TODO: 
            // Catch für NullPointerException einbauen, falls beim Request etwas von der Benutzeringabe fehlt.
        } catch (FileNotFoundException fne) {
            pm.setErrors(true);
            pm.setStatus("Die Datei zum hochladen konnte auf dem Quellgerät nicht gefunden werden.");
            fne.printStackTrace();
        } catch (IOException ex) {
            pm.setErrors(true);
            pm.setStatus("Die Datei konnte nicht hochgeladen werden, auf dem Server ist ein Fehler aufgetreten.");
            ex.printStackTrace();
        } catch (Exception e) {
            pm.setErrors(true);
            pm.setStatus("Unbekanntes Problem aufgetreten.");
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

}
