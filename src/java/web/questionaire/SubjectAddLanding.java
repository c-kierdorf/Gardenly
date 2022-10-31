package web.questionaire;

import db.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.subject.SubjectManager;

/**
 *
 * @author crill
 */
@WebServlet(name = "SubjectAddLanding", urlPatterns = {"/evaluation/SubjectAddLanding"})
public class SubjectAddLanding extends HttpServlet {

    @Inject
    private SubjectManager sm;

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

            String nickName = request.getParameter("nickName");
            Integer age = Integer.parseInt(request.getParameter("age"));
            String gender = request.getParameter("gender");
            String email = request.getParameter("email");

            Subject subject = new Subject(nickName,
                                            age,
                                            gender,
                                            email);

            sm.setSubject(subject);
            sm.create(subject);
            sm.setErrors(false);
            
            RequestDispatcher rd
                = request.getRequestDispatcher("SubjectAddLanding.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            sm.setErrors(true);
            sm.setStatus("Unbekanntes Problem aufgetreten");
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
