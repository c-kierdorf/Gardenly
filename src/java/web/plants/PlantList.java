package web.plants;

import db.Plant;
import java.io.File;
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
import model.plantidentify.PlantIdentifyManager;
import model.plantidentify.PlantJsonObject;

/**
 *
 * @author CK
 */
@WebServlet(name = "PlantList", urlPatterns = {"/plants/PlantList"})
@MultipartConfig
public class PlantList extends HttpServlet {

    @Inject
    private PlantManager pm;
    @Inject
    private PlantIdentifyManager pim;

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
            // query coming from URL /plants/PlantList
            String name = request.getParameter("p_name");
            if (name != null) {
                findPlantByName(request, response, name);
            }

            //query coming from URL /plants/PlantIdentify
            Part filePart = request.getPart("picture");
            if (filePart != null) {
                String picturePath = fileUpload(request, response);
                findPlantByScientificName(request, response, getIdentifiedPlant(picturePath));
                pim.setIdentified(true);
            } else {
                pim.setIdentified(false);
            }

            RequestDispatcher rd
                    = request.getRequestDispatcher("PlantList.jsp");
            rd.forward(request, response);
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

    // <editor-fold defaultstate="collapsed" desc="findPlantByName method. Click on the + sign on the left to edit the code.">
    private void findPlantByName(HttpServletRequest request, HttpServletResponse response, String name)
            throws ServletException, IOException {
        List<Plant> plants = pm.findPlantByName(name);
        if (!plants.isEmpty()) {
            pm.setPlants(plants);
            pm.setErrors(false);
        } else {
            pm.setErrors(true);
            pm.setStatus("Keine Einträge zu '" + name + "' gefunden.");
        }
    }// </editor-fold>

    // <editor-fold defaultstate="collapsed" desc="fileUpload method. Click on the + sign on the left to edit the code.">
    private String fileUpload(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String picturePath = "";
        Part filePart = request.getPart("picture");
        boolean isThereAFile = filePart.getSize() > 0;

        if (isThereAFile) {
            final String path = "/var/www/html/gardenly.garden/img/plant-identify";
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

    // <editor-fold defaultstate="collapsed" desc="getIdentifiedPlant method. Click on the + sign on the left to edit the code.">
    private String getIdentifiedPlant(String picturePath) {
        PlantJsonObject plantJsonObject = null;
        try {
            plantJsonObject = pim.getIdentifiedPlant(picturePath);
        } catch (NullPointerException npe) {
            npe.printStackTrace();
            pim.setErrors(true);
            pim.setStatus("plantnet.org API kann nicht geladen werden.");
        } catch (Exception e) {
            e.printStackTrace();
            pim.setErrors(true);
            pim.setStatus("Beim identifizieren der Pflanze ist ein unbekannter Fehler aufgetreten.");
        }

        if (plantJsonObject != null) {
            pim.setErrors(false);
            System.out.println("DAS IST DIE AUSGABE: " + plantJsonObject.getBestMatch());
            return plantJsonObject.getBestMatch();
        } else {
            pim.setErrors(true);
            pim.setStatus("Es wurde keine Instanz von plantJsonObject angelegt.");
            return "%";
        }
    }// </editor-fold>

    // <editor-fold defaultstate="collapsed" desc="findPlantByScientificName method. Click on the + sign on the left to edit the code.">
    private void findPlantByScientificName(HttpServletRequest request, HttpServletResponse response, String name)
            throws ServletException, IOException {
        List<Plant> plants = pm.findPlantByScientificName(name);
        if (!plants.isEmpty()) {
            pm.setPlants(plants);
            pm.setErrors(false);
        } else {
            pm.setErrors(true);
            pm.setStatus("Keine Einträge zu '" + name + "' gefunden.");
        }
    }// </editor-fold>
}
