package web.Questionnaire;

import db.Participant;
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
import model.participant.ParticipantManager;

/**
 *
 * @author crill
 */
@WebServlet(name = "ParticipantAddLanding", urlPatterns = {"/evaluation/ParticipantAddLanding"})
public class ParticipantAddLanding extends HttpServlet {

    @Inject
    private ParticipantManager pam;

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

            if (participants.isEmpty()) { // check if name is already in use
                Integer age = Integer.parseInt(request.getParameter("age"));
                String gender = request.getParameter("gender");
                String education = request.getParameter("education");
                String profession = request.getParameter("profession");
                String consent = request.getParameter("consent");
                String email = request.getParameter("email");

                Participant participant = new Participant(nickName,
                        age,
                        gender,
                        education,
                        profession,
                        consent,
                        email);

                pam.setParticipant(participant);
                pam.create(participant);

                // send Regsitration Email
                SendParticipantEmail participantEmail = new SendParticipantEmail();

                boolean sendParticipantEmail = participantEmail.sendEmail(participant);

                if (sendParticipantEmail) {
                    pam.setErrors(false);
                } else {
                    pam.setErrors(true);
                    pam.setStatus("Daten gespeichert, aber Fehler beim Senden der E-Mail");
                }
            } else {
                pam.setErrors(true);
                pam.setStatus("Der Name ist bereits vergeben.");
            }

            RequestDispatcher rd
                    = request.getRequestDispatcher("ParticipantAddLanding.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            pam.setErrors(true);
            pam.setStatus("Unbekanntes Problem aufgetreten");
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
