package web.userplants;

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
import model.userplant.UserPlantManager;

/**
 *
 * @author CK
 *
 * @version 1.0 Die Klasse setzt den Wert "waterNow" einer UserPlant auf true
 * und löst damit einen manuellen Bewässerungsprozess aus, sofern alle
 * erforderlichen Bedingungen erfüllt sind.
 */
@WebServlet(name = "UserPlantWaterNowSuccess", urlPatterns = {"/UserPlantWaterNowSuccess"})
public class UserPlantWaterNowSuccess extends HttpServlet {

    @Inject
    private UserPlantManager upm;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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

            List<UserPlant> userPlants = upm.findAll();

            if (userPlants != null) {
                userPlants.removeIf(i -> i.isIsConnected() != true);

                try {
                    UserPlant userPlantConnected = userPlants.get(0);
                    Integer id = Integer.parseInt(request.getParameter("up_id"));
                    UserPlant userPlant = upm.findUserPlantById(id);
                    if (userPlant != null) {
                        if (userPlantConnected.getPlantsFk().getPlantsId().equals(userPlant.getPlantsFk().getPlantsId())) {
                            if ((userPlant.getSoilmoistureNow() <= 30)
                                    && (userPlant.getWaterlevel() >= 40)
                                    && (userPlant.isAutomaticWatering() == false)
                                    && (userPlant.isIsConnected() == true)) {
                                userPlant.setWaterNow(true);
                                upm.setUserPlant(userPlant);
                                upm.update(userPlant);
                                upm.setErrors(false);
                            } else {
                                upm.setErrors(true);
                                upm.setStatus("Die Pflanze mit der ID " + id + " kann nicht bewässert werden, weil sie genug Bodenfeuchtigkeit hat, das manuelle Bewässern nicht aktiviert ist oder sich zu wenig Wasser im Wassertank befindet.");
                            }
                        } else {
                            upm.setErrors(true);
                            upm.setStatus("Die Pflanze  mit der ID " + id + " ist nicht mit der Hardware ID 1 verbunden.");
                        }
                    } else {
                        upm.setErrors(true);
                        upm.setStatus("Die Pflanze  mit der ID " + id + " konnte nicht in der DB gefunden werden.");
                    }

                } catch (ArrayIndexOutOfBoundsException e) {
                    upm.setErrors(true);
                    upm.setStatus("Es ist derzeit keine Pflanze mit der Hardware ID 1 verbunden.");
                    e.printStackTrace();
                }

            } else {
                upm.setErrors(true);
                upm.setStatus("Es wurden noch keine UserPlants angelegt.");
            }

            RequestDispatcher rd
                    = request.getRequestDispatcher("/user-plants/UserPlantWaterNowSuccess.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
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
