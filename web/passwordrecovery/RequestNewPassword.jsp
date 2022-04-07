<%-- 
    Document   : NewPassword
    Created on : 05.03.2022, 11:27:24
    Author     : CK
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:if test="${param.email == null}">
    <c:redirect url="/Login.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' href='/Gardenly/css/gardenly.css'>
        <title>Gardenly Neues Passwort</title>
    </head>
    <body>
        <a href="/Gardenly/Index" title="Zur Startseite">
            <img src="/img/GardenlyLogo1420x290.png" 
                 width="200" 
                 alt="Gardenly Logo"
                 style="margin-top: 20px; margin-bottom: 70px"/>
        </a>
        <h1 style="color: #67C53F">Passwort zurücksetzen</h1>
        <p>
            Du kannst nun dein Passwort zurücksetzen.
        </p>
        <form action="PasswordRecoverySuccess" method="POST">
            <div class="field">
                <label for="pwd">Neues Passwort</label>
                <input type="password" id="pwd" name="pwd" required>
            </div>
            <input type="hidden" id="email" name="email" value="${param.email}" readonly>
            <input type="hidden" id="authcode" name="authcode" value="${param.authcode}" readonly>
            </div>
            <div class="field">
                <input type="submit" 
                       value="Jetzt zurücksetzen" 
                       style="background-color: #67C53F;
                       color: white">
            </div>
        </form>
        <!--        
                
                        Footer passwordrecovery
                
        -->
        <a href="/Gardenly/index.jsp">Zur Startseite</a>
        <div style="margin:50px"></div>
        <footer>&copy; Gardenly Inc. 2022 | <a href="/Gardenly/legal/Impressum.jsp" title="Zum Impressum" class="footer">Impressum</a></footer>
    </body>
</html>
