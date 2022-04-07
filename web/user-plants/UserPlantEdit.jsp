<%-- 
    Document   : UserPlantEdit
    Created on : 04.04.2022, 18:40:34
    Author     : CK
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${um.user == null}">
    <c:redirect url="/Login.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="robots" content="noindex">
        <link rel='stylesheet' type='text/css' href='/Gardenly/css/gardenly.css'>
        <script type="text/javascript" src="/Gardenly/js/gardenly.js"></script>
        <title>Gardenly Meine Pflanze bearbeiten</title>
    </head>
    <body>
        <a href="/Gardenly/Index" title="Zur Startseite">
            <img src="/img/GardenlyLogo1420x290.png" 
                 width="200" 
                 alt="Gardenly Logo"
                 style="margin-top: 20px; margin-bottom: 70px"/>
        </a>
        <h1>Meine Pflanze bearbeiten</h1>
        <form action="UserPlantEditSuccess" 
              method="POST" 
              enctype="multipart/form-data" >
            <input type="hidden" 
                   id="up_id" 
                   name="up_id" 
                   value="${upm.userPlant.userPlantsId}"
                   required>
            <div class="field">
                <label for="pflanzenname">Name (erforderlich)</label>
                <input type="text" 
                       id="up_name" 
                       name="up_name" 
                       value="${upm.userPlant.userPlantName}"
                       required>
            </div>
            <c:choose>
                <c:when test="${!pm.errors}">
                    <div class="field">
                        <label for="plantType">Pflanzenart auswählen (erforderlich)</label>
                        <select name="plantType" 
                                id="plantType" 
                                onchange="userPlantAdd()"
                                required>
                            <option selected value="${upm.userPlant.plantsFk.plantsId}">${upm.userPlant.plantsFk.name}</option>
                            <c:forEach items="${pm.plants}" var="p">
                                <option value="${p.plantsId}">${p.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="error">${pm.status}</div>
                </c:otherwise>
            </c:choose>

            <div id="dynamicContent">

                <div class='field'>
                    <label for='orderBiology'>Ordnung</label>
                    <input type='text' 
                           id='orderBiology' 
                           name='orderBiology' 
                           value='${upm.userPlant.plantsFk.orderBiology}'
                           readonly>
                </div>
                <div class='field'>
                    <label for='familyBiology'>Familie</label>
                    <input type='text' 
                           id='familyBiology' 
                           name='familyBiology' 
                           value='${upm.userPlant.plantsFk.familyBiology}'
                           readonly>
                </div>
                <div class='field'>
                    <label for='subfamilyBiology'>Unterfamilie</label>
                    <input type='text' 
                           id='subfamilyBiology' 
                           name='subfamilyBiology' 
                           value='${upm.userPlant.plantsFk.subfamilyBiology}'
                           readonly>
                </div>
                <div class='field'>
                    <label for='growingHeight'>Wuchshöhe in cm</label>
                    <input type='number' 
                           id='growingHeight' 
                           name='growingHeight' 
                           value='${upm.userPlant.plantsFk.growingHeight}'
                           readonly>
                </div>
                <div class='field'>
                    <label for='watering'>Gießempfehlung</label>
                    <input type='text' 
                           id='watering' 
                           name='watering' 
                           value='${upm.userPlant.plantsFk.watering}'
                           readonly>
                </div>
                <div class='field'>
                    <label for='careRecommendations'>Pflegeaufwand</label>
                    <input type='text' 
                           id='careRecommendations' 
                           name='careRecommendations' 
                           value='${upm.userPlant.plantsFk.careRecommendations}'
                           readonly>
                </div>

            </div>

            <c:if test="${upm.userPlant.userPlantPicturePath != ''}">
                <img src="/img/user-plants/${upm.userPlant.userPlantPicturePath}" 
                     width="100px" 
                     alt="Foto der Userpflanze"/>
            </c:if>
            <div class='field'>
                <label for='picture'>Mein persönliches Foto der Pflanze hochladen (optional)</label>
                <input type='file' 
                       id='picture' 
                       name='picture' >
            </div>
            <div class="field">
                <input type="submit" 
                       value="Speichern" 
                       style="
                       background-color: #67C53F;
                       color: white" >
            </div>
        </form>

        <!--        
                
                        Footer
                
        -->
        <div style="margin:50px"></div>
        <nav>
            <a href="#">Meldungen</a> | <a href="/Gardenly/plants/PlantsDashboard.jsp">Wiki</a> | <a href="/Gardenly/Index">Mein Garten</a> | <a href="#">Automation</a> | <a href="/Gardenly/settings/Settings.jsp">Einstellungen</a>
        </nav>
        <div style="margin:50px"></div>
        <footer>&copy; Gardenly Inc. 2022 | <a href="/Gardenly/legal/Impressum.jsp" title="Zum Impressum" class="footer">Impressum</a></footer>
    </body>
</html>
