package web.userplants;

import db.Plant;
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

/**
 *
 * @author CK
 */
@WebServlet(name = "UserPlantAdd", urlPatterns = {"/UserPlantAdd"})
public class UserPlantAdd extends HttpServlet {
    
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
            
            List<Plant> plants = pm.findAll();
            
            if (plants != null) {
                pm.setErrors(false);
                pm.setPlants(plants);
            } else {
                pm.setErrors(true);
                pm.setStatus("Keine Pflanzen in der Datenbank hinterlegt");
            }
            
            //Query coming from PlantDetails.jsp
            String pid = request.getParameter("p_id");
            if (pid != null) {
                pm.setErrorsQueryPlantDetails(false);
                Integer id = Integer.parseInt(request.getParameter("p_id"));
                Plant plant = pm.findPlantById(id);
                pm.setPlant(plant);
            } else {
                pm.setErrorsQueryPlantDetails(true);
                pm.setPlant(null);
            }
            
            RequestDispatcher rd = request.getRequestDispatcher("/user-plants/UserPlantAdd.jsp");
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
