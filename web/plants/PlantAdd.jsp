<%-- 
    Document   : PlantAdd
    Created on : 10.03.2022, 18:31:21
    Author     : CK
    Comments   : Achtung: Der Code ERFORDERT ein Bild-Upload. Wenn der Bilder-Upload
                 optional werden soll, müssen entsprechende Zeilen im Servlet an konditionale
                 Bedingungen was den Picture-Parameter angeht geknüpft werden.
                 Siehe PlantEditSuccess.java, dort ist Bild-Upload optional.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${!um.user.isAdmin}">
    <c:redirect url="/Gardenly/index.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="robots" content="noindex">
        <link rel='stylesheet' type='text/css' href='/Gardenly/css/gardenly.css'>
        <title>Gardenly Pflanze hinzufügen</title>
    </head>
    <body>
        <a href="/Gardenly/Index" title="Zur Startseite">
            <img src="/img/GardenlyLogo1420x290.png" 
                 width="200" 
                 alt="Gardenly Logo"
                 style="margin-top: 20px; margin-bottom: 70px"/>
        </a>
        <nav>
            <a href="/Gardenly/Index" title="Zur Startseite">Startseite</a> 
            | <a href="/Gardenly/plants/PlantsDashboard.jsp" title="Pflanzen Dashboard">Pflanzen Dashboard</a>
        </nav>
        <h1>Neue Pflanze zur Datenbank hinzufügen</h1>
        <form action="PlantAddSuccess" method="POST" enctype="multipart/form-data">
            <div class="field">
                <label for="pflanzenname">Pflanzenname</label>
                <input type="text" id="pflanzenname" name="p_name" required>
            </div>
            <div class="field">
                <label for="orderBiology">Ordnung</label>
                <input type="text" id="orderBiology" name="orderBiology" required>
            </div>
            <div class="field">
                <label for="familyBiology">Familie</label>
                <input type="text" id="familyBiology" name="familyBiology" required>
            </div>
            <div class="field">
                <label for="subfamilyBiology">Unterfamilie</label>
                <input type="text" id="subfamilyBiology" name="subfamilyBiology" required>
            </div>
            <div class="field">
                <label for="growingHeight">Wuchshöhe in cm</label>
                <input type="number" id="growingHeight" name="growingHeight" min="1" step="1" required>
            </div>
            <div class="field">
                <label for="watering">Gießempfehlung</label>
                <select id="watering" name="watering" required>
                    <option value="Wenig">Wenig</option>
                    <option value="Mäßig">Mäßig</option>
                    <option value="Viel">Viel</option>
                </select>
            </div>
            <div class="field">
                <label for="careRecommendations">Pflegeaufwand</label>
                <select id="careRecommendations" name="careRecommendations" required>
                    <option value="Einfach">Einfach</option>
                    <option value="Mittel">Mittel</option>
                    <option value="Schwer">Schwer</option>
                </select>
            </div>
            <div class="field">
                <label for="picture">Foto der Pflanze</label>
                <input type="file" id="picture" name="picture" required>
            </div>
            <div class="field">
                <label for="location">Standort</label><br>
                <div class="location">
                    <input type="checkbox" id="locationHell" name="locationHell" value="hell">
                    <label for="locationHell">hell</label><br>
                    <input type="checkbox" id="locationSonnig" name="locationSonnig" value="sonnig">
                    <label for="locationSonnig">sonnig</label><br>
                    <input type="checkbox" id="locationHalbschattig" name="locationHalbschattig" value="halbschattig">
                    <label for="locationHalbschattig">halbschattig</label><br>
                    <input type="checkbox" id="locationSchattig" name="locationSchattig" value="schattig">
                    <label for="locationSchattig">schattig</label><br>
                    <input type="checkbox" id="locationWarm" name="locationWarm" value="warm">
                    <label for="locationWarm">warm</label><br>
                    <input type="checkbox" id="locationKuehl" name="locationKuehl" value="kühl">
                    <label for="locationKuehl">kühl</label><br>
                    <input type="checkbox" id="locationLuftfeucht" name="locationLuftfeucht" value="luftfeucht">
                    <label for="locationLuftfeucht">luftfeucht</label><br>
                    <input type="checkbox" id="locationWindgeschuetzt" name="locationWindgeschuetzt" value="windgeschützt">
                    <label for="locationWindgeschuetzt">windgeschützt</label><br>
                    <input type="checkbox" id="locationKeineSonne" name="locationKeineSonne" value="keine direkte Sonne">
                    <label for="locationKeineSonne">keine direkte Sonne</label><br>
                    <input type="checkbox" id="locationNordfenster" name="locationNordfenster" value="Nordfenster">
                    <label for="locationNordfenster">Nordfenster</label><br>
                    <input type="checkbox" id="locationOstfenster" name="locationOstfenster" value="Ostfenster">
                    <label for="locationOstfenster">Ostfenster</label><br>
                    <input type="checkbox" id="locationSuedfenster" name="locationSuedfenster" value="Südfenster">
                    <label for="locationSuedfenster">Südfenster</label><br>
                    <input type="checkbox" id="locationWestfenster" name="locationWestfenster" value="Westfenster">
                    <label for="locationWestfenster">Westfenster</label><br>
                    <input type="checkbox" id="locationIndoor" name="locationIndoor" value="Indoor">
                    <label for="locationIndoor">Indoor</label><br>
                    <input type="checkbox" id="locationOutdoor" name="locationOutdoor" value="Outdoor">
                    <label for="locationOutdoor">Outdoor</label><br> 
                </div>
            </div>
            <div class="field">
                <input type="submit" 
                       value="Speichern" 
                       style="
                       background-color: #67C53F;
                       color: white">
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
