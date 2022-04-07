<%-- 
    Document   : UserPlantDetails
    Created on : 24.03.2022, 11:27:43
    Author     : CK
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
        <title>Gardenly Meine Pflanze Details</title>
    </head>
    <body>
        <a href="/Gardenly/Index" title="Zur Startseite">
            <img src="/img/GardenlyLogo1420x290.png" 
                 width="200" 
                 alt="Gardenly Logo"
                 style="margin-top: 20px; margin-bottom: 70px"/>
        </a>
        <h1>${upm.userPlant.userPlantName}</h1>
        <c:choose>
            <c:when test="${upm.userPlant.userPlantPicturePath != ''}">
                <img src="/img/user-plants/${upm.userPlant.userPlantPicturePath}" 
                     width="100px" 
                     alt="Foto der Userpflanze"/>
            </c:when>
            <c:otherwise>
                <img src="/img/plants/${upm.userPlant.plantsFk.picturePath}" 
                     alt="Default Foto der Pflanze"
                     width="100px" />
            </c:otherwise>
        </c:choose>
        <br />
        <p>
            &#128515; ${upm.userPlant.health}%<br>
            &#128167; ${upm.userPlant.waterlevel}% 
            <input type="hidden" 
                   name="up_id" 
                   id="up_id" 
                   value="${upm.userPlant.userPlantsId}"><br>
            &#127780; ausreichend Licht
        </p>
        <p>
            Außenbedingungen<br>
            &#127780; sonniges Wetter &#127777; 21° C &#127811; 14 km/h
        </p>
        <p>
            Letzte Bewässerung<br>
            <c:choose>
                <c:when test="${upm.userPlant.wateringDate != null}">
                    <fmt:formatDate type = "both" 
                                    dateStyle = "long" 
                                    timeStyle = "short" 
                                    timeZone = "Europe/Berlin" 
                                    value = "${upm.userPlant.wateringDate}" /> Uhr
                </c:when>
                <c:otherwise>
                    Bisher wurde die Pflanze noch nicht gewässert :-)
                </c:otherwise>
            </c:choose>
        </p>
        <form action="/Gardenly/plants/PlantList" method="POST" >
            <input hidden 
                   name="up_id" 
                   id="up_id"
                   value="${upm.userPlant.plantsFk.plantsId}" >
            <input type="submit" 
                   value="Pflanze im Wiki anzeigen">
        </form>
        <form action="UserPlantEdit" method="POST" >
            <input hidden 
                   name="up_id" 
                   id="up_id"
                   value="${upm.userPlant.userPlantsId}" >
            <input type="submit" 
                   value="Pflanze bearbeiten">
        </form>
        <form action="UserPlantDeleteSuccess" 
              method="POST"
              onsubmit="return confirm('Pflanze wirklich löschen?');">
            <input hidden 
                   name="up_id" 
                   id="up_id"
                   value="${upm.userPlant.userPlantsId}" >
            <input type="submit" 
                   style="color: red"
                   value="Pflanze löschen">
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