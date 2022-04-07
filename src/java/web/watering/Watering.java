package web.watering;

import db.UserPlant;
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
import model.userplant.UserPlantManager;

/**
 *
 * @author CK
 */
@WebServlet(name = "Watering", urlPatterns = {"/Watering"})
public class Watering extends HttpServlet {

    @Inject
    private UserPlantManager upm;

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
            // expected pattern: https://gardenly.garden/Watering?id=9&waterlevel=70
            if (!(request.getParameter("id").equals("") && request.getParameter("waterlevel").equals(""))) {
                Integer id = Integer.parseInt(request.getParameter("id"));
                Integer waterlevel = Integer.parseInt(request.getParameter("waterlevel"));
                Date date = new Date();

                UserPlant userPlant = upm.findUserPlantById(id);
                if (userPlant != null) {
                    upm.setErrors(false);
                    userPlant.setWateringDate(date);
                    userPlant.setWaterlevel(waterlevel);
                    upm.setUserPlant(userPlant);
                    upm.update(userPlant);
                } else {
                    upm.setErrors(true);
                    upm.setStatus("Die Pflanze mit der ID '" + id + "' wurde nicht gefunden.");
                }
            } else {
                upm.setErrors(true);
                upm.setStatus("Die Bewässerung konnte nicht durchgeführt werden.");
            }

            RequestDispatcher rd
                    = request.getRequestDispatcher("/watering/Watering.jsp");
            rd.forward(request, response);
        } catch (NullPointerException npe) {
            System.out.println("Der GET-Request entspricht nicht dem erwarteten Pattern.");
            npe.printStackTrace();
        } catch (Exception e) {
            System.out.println("Unbekannter Fehler.");
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
