package web.userplants;

import db.UserPlant;
import java.io.IOException;
import java.io.PrintWriter;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.currentweatherapi.WeatherJsonObject;
import model.currentweatherapi.WeatherManager;
import model.userplant.UserPlantManager;

/**
 *
 * @author CK
 */
@WebServlet(name = "UserPlantDetails", urlPatterns = {"/UserPlantDetails"})
public class UserPlantDetails extends HttpServlet {
    
    @Inject
    private UserPlantManager upm;
    @Inject
    private WeatherManager wm;

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
            Integer id = Integer.parseInt(request.getParameter("up_id"));
            UserPlant userPlant = upm.findUserPlantById(id);
            
            if(userPlant != null) {
                upm.setUserPlant(userPlant);
                upm.setErrors(false);
            } else {
                upm.setErrors(true);
                upm.setStatus("User Pflanze mit ID '" + id + " konnte nicht gefunden werden.");
            }
            
            // Get current weather
            WeatherJsonObject weatherJsonObject = null;
            try {
                weatherJsonObject = wm.getCurrentWeather();
            } catch (NullPointerException npe) {
                npe.printStackTrace();
                wm.setErrors(true);
                wm.setStatus("openweathermap kann nicht geladen werden.");
            } catch (Exception e) {
                e.printStackTrace();
                wm.setErrors(true);
                wm.setStatus("Beim Laden des Wetters ist ein unbekannter Fehler aufgetreten.");
            }
            
            if (weatherJsonObject != null) {
                wm.setErrors(false);
                wm.setWeatherJsonObject(weatherJsonObject);    
            } else {
                wm.setErrors(true);
                wm.setStatus("Es wurde keine Instanz von weatherJsonObject angelegt.");
            }
            
            RequestDispatcher rd
                    = request.getRequestDispatcher("/user-plants/UserPlantDetails.jsp");
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
