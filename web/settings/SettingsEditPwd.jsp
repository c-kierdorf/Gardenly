<%-- 
    Document   : SettingsEditPwd
    Created on : 23.03.2022, 11:16:04
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
        <title>Gardenly Suchergebnis nach Pflanzen</title>
    </head>
    <body>
        <a href="/Gardenly/Index" title="Zur Startseite">
            <img src="/img/GardenlyLogo1420x290.png" 
                 width="200" 
                 alt="Gardenly Logo"
                 style="margin-top: 20px; margin-bottom: 70px"/>
        </a>
        <h1>Passwort ändern</h1>
        <form action="SettingsEditPwdSuccess" method="POST">
            <input type="text" 
                   id="u_id" 
                   name="u_id" 
                   value="${um.user.userId}" 
                   hidden
                   readonly>
            <div class="field">
                <label for="oldPwd">Altes Passwort eingeben</label>
                <input type="password" 
                       id="oldPwd" 
                       name="oldPwd" 
                       required>
            </div>
            <div class="field">
                <label for="newPwd">Neues Passwort eingeben</label>
                <input type="password" 
                       id="newPwd" 
                       name="newPwd" 
                       required>
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
