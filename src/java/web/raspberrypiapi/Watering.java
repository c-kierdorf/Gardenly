package web.raspberrypiapi;

import com.google.gson.Gson;
import db.UserPlant;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.userplant.UserPlantManager;

/**
 *
 * @author CK
 */
@WebServlet(name = "Watering", urlPatterns = {"/Watering"})
public class Watering extends HttpServlet {

    @Inject
    private UserPlantManager upm;
    private Gson gson = new Gson();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs Allowed GET-Request-patterns:
     *
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            UserPlantJson userPlantJson = new UserPlantJson();
            String userPlantJsonString = "";
            Date date = new Date();

            List<UserPlant> userPlants = upm.findAll();
            if (userPlants != null) {
                userPlants.removeIf(i -> i.isIsConnected() != true);

                try {

                    UserPlant userPlantConnected = userPlants.get(0);
                    Integer id = Integer.parseInt(request.getParameter("id"));
                    UserPlant userPlant = upm.findUserPlantById(id);
                    if (userPlantConnected.getPlantsFk().getPlantsId().equals(userPlant.getPlantsFk().getPlantsId())) {
                        userPlant.setWaterNow(false);
                        userPlant.setWateringDate(date);
                        upm.update(userPlant);
                        userPlantJson.setId(userPlant.getUserPlantsId());
                        userPlantJson.setName(userPlant.getUserPlantName());
                        userPlantJson.setTransferIntervall(userPlant.getTransferInterval());
                        userPlantJson.setWaterNow(userPlant.isWaterNow());
                        userPlantJsonString = gson.toJson(userPlantJson);
                        out.print(userPlantJsonString);
                        upm.setErrors(false);
                    } else {
                        upm.setErrors(true);
                        upm.setStatus("Die UserPlant mit der ID " + id + " ist nicht mit der Hardware ID 1 verbunden.");
                    }
                } catch (ArrayIndexOutOfBoundsException e) {
                    upm.setErrors(true);
                    upm.setStatus("Es ist derzeit keine UserPlant mit der Hardware ID 1 verbunden.");
                }
            } else {
                upm.setErrors(true);
                upm.setStatus("Es wurden noch keine UserPlants angelegt.");
            }
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
