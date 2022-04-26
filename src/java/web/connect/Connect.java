package web.connect;

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
 */
@WebServlet(name = "Connect", urlPatterns = {"/Connect"})
public class Connect extends HttpServlet {

    @Inject
    private UserPlantManager upm;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs Dient dazu, dem Arduino zu
     * sagen, welche UserPlant gerade aktiv sein soll. URL:
     * http://gardenly.garden:3080/Connect
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            List<UserPlant> userPlants = upm.findAll();
            if (userPlants != null) {
                userPlants.removeIf(i -> i.isIsConnected() != true);

                try {
                    upm.setErrors(false);
                    UserPlant userPlant = userPlants.get(0);
                    upm.setUserPlant(userPlant);
                } catch (ArrayIndexOutOfBoundsException e) {
                    upm.setErrors(true);
                    upm.setStatus("Es ist derzeit keine UserPlants mit der Hardware ID 1 verbunden.");
                    e.printStackTrace();
                }

            } else {
                upm.setErrors(true);
                upm.setStatus("Es wurden noch keine UserPlants angelegt");
            }

            RequestDispatcher rd
                    = request.getRequestDispatcher("/arduino/Connect.jsp");
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
