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
@WebServlet(name = "Connect", urlPatterns = {"/Connect"})
public class Connect extends HttpServlet {

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
     * @throws IOException if an I/O error occurs API zur Verbindung mit dem
     * Gardenly Hardware Modul (Raspberry Pi Pico)
     * http://gardenly.garden:3080/Connect?moist=80temp=21&hum=40&liqLvl=1
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");                
        response.setCharacterEncoding("UTF-8");                     
        try (PrintWriter out = response.getWriter()) {
            UserPlantJson userPlantJson = new UserPlantJson();
            String userPlantJsonString = "";

            List<UserPlant> userPlants = upm.findAll();
            if (userPlants != null) {
                userPlants.removeIf(i -> i.isIsConnected() != true);

                try {
                    upm.setErrors(false);
                    UserPlant userPlant = userPlants.get(0);

                    // connection between raspberry pi pico and gardenly:
                    userPlantJson.setId(userPlant.getUserPlantsId());
                    userPlantJson.setName(userPlant.getUserPlantName());
                    userPlantJson.setTransferIntervall(userPlant.getTransferInterval());
                    userPlantJson.setWaterNow(userPlant.isWaterNow());
                    userPlantJsonString = gson.toJson(userPlantJson);
                    out.print(userPlantJsonString);

                    // reading parameters with sensor data and saving to db
                    userPlant = transferSensorData(request, response, userPlant);

                    // automatic watering if neccesary
                    userPlant = automaticWatering(userPlant);

                    // calculate health
                    userPlant = calculateHealth(userPlant);

                    //safe changes to DB
                    upm.setUserPlant(userPlant);
                    upm.update(userPlant);
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
    private UserPlant transferSensorData(HttpServletRequest request,
            HttpServletResponse response,
            UserPlant userPlant)
            throws ServletException, IOException {
        
        // transferDate
        Date date = new Date();
        userPlant.setTransferDate(date);

        // soilmoisture
        String soilmoisture = request.getParameter("moist");
        if (soilmoisture != null) {
            try {
                Integer soilmoistureInt = Integer.parseInt(soilmoisture);
                userPlant.setSoilmoistureNow(soilmoistureInt);
            } catch (NumberFormatException nfe) {
                upm.setErrors(true);
                upm.setStatus("Es wurde keine gültige Zahl für die Bodenfeuchtigkeit eingegeben.");
                System.out.println("Es wurde keine gültige Zahl für die Bodenfeuchtigkeit eingegeben.");
                nfe.printStackTrace();
            }
        }

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

        // light
        String light = request.getParameter("light");
        if (light != null) {
            try {
                boolean lightBool = Boolean.parseBoolean(light);
                userPlant.setLightNow(lightBool);
            } catch (NumberFormatException nfe) {
                upm.setErrors(true);
                upm.setStatus("Es wurde kein gültiger boolscher Wert für den Lichteinfluss angegeben.");
                System.out.println("Es wurde kein gültiger boolscher Wert für den Lichteinfluss angegeben.");
                nfe.printStackTrace();
            }
        }

        return userPlant;

    }// </editor-fold>

    // <editor-fold defaultstate="collapsed" desc="automaticWatering method. Click on the + sign on the left to edit the code.">
    private UserPlant automaticWatering(UserPlant userPlant) {
        if ((userPlant.getSoilmoistureNow() <= 30)
                && (userPlant.getWaterlevel() >= 40)
                && (userPlant.isAutomaticWatering() == true)
                && (userPlant.isIsConnected() == true)) {
            userPlant.setWaterNow(true);
        }
        return userPlant;
    }// </editor-fold>

    // <editor-fold defaultstate="collapsed" desc="calculateHealth method. Click on the + sign on the left to edit the code.">
    public UserPlant calculateHealth(UserPlant userPlant) {
        if (userPlant.getSoilmoistureNow() < 30) {
            userPlant.setHealth("Trockene Erde");
        } else if (userPlant.getTemperatureNow() > 35) {
            userPlant.setHealth("Hitze");
        } else if (userPlant.getTemperatureNow() < 5) {
            userPlant.setHealth("Kälte");
        } else if (userPlant.getHumidityNow() < 40) {
            userPlant.setHealth("Trockene Luft");
        } else if (userPlant.isLightNow() == false) {
            userPlant.setHealth("Lichtmangel");
        } else {
            userPlant.setHealth("OK");
        }
        return userPlant;
    }// </editor-fold>
}
