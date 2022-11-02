package web.questionaire;

import db.PreQuestionaire;
import db.Participant;
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
import model.prequestionaire.PreQuestionaireManager;
import model.participant.ParticipantManager;

/**
 *
 * @author CK
 */
@WebServlet(name = "PreQuestionaireLanding", urlPatterns = {"/evaluation/PreQuestionaireLanding"})
public class PreQuestionaireLanding extends HttpServlet {

    @Inject
    private ParticipantManager pam;
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

            Integer participantId = Integer.parseInt(request.getParameter("nickName"));
            Participant participant = pam.findParticipantById(participantId);

            pam.setParticipant(participant);

            String haeufigkeitPflanzenpflege = request.getParameter("haeufigkeitPflanzenpflege");
            String erfahrungAutomatisiertePflanzenpflege = request.getParameter("erfahrungAutomatisiertePflanzenpflege");
            String technik = request.getParameter("technik");
            String smartHome = request.getParameter("smartHome");
            String erwartungen = request.getParameter("erwartungen");
            Date date = new Date();

            PreQuestionaire preQuestionaire = new PreQuestionaire(participant, 
                                                                  haeufigkeitPflanzenpflege,
                                                                  erfahrungAutomatisiertePflanzenpflege,
                                                                  technik, 
                                                                  smartHome, 
                                                                  erwartungen, 
                                                                  date);

            preqm.create(preQuestionaire);

            SendPreQuestionaireEmail preEmail = new SendPreQuestionaireEmail();

            boolean sendPreEmail = preEmail.sendEmail(participant.getNickName(),
                                                      participant.getEmail(),
                                                      haeufigkeitPflanzenpflege,
                                                      erfahrungAutomatisiertePflanzenpflege,
                                                      technik,
                                                      smartHome,
                                                      erwartungen);

            if (sendPreEmail) {
                preqm.setErrors(false);
            } else {
                preqm.setErrors(true);
                preqm.setStatus("Daten gespeichert, aber Fehler beim Senden der E-Mail");
            }

            RequestDispatcher rd
                    = request.getRequestDispatcher("PreQuestionaireLanding.jsp");
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
