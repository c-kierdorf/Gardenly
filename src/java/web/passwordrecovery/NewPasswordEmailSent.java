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
import model.user.UserManager;

/**
 *
 * @author crill
 */
@WebServlet(name = "NewPasswordEmailSent", urlPatterns = {"/passwordrecovery/NewPasswordEmailSent"})
public class NewPasswordEmailSent extends HttpServlet {

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
            StringBuilder content = new StringBuilder();

            String email = request.getParameter("email");
            email = email.toLowerCase();
            List<User> users = um.findUserByEmail(email);

            RequestDispatcher rd;

            if (!users.isEmpty()) {
                User user = users.get(0);
                SendNewPwdEmail pwdmail = new SendNewPwdEmail();
                String emailVerificationCode = pwdmail.getRandom();
                user.setEmailVerificationCode(emailVerificationCode);
                boolean sendPwdRecoveryEmail = pwdmail.sendEmail(user);
                
                if (sendPwdRecoveryEmail) {
                    user.setResetPassword(true);    
                    um.update(user);
                    um.setErrors(false);
                    rd = request.getRequestDispatcher("NewPasswordEmailSent.jsp");
                } else {
                    um.setErrors(true);
                    um.setStatus("Die E-Mail konnte nicht versendet werden.");
                    rd = request.getRequestDispatcher("/Gardenly/Login.jsp");
                }
            } else {
                um.setErrors(true);
                um.setStatus("Die E-Mailadresse " + email + " existiert nicht.");
                rd = request.getRequestDispatcher("/Gardenly/Login.jsp");
            }

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
