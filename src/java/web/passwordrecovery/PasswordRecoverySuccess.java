package web.passwordrecovery;

import db.User;
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
import model.user.PwdHashing;
import model.user.UserManager;

/**
 *
 * @author CK
 */
@WebServlet(name = "PasswordRecoverySuccess", urlPatterns = {"/passwordrecovery/PasswordRecoverySuccess"})
public class PasswordRecoverySuccess extends HttpServlet {

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
            String email = request.getParameter("email");
            String authcode = request.getParameter("authcode");
            String pwdUnhashed = request.getParameter("pwd");
            String pwdHashed = PwdHashing.pwdHashed(pwdUnhashed);
            List<User> users = um.findUserByEmail(email);
            User user = users.get(0);
            
            RequestDispatcher rd;

            if (user.getResetPassword() == true && user.getEmailVerificationCode().equals(authcode)) {
                um.setErrors(false);
                user.setResetPassword(false);
                user.setIsActive(true);
                user.setPwdHash(pwdHashed);
                um.setUser(user);
                um.update(user);
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                rd = request.getRequestDispatcher("PasswordRecoverySuccess.jsp");
            } else {
                um.setErrors(true);
                um.setStatus("Passwort ändern nicht möglich.");
                rd = request.getRequestDispatcher("/Gardenly/Login.jsp");
            }

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
