package web.userplants;

import db.Plant;
import java.io.IOException;
import java.io.PrintWriter;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.plant.PlantManager;

/**
 *
 * @author crill
 */
@WebServlet(name = "GetPlantDetails", urlPatterns = {"/GetPlantDetails"})
public class GetPlantDetails extends HttpServlet {
    
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
            Integer plantId = Integer.parseInt(request.getParameter("id"));
            
            Plant plant = pm.findPlantById(plantId);
            
            out.println("<div class='field'>\n"+ 
"                <img src='/img/plants/" + plant.getPicturePath() +"' width='50' alt='Foto der Pflanze'/><br />" +
"                    <label for='orderBiology'>Ordnung</label>\n" +
"                    <input type='text' \n" +
"                           id='orderBiology' \n" +
"                           name='orderBiology' \n" +
"                           value='" + plant.getOrderBiology() + "'\n" +
"                           readonly>\n" +
"                </div>\n" +
"                <div class='field'>\n" +
"                    <label for='familyBiology'>Familie</label>\n" +
"                    <input type='text' \n" +
"                           id='familyBiology' \n" +
"                           name='familyBiology' \n" +
"                           value='" + plant.getFamilyBiology() + "'\n" +
"                           readonly>\n" +
"                </div>\n" +
"                <div class='field'>\n" +
"                    <label for='subfamilyBiology'>Unterfamilie</label>\n" +
"                    <input type='text' \n" +
"                           id='subfamilyBiology' \n" +
"                           name='subfamilyBiology' \n" +
"                           value='" + plant.getSubfamilyBiology() + "'\n" +
"                           readonly>\n" +
"                </div>\n" +
"                <div class='field'>\n" +
"                    <label for='growingHeight'>Wuchshöhe in cm</label>\n" +
"                    <input type='text' \n" +
"                           id='growingHeight' \n" +
"                           name='growingHeight' \n" +
"                           value='" + plant.getGrowingHeight() + "'\n" +
"                           readonly>\n" +
"                </div>\n" +
"                <div class='field'>\n" +
"                    <label for='watering'>Gießempfehlung</label>\n" +
"                    <input type='text' \n" +
"                           id='watering' \n" +
"                           name='watering' \n" +
"                           value='" + plant.getWatering() + "'\n" +
"                           readonly>\n" +
"                </div>\n" +
"                <div class='field'>\n" +
"                    <label for='careRecommendations'>Pflegeaufwand</label>\n" +
"                    <input type='text' \n" +
"                           id='careRecommendations' \n" +
"                           name='careRecommendations' \n" +
"                           value='" + plant.getCareRecommendations() + "'\n" +
"                           readonly>\n" +
"                </div>         ");
            
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
