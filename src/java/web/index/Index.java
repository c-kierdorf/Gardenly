package web.index;

import db.User;
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
import model.currentweatherapi.WeatherJsonObject;
import model.currentweatherapi.WeatherManager;
import model.user.PwdHashing;
import model.user.UserManager;
import model.userplant.UserPlantManager;

/**
 *
 * @author CK
 */
@WebServlet(name = "Index", urlPatterns = {"/Index"})
public class Index extends HttpServlet {

    @Inject
    private UserManager um;
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

            RequestDispatcher rd;

            // Login process when User is logged out
            if (um.getUser() == null) {
                String email = request.getParameter("u_email");
                if (email != null) { // User hat versucht, sich einzuloggen
                    email = email.toLowerCase().trim();
                    String pwdUnhashed = request.getParameter("u_pwd");
                    String pwdHashed = PwdHashing.pwdHashed(pwdUnhashed);
                    List<User> usersEmail = um.findUserByEmail(email);
                    List<User> usersPwd = um.findUserByPwd(pwdHashed);

                    if (!usersEmail.isEmpty() && !usersPwd.isEmpty()) {
                        um.setErrors(false);
                        User user = usersEmail.get(0); // ganz wichtige Zeilen, damit
                        um.setUser(user);              // der User im Scope ist, um zu checken, ob er eingeloggt ist.
                        rd = request.getRequestDispatcher("index.jsp");

                        // List UserPlants process
                        List<UserPlant> userPlants = upm.findUserPlantsByUserFk(user);
                        if (!userPlants.isEmpty()) {
                            upm.setErrors(false);
                            upm.setUserPlants(userPlants);
                        } else {
                            upm.setErrors(true);
                            upm.setStatus("Du hast noch keine Pflanzen hinzugefügt.");
                        }
                    } else {
                        um.setErrors(true);
                        um.setStatus("Login leider nicht erfolgreich.<br />"
                                + "Vertippt oder <a href='#'>Passwort vergessen?</a>");
                        rd = request.getRequestDispatcher("Login.jsp");
                    }
                } else { // User zwar nicht eingeloggt, aber auch keinen Versuch gestartet
                    um.setErrors(false);
                    rd = request.getRequestDispatcher("Login.jsp");
                }

            } else { // user already logged in
                // List UserPlants process for already logged in users
                User user = um.getUser();
                List<UserPlant> userPlants = upm.findUserPlantsByUserFk(user);
                if (userPlants != null) {
                    upm.setErrors(false);
                    upm.setUserPlants(userPlants);
                } else {
                    upm.setErrors(true);
                    upm.setStatus("Du hast noch keine Pflanzen hinzugefügt.");
                }

                rd = request.getRequestDispatcher("index.jsp");
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

            // forward request
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
