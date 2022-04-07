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
     * https://gardenly.garden/Watering?id=9&waterlevel=77
     * https://gardenly.garden/Watering?id=9&watering=now
     * https://gardenly.garden/Watering?id=9&waterlevel=70&watering=now
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            upm.setErrors(false);
            Integer id = Integer.parseInt(request.getParameter("id"));
            UserPlant userPlant = upm.findUserPlantById(id);

            if (userPlant != null) {

                // Watering
                String watering = request.getParameter("watering");
                if (watering != null) {
                    if (watering.equals("now")) {
                        Date date = new Date();
                        userPlant.setWateringDate(date);
                    } else {
                        upm.setErrors(true);
                        upm.setStatus("Es wurde kein gültiges Schlüsselwort für das bewässern angegben.");
                    }
                }

                // Waterlevel
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

                upm.setUserPlant(userPlant);
                upm.update(userPlant);
            } else {
                upm.setErrors(true);
                upm.setStatus("Die Pflanze mit der ID '" + id + "' wurde nicht gefunden.");
            }

            RequestDispatcher rd
                    = request.getRequestDispatcher("/watering/Watering.jsp");
            rd.forward(request, response);
        } catch (NullPointerException npe) {
            System.out.println("Der GET-Request entspricht nicht dem erwarteten Pattern.");
            npe.printStackTrace();
        } catch (Exception e) {
            System.out.println("Unbekannter Fehler.");
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
