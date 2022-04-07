package web.plants;

import db.Plant;
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
 * @author crill
 */
@WebServlet(name = "PlantEditSuccess", urlPatterns = {"/plants/PlantEditSuccess"})
@MultipartConfig
public class PlantEditSuccess extends HttpServlet {

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

        String picturePath = "";

        try (PrintWriter out = response.getWriter()) {
            // File Upload
            if (request.getParameter("pictureYes") != null) {
                final Part filePart = request.getPart("picture");
                final String path = "/var/www/html/gardenly.garden/img/plants";
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

            // Form-Data to Database           
            String pid = request.getParameter("p_id");
            Integer id = Integer.parseInt(pid);
            String name = request.getParameter("p_name").trim();
            String watering = request.getParameter("watering");
            String orderBiology = request.getParameter("orderBiology").trim();
            String familyBiology = request.getParameter("familyBiology").trim();
            String subfamilyBiology = request.getParameter("subfamilyBiology").trim();
            Integer growingHeight = Integer.parseInt(request.getParameter("growingHeight"));
            String careRecommendations = request.getParameter("careRecommendations");
            String location = GetLocation.of(request);

            Plant plant = pm.findPlantById(id);
            plant.setName(name);
            plant.setWatering(watering);
            plant.setOrderBiology(orderBiology);
            plant.setFamilyBiology(familyBiology);
            plant.setSubfamilyBiology(subfamilyBiology);
            plant.setGrowingHeight(growingHeight);
            plant.setCareRecommendations(careRecommendations);
            if (!picturePath.equals("")) {
                plant.setPicturePath(picturePath);
            }
            if (!location.equals("")) {
                plant.setLocation(location);
            }

            pm.setPlant(plant);
            pm.update(plant);
            pm.setErrors(false);

            RequestDispatcher rd
                    = request.getRequestDispatcher("PlantEditSuccess.jsp");
            rd.forward(request, response);

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
