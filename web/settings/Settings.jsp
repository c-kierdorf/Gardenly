<%-- 
    Document   : Settings
    Created on : 06.03.2022, 18:46:41
    Author     : crill
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${um.user == null}">
    <c:redirect url="/Login.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <title>Gardenly Einstellungen</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel='stylesheet' type='text/css' href='/Gardenly/css/gardenly.css'>
    </head>
    <body>
        <a href="/Gardenly/Index" title="Zur Startseite">
            <img src="/img/GardenlyLogo1420x290.png" 
                 width="200" 
                 alt="Gardenly Logo"
                 style="margin-top: 20px; margin-bottom: 70px"/>
        </a>
        <h1 style="color: #67C53F">Einstellungen</h1>
        <p>
            ${um.user.firstName} ${um.user.lastName}<br />
            ${um.user.email}
        </p>
        <form action="SettingsEditPersonalData.jsp" method="GET">
            <div class="field">
                <input type="submit" 
                       value="Persönliche Daten ändern" 
                       style="background-color: #67C53F;
                       color: white">
            </div>
        </form>
        <form action="SettingsEditPwd.jsp" method="GET">
            <div class="field">
                <input type="submit" 
                       value="Passwort ändern" 
                       style="background-color: #67C53F;
                       color: white">
            </div>
        </form>
        <form action="Logout" method="POST">
            <div class="field">
                <input type="submit" 
                       value="Logout" 
                       style="background-color: #67C53F;
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
