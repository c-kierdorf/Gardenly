package web.index;

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
import model.user.PwdHashing;
import model.user.SendEmailAlfa;
import model.user.UserManager;

/**
 *
 * @author CK
 */
@WebServlet(name = "RegistrationSuccess", urlPatterns = {"/RegistrationSuccess"})
public class RegistrationSuccess extends HttpServlet {

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

            String vorname = request.getParameter("u_vorname");
            String nachname = request.getParameter("u_nachname");
            String email = request.getParameter("u_email").toLowerCase().trim();
            String pwdUnhashed = request.getParameter("u_pwd").trim();
            String pwdHashed = PwdHashing.pwdHashed(pwdUnhashed);
            List<User> users = um.findUserByEmail(email);

//            Ohne Email-Verifizierung
//            User user = new User(vorname, nachname, email, pwdHashed);

//            Mit Email-Verifizierung
            SendEmailAlfa sm = new SendEmailAlfa();
            String emailVerificationCode = sm.getRandom();
            User user = new User(vorname, nachname, email, pwdHashed, emailVerificationCode);

            RequestDispatcher rd;

            if (users.isEmpty()) {
                um.setErrors(false);
                um.setUser(user);
                um.create(user);
                boolean sendVerificationEmail = sm.sendEmail(user);
                if (sendVerificationEmail) {
                    rd = request.getRequestDispatcher("RegistrationSuccess.jsp");
                } else {
                    um.setErrors(true);
                    um.setStatus("Emailverifikation konnte nicht an " + email + " gesendet werden.");
                    rd = request.getRequestDispatcher("Register.jsp");
                }
            } else {
                um.setErrors(true);
                um.setStatus("Die Emailadresse " + email + " ist bereits vergeben.");
                rd = request.getRequestDispatcher("Register.jsp");

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
        String error = request.getParameter("error");
        if (error != null) {
            throw new ServletException("Test Servlet Error");
        }
        RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
        rd.forward(request, response);
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
