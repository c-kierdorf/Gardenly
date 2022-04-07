package web.userplants;

import db.Plant;
import db.UserPlant;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.plant.PlantManager;
import model.userplant.UserPlantManager;

/**
 *
 * @author CK
 */
@WebServlet(name = "UserPlantEdit", urlPatterns = {"/UserPlantEdit"})
public class UserPlantEdit extends HttpServlet {

    @Inject
    private UserPlantManager upm;
    @Inject
    private PlantManager pm;

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
            if (request.getParameter("up_id") != null) {
                Integer id = Integer.parseInt(request.getParameter("up_id"));
                UserPlant userPlant = upm.findUserPlantById(id);
                if (userPlant == null) {
                    upm.setErrors(true);
                    upm.setStatus("UserPlant mit ID '" + id + "' nicht gefunden.");
                } else {
                    upm.setErrors(false);
                    upm.setUserPlant(userPlant);
                }

                List<Plant> plants = pm.findAll();

                if (plants != null) {
                    pm.setErrors(false);
                    pm.setPlants(plants);
                } else {
                    pm.setErrors(true);
                    pm.setStatus("Keine Pflanzen in der Datenbank hinterlegt");
                }

            }
            RequestDispatcher rd
                    = request.getRequestDispatcher("/user-plants/UserPlantEdit.jsp");
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

}
