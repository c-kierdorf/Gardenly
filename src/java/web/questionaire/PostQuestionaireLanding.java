package web.questionaire;

import db.PostQuestionaire;
import db.Participant;
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
import model.postquestionaire.PostQuestionaireManager;
import model.participant.ParticipantManager;

/**
 *
 * @author CK
 */
@WebServlet(name = "PostQuestionaireLanding", urlPatterns = {"/evaluation/PostQuestionaireLanding"})
public class PostQuestionaireLanding extends HttpServlet {

    @Inject
    private ParticipantManager pam;
    @Inject
    private PostQuestionaireManager postqm;

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
            List<Participant> participants = pam.findParticipantByName(nickName);
            if (!participants.isEmpty()) {
                Participant participant = participants.get(0);
                pam.setParticipant(participant);
                postqm.setErrors(false);

                String q1 = request.getParameter("q1");
                String q2 = request.getParameter("q2");
                String q3 = request.getParameter("q3");
                String q4 = request.getParameter("q4");
                String q5 = request.getParameter("q5");
                String q6 = request.getParameter("q6");
                String q7 = request.getParameter("q7");
                String q8 = request.getParameter("q8");
                String q9 = request.getParameter("q9");
                String q10 = request.getParameter("q10");
                String q11 = request.getParameter("q11");
                String q12 = request.getParameter("q12");
                String q13 = request.getParameter("q13");
                String q14 = request.getParameter("q14");
                String q15 = request.getParameter("q15");
                String q16 = request.getParameter("q16");
                String q17 = request.getParameter("q17");
                String q18 = request.getParameter("q18");
                String q19 = request.getParameter("q19");
                String kritik = request.getParameter("kritik");
                String lob = request.getParameter("lob");
                String weiterentwicklung = request.getParameter("weiterentwicklung");
                
                Date date = new Date();
                
                PostQuestionaire postQuestionaire
                        = new PostQuestionaire(participant, 
                                                q1,
                                                q2,
                                                q3,
                                                q4,
                                                q5,
                                                q6,
                                                q7,
                                                q8,
                                                q9,
                                                q10,
                                                q11,
                                                q12,
                                                q13,
                                                q14,
                                                q15,
                                                q16,
                                                q17,
                                                q18,
                                                q19,
                                                kritik,
                                                lob,
                                                weiterentwicklung,
                                                date);

                postqm.create(postQuestionaire);

                SendPostQuestionaireEmail postEmail = new SendPostQuestionaireEmail();

                boolean sendPostEmail = postEmail.sendEmail(nickName,
                                                            participant.getEmail(),
                                                            q1,
                                                            q2,
                                                            q3,
                                                            q4,
                                                            q5,
                                                            q6,
                                                            q7,
                                                            q8,
                                                            q9,
                                                            q10,
                                                            q11,
                                                            q12,
                                                            q13,
                                                            q14,
                                                            q15,
                                                            q16,
                                                            q17,
                                                            q18,
                                                            q19,
                                                            kritik,
                                                            lob,
                                                            weiterentwicklung);

                if (sendPostEmail) {
                    postqm.setErrors(false);
                } else {
                    postqm.setErrors(true);
                    postqm.setStatus("Daten gespeichert, aber Fehler beim Senden der E-Mail");
                }

            } else {
                postqm.setErrors(true);
                postqm.setStatus("Keine Einträge zum Namen " + nickName + " gefunden.");
            }

            RequestDispatcher rd
                    = request.getRequestDispatcher("PostQuestionaireLanding.jsp");
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
