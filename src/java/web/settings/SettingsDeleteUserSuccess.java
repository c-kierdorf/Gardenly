package web.settings;

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
import javax.servlet.http.HttpSession;
import model.user.UserManager;
import model.userplant.UserPlantManager;

/**
 *
 * @author CK
 */
@WebServlet(name = "SettingsUserDelete", urlPatterns = {"/settings/SettingsDeleteUserSuccess"})
public class SettingsDeleteUserSuccess extends HttpServlet {

    @Inject
    private UserManager um;
    @Inject
    private UserPlantManager upm;

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

            // get user data from db
            User user = um.getUser();
            if (user != null) {
                // delete userPlants if exists
                List<UserPlant> userPlants = upm.findUserPlantsByUserFk(user);
                if (userPlants != null) {
                    userPlants.stream()
                              .forEach(i -> upm.delete(i));
                }

                // Delete user
                um.delete(user);
                um.setErrors(false);
            } else {
                um.setErrors(true);
                um.setStatus("User nicht eingeloggt oder existiert nicht mehr in der Datenbank.");
            }

            // logout process
            um.setUser(null);
            HttpSession session = request.getSession();
            session.invalidate();
            request.logout();

            // forward to success page
            RequestDispatcher rd
                    = request.getRequestDispatcher("SettingsDeleteUserSuccess.jsp");
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
