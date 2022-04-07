<%-- 
    Document   : PlantsDashboard
    Created on : 10.03.2022, 12:32:39
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
        <title>Gardenly Plants Dashboard</title>
    </head>
    <body>
        <a href="/Gardenly/Index" title="Zur Startseite">
            <img src="/img/GardenlyLogo1420x290.png" 
                 width="200" 
                 alt="Gardenly Logo"
                 style="margin-top: 20px; margin-bottom: 70px"/>
        </a>
        <h1>Pflanzen Wiki</h1>
        <p>
            Allgemeine Informationen zu Pflanzenarten und Pflegehinweise.<br />
            Suche nach einer Pflanze für weitere Informationen oder zeige alle 
            in der Datenbank hinterlegten Pflanzen an.
        </p>
        <form action="PlantList" method="POST">
            <div class="field">
                <label for="name">Pflanzen Name:</label>
                <input type="text" id="name" name="p_name" required>
            </div>
            <div class="field">
                <input type="submit" 
                       value="Suche Pflanze" 
                       style="background-color: #67C53F;
                       color: white">
            </div>
        </form>
        <form action="PlantList" method="POST">
            <div class="field">
                <input type="hidden" id="name" name="p_name" value="%">
                <input type="submit" 
                       value="Zeige alle Pflanzen" 
                       style="background-color: #67C53F;
                       color: white">
            </div>
        </form>
        <c:if test="${um.user.isAdmin}">
            <form action="PlantAdd.jsp" method="POST">
                <div class="field">
                    <input type="submit" 
                           value="Neue Pflanze hinzufügen" 
                           style="background-color: #67C53F;
                           color: white">
                </div>
            </form>
        </c:if>
        <p>Bei der Suche kann man % als Wildcard benutzen, um eine partielle 
            Suche zu starten (zum Beispiel "D%" eingeben (ohne Anführungszeichen, 
            um alle Pflanzen mit dem Anfangsbuchstaben "D" zu finden).</p>
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
