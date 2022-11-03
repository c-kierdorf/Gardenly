package web.questionaire;

import db.PostQuestionaire;
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

            Integer participantId = Integer.parseInt(request.getParameter("participantId"));
            Participant participant = pam.findParticipantById(participantId);

            pam.setParticipant(participant);

            String pe1 = request.getParameter("pe1");
            String pe2 = request.getParameter("pe2");
            String pe3 = request.getParameter("pe3");
            String pe4 = request.getParameter("pe4");
            String ee1 = request.getParameter("ee1");
            String ee2 = request.getParameter("ee2");
            String ee3 = request.getParameter("ee3");
            String ee4 = request.getParameter("ee4");
            String si1 = request.getParameter("si1");
            String si2 = request.getParameter("si2");
            String si3 = request.getParameter("si3");
            String fc1 = request.getParameter("fc1");
            String fc2 = request.getParameter("fc2");
            String fc3 = request.getParameter("fc3");
            String fc4 = request.getParameter("fc4");
            String hm1 = request.getParameter("hm1");
            String hm2 = request.getParameter("hm2");
            String hm3 = request.getParameter("hm3");
            String pv1 = request.getParameter("pv1");
            String pv2 = request.getParameter("pv2");
            String pv3 = request.getParameter("pv3");
            String ht1 = request.getParameter("ht1");
            String ht2 = request.getParameter("ht2");
            String ht3 = request.getParameter("ht3");
            String ht4 = request.getParameter("ht4");
            String bi1 = request.getParameter("bi1");
            String bi2 = request.getParameter("bi2");
            String bi3 = request.getParameter("bi3");
            String use = request.getParameter("use");
            String sq1 = request.getParameter("sq1");
            String sq2 = request.getParameter("sq2");
            String sq3 = request.getParameter("sq3");
            String sq4 = request.getParameter("sq4");
            String sq5 = request.getParameter("sq5");
            String hq1 = request.getParameter("hq1");
            String hq2 = request.getParameter("hq2");
            String hq3 = request.getParameter("hq3");
            String hq4 = request.getParameter("hq4");
            String hq5 = request.getParameter("hq5");
            String lob = request.getParameter("lob");
            String kritik = request.getParameter("kritik");
            String weiterentwicklung = request.getParameter("weiterentwicklung");

            Date date = new Date();

            PostQuestionaire postQuestionaire
                    = new PostQuestionaire(participant,
                                            pe1,
                                            pe2,
                                            pe3,
                                            pe4,
                                            ee1,
                                            ee2,
                                            ee3,
                                            ee4,
                                            si1,
                                            si2,
                                            si3,
                                            fc1,
                                            fc2,
                                            fc3,
                                            fc4,
                                            hm1,
                                            hm2,
                                            hm3,
                                            pv1,
                                            pv2,
                                            pv3,
                                            ht1,
                                            ht2,
                                            ht3,
                                            ht4,
                                            bi1,
                                            bi2,
                                            bi3,
                                            use,
                                            sq1,
                                            sq2,
                                            sq3,
                                            sq4,
                                            sq5,
                                            hq1,
                                            hq2,
                                            hq3,
                                            hq4,
                                            hq5,
                                            lob,                
                                            kritik,
                                            weiterentwicklung,
                                            date);

            postqm.create(postQuestionaire);

            SendPostQuestionaireEmail postEmail = new SendPostQuestionaireEmail();

            boolean sendPostEmail = postEmail.sendEmail(participant,
                                                        pe1,
                                                        pe2,
                                                        pe3,
                                                        pe4,
                                                        ee1,
                                                        ee2,
                                                        ee3,
                                                        ee4,
                                                        si1,
                                                        si2,
                                                        si3,
                                                        fc1,
                                                        fc2,
                                                        fc3,
                                                        fc4,
                                                        hm1,
                                                        hm2,
                                                        hm3,
                                                        pv1,
                                                        pv2,
                                                        pv3,
                                                        ht1,
                                                        ht2,
                                                        ht3,
                                                        ht4,
                                                        bi1,
                                                        bi2,
                                                        bi3,
                                                        use,
                                                        sq1,
                                                        sq2,
                                                        sq3,
                                                        sq4,
                                                        sq5,
                                                        hq1,
                                                        hq2,
                                                        hq3,
                                                        hq4,
                                                        hq5,
                                                        lob,                
                                                        kritik,
                                                        weiterentwicklung);

            if (sendPostEmail) {
                postqm.setErrors(false);
            } else {
                postqm.setErrors(true);
                postqm.setStatus("Daten gespeichert, aber Fehler beim Senden der E-Mail");
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
