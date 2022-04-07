<%-- 
    Document   : PlantDeleteSuccess
    Created on : 15.03.2022, 10:08:01
    Author     : CK
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${!um.user.isAdmin}">
    <c:redirect url="/Gardenly/index.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="robots" content="noindex">
        <link rel='stylesheet' type='text/css' href='/Gardenly/css/gardenly.css'>
        <title>Gardenly Suchergebnis nach Pflanzen</title>
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
        <c:choose>
            <c:when test="${!pm.errors}">
                <h1>Pflanze erfolgreich gelöscht</h1>
            </c:when>
            <c:otherwise>
                <div class="error">${pm.status}</div>
            </c:otherwise>
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
