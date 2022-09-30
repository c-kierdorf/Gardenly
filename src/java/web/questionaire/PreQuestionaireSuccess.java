package web.questionaire;

import db.PreQuestionaire;
import db.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.prequestionaire.PreQuestionaireManager;
import model.subject.SubjectManager;

/**
 *
 * @author CK
 */
@WebServlet(name = "PreQuestionaireSuccess", urlPatterns = {"/evaluation/PreQuestionaireSuccess"})
public class PreQuestionaireSuccess extends HttpServlet {

    @Inject
    private SubjectManager sm;
    @Inject
    private PreQuestionaireManager preqm;

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
            List<Subject> subjects = sm.findSubjectByName(nickName);
            if (!subjects.isEmpty()) {
                Subject subject = subjects.get(0);
                sm.setSubject(subject);
                preqm.setErrors(false);

                String technik = request.getParameter("technik");
                String erwartungen = request.getParameter("erwartungen");
                Date date = new Date();

                PreQuestionaire preQuestionaire
                        = new PreQuestionaire(subject, technik, erwartungen, date);

                preqm.create(preQuestionaire);

                SendPreQuestionaireEmail preEmail = new SendPreQuestionaireEmail();

                boolean sendPreEmail = preEmail.sendEmail(nickName,
                                                            subject.getEmail(),
                                                            technik,
                                                            erwartungen);

                if (sendPreEmail) {
                    preqm.setErrors(false);
                } else {
                    preqm.setErrors(true);
                    preqm.setStatus("Daten gespeichert, aber Fehler beim Senden der E-Mail");
                }

            } else {
                preqm.setErrors(true);
                preqm.setStatus("Keine Einträge zum Namen " + nickName + " gefunden.");
            }
            RequestDispatcher rd
                = request.getRequestDispatcher("PreQuestionaireSuccess.jsp");
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
