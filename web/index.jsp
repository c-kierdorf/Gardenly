<%-- 
    Document   : index
    Created on : 28.02.2022, 11:30:32
    Author     : CK
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:if test="${um.user == null}">
    <c:redirect url="/Login.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <title>Gardenly Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="robots" content="noindex">
        <link rel='stylesheet' type='text/css' href='/Gardenly/css/gardenly.css'>
    </head>
    <body>
        <a href="/Gardenly/Index" title="Zur Startseite">
            <img src="/img/GardenlyLogo1420x290.png" 
                 width="200" 
                 alt="Gardenly Logo"
                 style="margin-top: 20px; margin-bottom: 70px"/>
        </a>
        <h1>Mein Garten</h1>
        <img src="/img/GardenlyStatusAllesImGruenenBereich200x40.png" 
             width="200" 
             alt="Gardenly Logo"/>
        <!--        
        
                Current weather data via API 
        
        -->
        <p>
            <c:choose>
                <c:when test="${!wm.errors}">
                    <img src="https://openweathermap.org/img/wn/${wm.weatherJsonObject.weather.get(0).getIcon()}.png" width="15px" alt="Openweathermap Icon" /> ${wm.weatherJsonObject.weather.get(0).getDescription()}
                    &#127777; ${wm.weatherJsonObject.main.temp}° C 
                    &#127811; ${wm.weatherJsonObject.wind.speed} km/h
                </c:when>
                <c:otherwise>
                    ${wm.status}
                </c:otherwise>
            </c:choose>
        </p>

        <!--        
        
                UserPlants List 
        
        -->
        <h2 padding-top: 20px">Pflanzen</h2>
        <c:choose>
            <c:when test="${!upm.errors}">
                <table class="tg">
                    <thead>
                        <tr>
                            <th class="tg-0lax">Foto</th>
                            <th class="tg-0lax">Name</th>
                            <th class="tg-0lax">Pflanze</th>
                            <th class="tg-0lax">Gesundheit</th>
                            <th class="tg-0lax">Wasserstand</th>
                            <th class="tg-0lax">Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${upm.userPlants}" var="up">
                            <tr>
                                <td class="tg-0lax">
                                    <c:choose>
                                        <c:when test="${up.userPlantPicturePath != ''}">
                                            <img src="/img/user-plants/${up.userPlantPicturePath}" 
                                                 alt="Foto der User-Pflanze"
                                                 width="50px" />
                                        </c:when>
                                        <c:otherwise>
                                            <img src="/img/plants/${up.plantsFk.picturePath}" 
                                                 alt="Default Foto der Pflanze"
                                                 width="50px" />
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="tg-0lax">${up.userPlantName}</td>
                                <td class="tg-0lax">${up.plantsFk.name}</td>
                                <td class="tg-0lax">${up.health}%</td>
                                <td class="tg-0lax">${up.waterlevel}%</td>
                                <td class="tg-0lax">
                                    <form action="UserPlantDetails" method="POST">
                                        <div class="field">
                                            <input type="hidden" 
                                                   name="up_id" 
                                                   id ="up_id" 
                                                   value="${up.userPlantsId}">
                                            <input type="submit"
                                                   value="Details"
                                                   style="background-color: #67C53F;
                                                   color: white">
                                        </div>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p>${upm.status}</p>
            </c:otherwise>
        </c:choose>


        <form action="UserPlantAdd" method="POST">
            <div class="field">
                <input type="submit" 
                       value="Pflanze hinzufügen" 
                       style="
                       background-color: #67C53F;
                       color: white">
            </div>
        </form>

        <!--        
        
                E-Mail Verification
        
        -->
        <c:choose>
            <c:when test="${!um.user.isActive}">
                <div style="margin:50px"></div>
                <p>Du musst deine E-Mail Adresse noch verifizieren:</p>
                <form action="Verification" method="POST">
                    <input type="hidden"
                           name="u_id"
                           id="u_id"
                           value="${um.user.userId}">
                    <div class="field">
                        <label for="authcode">Email-Verifikationscode</label>
                        <input type="text" id="authcode" name="authcode" required>
                    </div>
                    <div class="field">
                        <input type="submit" 
                               value="Verifizieren" 
                               style="background-color: #67C53F;
                               color: white">
                    </div>
                </form>
            </c:when>
        </c:choose>
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
