package web.watering;

import db.UserPlant;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
 */
@WebServlet(name = "Watering", urlPatterns = {"/Watering"})
public class Watering extends HttpServlet {

    @Inject
    private UserPlantManager upm;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs Allowed GET-Request-patterns:
     * Der Arduino kann keine HTTPS Anfragen senden. Deshalb muss folgende URL
     * mit HTTP statt HTTPS verwendet werden:
     * http://gardenly.garden:3080/Watering?id=9&waterlevel=70&watering=now&humidity=12&light=50&temperature=12&soilmoisture=300
     *
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            wateringProcess(request, response);

            RequestDispatcher rd
                    = request.getRequestDispatcher("/arduino/Watering.jsp");
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

    // <editor-fold defaultstate="collapsed" desc="wateringProcess method. Click on the + sign on the left to edit the code.">
    private void wateringProcess(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        upm.setErrors(false);
        Integer id = Integer.parseInt(request.getParameter("id"));
        UserPlant userPlant = upm.findUserPlantById(id);

        if (userPlant != null) {

            // watering
            String watering = request.getParameter("watering");
            if (watering != null) {
                if (watering.equals("now")) {
                    Date date = new Date();
                    userPlant.setWateringDate(date);
                }
            }

            // waterlevel
            String waterlevel = request.getParameter("waterlevel");
            if (waterlevel != null) {
                try {
                    Integer waterlevelInt = Integer.parseInt(request.getParameter("waterlevel"));
                    userPlant.setWaterlevel(waterlevelInt);
                } catch (NumberFormatException nfe) {
                    upm.setErrors(true);
                    upm.setStatus("Es wurde keine gültige Zahl für den Wasserstand eingegeben.");
                    System.out.println("Es wurde keine gültige Zahl für den Wasserstand eingegeben.");
                    nfe.printStackTrace();
                }

            }

            // humidity
            String humidity = request.getParameter("humidity");
            if (humidity != null) {
                try {
                    Integer humidityInt = Integer.parseInt(request.getParameter("humidity"));
                    userPlant.setHumidityNow(humidityInt);
                } catch (NumberFormatException nfe) {
                    upm.setErrors(true);
                    upm.setStatus("Es wurde keine gültige Zahl für die Luftfeuchtigkeit eingegeben.");
                    System.out.println("Es wurde keine gültige Zahl für die Luftfeuchtigkeit eingegeben.");
                    nfe.printStackTrace();
                }
            }

            // light
            String light = request.getParameter("light");
            if (light != null) {
                try {
                    Integer lightInt = Integer.parseInt(request.getParameter("light"));
                    userPlant.setLightNow(lightInt);
                } catch (NumberFormatException nfe) {
                    upm.setErrors(true);
                    upm.setStatus("Es wurde keine gültige Zahl für den Lichteinfluss eingegeben.");
                    System.out.println("Es wurde keine gültige Zahl für den Lichteinfluss eingegeben.");
                    nfe.printStackTrace();
                }
            }

            // temperature
            String temperature = request.getParameter("temperature");
            if (temperature != null) {
                try {
                    Integer temperatureInt = Integer.parseInt(request.getParameter("temperature"));
                    userPlant.setTemperatureNow(temperatureInt);
                } catch (NumberFormatException nfe) {
                    upm.setErrors(true);
                    upm.setStatus("Es wurde keine gültige Zahl für die Temperatur eingegeben.");
                    System.out.println("Es wurde keine gültige Zahl für die Temperatur eingegeben.");
                    nfe.printStackTrace();
                }
            }

            // soilmoisture
            String soilmoisture = request.getParameter("soilmoisture");
            if (soilmoisture != null) {
                try {
                    Integer soilmoistureInt = Integer.parseInt(request.getParameter("soilmoisture"));
                    userPlant.setSoilmoistureNow(soilmoistureInt);
                } catch (NumberFormatException nfe) {
                    upm.setErrors(true);
                    upm.setStatus("Es wurde keine gültige Zahl für die Bodenfeuchtigkeit eingegeben.");
                    System.out.println("Es wurde keine gültige Zahl für die Bodenfeuchtigkeit eingegeben.");
                    nfe.printStackTrace();
                }
            }

            upm.setUserPlant(userPlant);
            upm.update(userPlant);
        } else {
            upm.setErrors(true);
            upm.setStatus("Die Pflanze mit der ID '" + id + "' wurde nicht gefunden.");
        }
    }// </editor-fold>

    private void calculateHealth(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
