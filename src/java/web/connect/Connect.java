package web.connect;

import com.google.gson.Gson;
import db.UserPlant;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
 */
@WebServlet(name = "Connect", urlPatterns = {"/Connect"})
public class Connect extends HttpServlet {

    @Inject
    private UserPlantManager upm;
    private Gson gson = new Gson(); // für json request raspberry pi pico

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs API zur Verbindung mit dem
     * Gardenly Hardware Modul (Raspberry Pi Pico)
     * http://gardenly.garden:3080/Connect?temp=30&hum=40&liqLvl=1
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");       für html request Arduino
        response.setContentType("application/json");                //für json request raspberry pi pico
        response.setCharacterEncoding("UTF-8");                     //für json request raspberry pi pico
        try (PrintWriter out = response.getWriter()) {
            UserPlantJson userPlantJson = new UserPlantJson();
            String userPlantJsonString = "";

            List<UserPlant> userPlants = upm.findAll();
            if (userPlants != null) {
                userPlants.removeIf(i -> i.isIsConnected() != true);

                try {
                    upm.setErrors(false);
                    UserPlant userPlant = userPlants.get(0);
                    upm.setUserPlant(userPlant);
                    // connection between raspberry pi pico and gardenly:
                    userPlantJson.setId(userPlant.getUserPlantsId());
                    userPlantJson.setName(userPlant.getUserPlantName());
                    userPlantJson.setTransferIntervall(userPlant.getTransferInterval());
                    userPlantJsonString = gson.toJson(userPlantJson);
                    out.print(userPlantJsonString);
                    transferSensorData(request, response, userPlant);
                } catch (ArrayIndexOutOfBoundsException e) {
                    upm.setErrors(true);
                    upm.setStatus("Es ist derzeit keine UserPlant mit der Hardware ID 1 verbunden.");
                    userPlantJson.setId(0);       // für json request raspberry pi pico
                    userPlantJson.setName("null");
                    userPlantJson.setTransferIntervall(0);
                    userPlantJsonString = gson.toJson(userPlantJson);
                    out.print(userPlantJsonString);
                    e.printStackTrace();
                }

            } else {
                upm.setErrors(true);
                upm.setStatus("Es wurden noch keine UserPlants angelegt");
            }

//            RequestDispatcher rd
//                    = request.getRequestDispatcher("/arduino/Connect.jsp");
//            rd.forward(request, response);
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

    // <editor-fold defaultstate="collapsed" desc="transferSensorData method. Click on the + sign on the left to edit the code.">
    private void transferSensorData(HttpServletRequest request,
            HttpServletResponse response,
            UserPlant userPlant)
            throws ServletException, IOException {

        // temperature
        String temperature = request.getParameter("temp");
        if (temperature != null) {
            try {
                Integer temperatureInt = Integer.parseInt(temperature);
                userPlant.setTemperatureNow(temperatureInt);
            } catch (NumberFormatException nfe) {
                upm.setErrors(true);
                upm.setStatus("Es wurde keine gültige Zahl für die Temperatur eingegeben.");
                System.out.println("Es wurde keine gültige Zahl für die Temperatur eingegeben.");
                nfe.printStackTrace();
            }
        }

        // humidity
        String humidity = request.getParameter("hum");
        if (humidity != null) {
            try {
                Integer humidityInt = Integer.parseInt(humidity);
                userPlant.setHumidityNow(humidityInt);
            } catch (NumberFormatException nfe) {
                upm.setErrors(true);
                upm.setStatus("Es wurde keine gültige Zahl für die Luftfeuchtigkeit eingegeben.");
                System.out.println("Es wurde keine gültige Zahl für die Luftfeuchtigkeit eingegeben.");
                nfe.printStackTrace();
            }
        }

        // waterlevel
        String waterlevel = request.getParameter("liqLvl");
        if (waterlevel != null) {
            try {
                Integer waterlevelInt = Integer.parseInt(waterlevel);
                userPlant.setWaterlevel(waterlevelInt);
            } catch (NumberFormatException nfe) {
                upm.setErrors(true);
                upm.setStatus("Es wurde keine gültige Zahl für den Wasserstand eingegeben.");
                System.out.println("Es wurde keine gültige Zahl für den Wasserstand eingegeben.");
                nfe.printStackTrace();
            }
        }

        // watering
        String watering = request.getParameter("watering");
        if (watering != null) {
            if (watering.equals("now")) {
                Date date = new Date();
                userPlant.setWateringDate(date);
            }
        }

//
//            // light
//            String light = request.getParameter("light");
//            if (light != null) {
//                try {
//                    Integer lightInt = Integer.parseInt(request.getParameter("light"));
//                    userPlant.setLightNow(lightInt);
//                } catch (NumberFormatException nfe) {
//                    upm.setErrors(true);
//                    upm.setStatus("Es wurde keine gültige Zahl für den Lichteinfluss eingegeben.");
//                    System.out.println("Es wurde keine gültige Zahl für den Lichteinfluss eingegeben.");
//                    nfe.printStackTrace();
//                }
//            }
//
//        // soilmoisture
//        String soilmoisture = request.getParameter("soilmoisture");
//        if (soilmoisture != null) {
//            try {
//                Integer soilmoistureInt = Integer.parseInt(request.getParameter("soilmoisture"));
//                userPlant.setSoilmoistureNow(soilmoistureInt);
//            } catch (NumberFormatException nfe) {
//                upm.setErrors(true);
//                upm.setStatus("Es wurde keine gültige Zahl für die Bodenfeuchtigkeit eingegeben.");
//                System.out.println("Es wurde keine gültige Zahl für die Bodenfeuchtigkeit eingegeben.");
//                nfe.printStackTrace();
//            }
//        }
        upm.setUserPlant(userPlant);
        upm.update(userPlant);

    }// </editor-fold>
}
