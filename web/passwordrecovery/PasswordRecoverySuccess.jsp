<%-- 
    Document   : PasswordResetSuccess
    Created on : 05.03.2022, 13:49:21
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' href='/Gardenly/css/gardenly.css'>
        <title>Gardenly Passwort erfolgreich zurückgesetzt</title>
    </head>
    <body>
        <a href="/Gardenly/Index" title="Zur Startseite">
            <img src="/img/GardenlyLogo1420x290.png" 
                 width="200" 
                 alt="Gardenly Logo"
                 style="margin-top: 20px; margin-bottom: 70px"/>
        </a>
        <h1 style="color: #67C53F">Hallo ${um.user.forename}!</h1>
        <p>Dein Passwort wurde erfolgreich geändert. Du kannst dich nun mit 
            deinem neuen Passwort und deiner Emailadresse bei Gardenly anmelden.</p>
        <form action="/Gardenly/Login.jsp" method="POST">
            <div class="field">
                <input type="submit" 
                       value="Zum Login" 
                       style="background-color:#67C53F; color: white">
            </div>
        </form>
        <div style="margin:50px"></div>
        <footer>&copy; Gardenly Inc. 2022 | <a href="/Gardenly/legal/Impressum.jsp" title="Zum Impressum" class="footer">Impressum</a></footer>
    </body>
</html>
