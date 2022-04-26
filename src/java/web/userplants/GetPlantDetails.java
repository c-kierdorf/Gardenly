package web.userplants;

import db.Plant;
import java.io.IOException;
import java.io.PrintWriter;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.plant.PlantManager;

/**
 *
 * @author CK
 */
@WebServlet(name = "GetPlantDetails", urlPatterns = {"/GetPlantDetails"})
public class GetPlantDetails extends HttpServlet {

    @Inject
    private PlantManager pm;

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
        try ( PrintWriter out = response.getWriter()) {
            Integer plantId = Integer.parseInt(request.getParameter("id"));

            Plant plant = pm.findPlantById(plantId);

            out.println(""
                    + " <div class=\"flex flex-row flex-wrap w-full gap-3 items-start items-center\"><img src='/img/plants/" + plant.getPicturePath() + "' class='image-center' width='100' alt='Foto der Pflanze'/><br /></div>"
                    + "\n"
                    + "<div class=\"flex flex-row flex-wrap w-full gap-3 items-start items-center border-b-2 border-gray-300\">\n"     
                    + "                            <!-- cell left-->\n"
                    + "                            <div class=\"flex-none w-24 p-4 bg-white\">\n"
                    + "                                <p class=\"text-xs font-semibold text-gray-500 p-input-labels\">Ordnung</p>\n"
                    + "                            </div>\n"
                    + "\n"
                    + "                            <!-- cell right-->\n"
                    + "                            <div class=\"grow p-2 bg-white\">\n"
                    + "                                <input class=\"border-0 w-full py-2 px-3 font-medium text-sm text-gray-700 leading-tight focus:outline-none focus:shadow-outline\" \n"
                    + "                                       type='text' \n"
                    + "                                       id='orderBiology' \n"
                    + "                                       name='orderBiology' \n"
                    + "                                       value='" + plant.getOrderBiology() + "'\n"
                    + "                                       readonly>\n"
                    + "                                <p class=\"text-base font-medium text-gray-900\"></p>\n"
                    + "                            </div>\n"
                    + "                        </div>\n"
                    + "\n"
                    + "                        <!-- row 5-->\n"
                    + "                        <div class=\"flex flex-row flex-wrap w-full gap-3 items-start items-center border-b-2 border-gray-300\">\n"
                    + "\n"
                    + "                            <!-- cell left-->\n"
                    + "                            <div class=\"flex-none w-24 p-4 bg-white\">\n"
                    + "                                <p class=\"text-xs font-semibold text-gray-500 p-input-labels\">Familie</p>\n"
                    + "                            </div>\n"
                    + "\n"
                    + "                            <!-- cell right-->\n"
                    + "                            <div class=\"grow p-2 bg-white\">\n"
                    + "                                <input class=\"border-0 w-full py-2 px-3 font-medium text-sm text-gray-700 leading-tight focus:outline-none focus:shadow-outline\" \n"
                    + "                                       type='text' \n"
                    + "                                       id='familyBiology' \n"
                    + "                                       name='familyBiology' \n"
                    + "                                       value='" + plant.getFamilyBiology() + "'\n"
                    + "                                       readonly>\n"
                    + "                                <p class=\"text-base font-medium text-gray-900\"></p>\n"
                    + "                            </div>\n"
                    + "                        </div>\n"
                    + "\n"
                    + "                        <!-- row 6-->\n"
                    + "                        <div class=\"flex flex-row flex-wrap w-full gap-3 items-start items-center border-b-2 border-gray-300\">\n"
                    + "\n"
                    + "                            <!-- cell left-->\n"
                    + "                            <div class=\"flex-none w-24 p-4 rounded-2xl bg-white\">\n"
                    + "                                <p class=\"text-xs font-semibold text-gray-500 p-input-labels\">Unterfamilie</p>\n"
                    + "                            </div>\n"
                    + "\n"
                    + "                            <!-- cell right-->\n"
                    + "                            <div class=\"grow p-2 bg-white\">\n"
                    + "                                <input class=\"border-0 w-full py-2 px-3 font-medium text-sm text-gray-700 leading-tight focus:outline-none focus:shadow-outline\"\n"
                    + "                                       type='text' \n"
                    + "                                       id='subfamilyBiology' \n"
                    + "                                       name='subfamilyBiology' \n"
                    + "                                       value='" + plant.getSubfamilyBiology() + "'\n"
                    + "                                       readonly>\n"
                    + "                                <p class=\"text-base font-medium text-gray-900\"></p>\n"
                    + "                            </div>\n"
                    + "                        </div>\n"
                    + "\n"
                    + "                        <div class=\"h-4 bg-gray-200\"></div>\n"
                    + "\n"
                    + "                        <!-- row 7-->\n"
                    + "                        <div class=\"flex flex-row flex-wrap w-full gap-3 items-start items-center border-b-2 border-gray-300\">\n"
                    + "\n"
                    + "                            <!-- cell left-->\n"
                    + "                            <div class=\"flex-none w-24 p-4 rounded-2xl bg-white\">\n"
                    + "                                <p class=\"text-xs font-semibold text-gray-500 p-input-labels\">Wuchshöhe in cm</p>\n"
                    + "                            </div>\n"
                    + "\n"
                    + "                            <!-- cell right-->\n"
                    + "                            <div class=\"grow p-2 bg-white\">\n"
                    + "                                <input class=\"border-0 w-full py-2 px-3 font-medium text-sm text-gray-700 leading-tight focus:outline-none focus:shadow-outline\"\n"
                    + "                                       type='text' \n"
                    + "                                       id='growingHeight' \n"
                    + "                                       name='growingHeight' \n"
                    + "                                       value='" + plant.getGrowingHeight() + "'\n"
                    + "                                       readonly>\n"
                    + "                                <p class=\"text-base font-medium text-gray-900\"></p>\n"
                    + "                            </div>\n"
                    + "                        </div>\n"
                    + "\n"
                    + "                        <!-- row 8-->\n"
                    + "                        <div class=\"flex flex-row flex-wrap w-full gap-3 items-start items-center border-b-2 border-gray-300\">\n"
                    + "\n"
                    + "                            <!-- cell left-->\n"
                    + "                            <div class=\"flex-none w-24 p-4 rounded-2xl bg-white\">\n"
                    + "                                <p class=\"text-xs font-semibold text-gray-500 p-input-labels\">Gieß-<br />empfehlung</p>\n"
                    + "                            </div>\n"
                    + "\n"
                    + "                            <!-- cell right-->\n"
                    + "                            <div class=\"grow p-2 bg-white\">\n"
                    + "                                <input class=\"border-0 w-full py-2 px-3 font-medium text-sm text-gray-700 leading-tight focus:outline-none focus:shadow-outline\"\n"
                    + "                                       type='text' \n"
                    + "                                       id='watering' \n"
                    + "                                       name='watering' \n"
                    + "                                       value='" + plant.getWatering() + "'\n"
                    + "                                       readonly>\n"
                    + "                                <p class=\"text-base font-medium text-gray-900\"></p>\n"
                    + "                            </div>\n"
                    + "                        </div>\n"
                    + "\n"
                    + "                        <!-- row 9-->\n"
                    + "                        <div class=\"flex flex-row flex-wrap w-full gap-3 items-start items-center border-b-2 border-gray-300\">\n"
                    + "\n"
                    + "                            <!-- cell left-->\n"
                    + "                            <div class=\"flex-none w-24 p-4 rounded-2xl bg-white\">\n"
                    + "                                <p class=\"text-xs font-semibold text-gray-500 p-input-labels\">Pflegeaufwand</p>\n"
                    + "                            </div>\n"
                    + "\n"
                    + "                            <!-- cell right-->\n"
                    + "                            <div class=\"grow p-2 bg-white\">\n"
                    + "                                <input class=\"border-0 w-full py-2 px-3 font-medium text-sm text-gray-700 leading-tight focus:outline-none focus:shadow-outline\"\n"
                    + "                                       type='text' \n"
                    + "                                       id='careRecommendations' \n"
                    + "                                       name='careRecommendations' \n"
                    + "                                       value='" + plant.getCareRecommendations() + "'\n"
                    + "                                       readonly>\n"
                    + "                                <p class=\"text-base font-medium text-gray-900\"></p>\n"
                    + "                            </div>\n"
                    + "                        </div>\n"
                    + "\n"
                    + "                        <div class=\"h-4 bg-gray-200\"></div>");

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
