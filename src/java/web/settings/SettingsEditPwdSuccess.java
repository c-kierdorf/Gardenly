package web.settings;

import db.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.user.PwdHashing;
import model.user.UserManager;

/**
 *
 * @author CK
 */
@WebServlet(name = "SettingsEditPwdSuccess", urlPatterns = {"/settings/SettingsEditPwdSuccess"})
public class SettingsEditPwdSuccess extends HttpServlet {

    @Inject
    private UserManager um;

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

            Integer id = Integer.parseInt(request.getParameter("u_id"));
            String oldPwdUnhashed = request.getParameter("oldPwd").trim();
            String oldPwdHashed = PwdHashing.pwdHashed(oldPwdUnhashed);
            String newPwdUnhashed = request.getParameter("newPwd").trim();
            String newPwdHashed = PwdHashing.pwdHashed(newPwdUnhashed);

            User user = um.findUserById(id);

            if (user.getPwdHash().equals(oldPwdHashed)) {
                user.setPwdHash(newPwdHashed);
                um.setUser(user);
                um.update(user);
                um.setErrors(false);
            } else {
                um.setErrors(true);
                um.setStatus("Das alte Passwort ist falsch.<br />Das Passwort wurde nicht geändert.");
            }

            RequestDispatcher rd
                    = request.getRequestDispatcher("/settings/SettingsEditPwdSuccess.jsp");
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
