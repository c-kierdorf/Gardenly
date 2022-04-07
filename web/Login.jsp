<%-- 
    Document   : login
    Created on : 28.02.2022, 11:30:32
    Author     : CK
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' href='/Gardenly/css/gardenly.css'>
        <script type="text/javascript" src="/Gardenly/js/gardenly.js"></script>
        <title>Gardenly Login</title>
    </head>
    <body>
        <a href="/Gardenly/Index" title="Zur Startseite">
            <img src="/img/GardenlyLogo1420x290.png" 
             width="200" 
             alt="Gardenly Logo"
             style="margin-top: 20px; margin-bottom: 70px"/>
        </a>
        <c:choose>
            <c:when test="${um.errors}">
                <!------------- InvalidLogin ------------->
                <div id="invalidLogin" 
                     style="display: block;
                     border: 1px solid #cccccc;
                     border-radius: 5px;
                     width: 400px;
                     padding: 10px">
                    <div style="color: red">${um.status}</div>
                </div>
            </c:when>
        </c:choose>

        <!-------------------- Register -------------------->
        <div id="registerButton" style="display: block">
            <form action="Register.jsp" method="POST">
                <div class="field">
                    <input type="submit" 
                           value="Registrieren" 
                           style="background-color:#67C53F; color: white">
                </div>
            </form>
        </div>

        <!-------------------- Login -------------------->
        <div id="loginButton" style="display: block">
            <button onclick="showLoginForm()">Anmelden</button>
        </div>

        <div id="loginForm" 
             style="display: none;
             border: 1px solid #cccccc;
             border-radius: 5px;
             width: 200px;
             padding: 10px">
            <p style="color: #67C53F;">

                Anmelden

                <button type="button" 
                        style="
                        float: right;
                        border-radius: 50%;
                        background-color: #cccccc;
                        border: none;
                        text-align: center;
                        color: dimgray"
                        onClick="hideLoginForm()">
                    X
                </button>
            </p>

            <div style="margin: 20px"></div>

            <form action="Index" method="POST">
                <div class="field">
                    <label for="mail">E-Mail-Adresse</label>
                    <input type="email" id="mail" name="u_email" required>
                </div>
                <div class="field">
                    <label for="pwd">Passwort</label>
                    <input type="password" id="pwd" name="u_pwd" required>
                </div>
                <div class="field">
                    <input type="submit" 
                           value="Anmelden" 
                           style="background-color: #67C53F;
                           color: white">
                </div>
                <div style="margin: 20px">
                    <a href="/Gardenly/passwordrecovery/ForgotPassword.jsp" 
                       title="Passwort vergessen">Passwort vergessen?</a>
                </div>
            </form>
        </div>

        <div style="margin:50px"></div>
        <footer>&copy; Gardenly Inc. 2022 | <a href="/Gardenly/legal/Impressum.jsp" title="Zum Impressum" class="footer">Impressum</a></footer>
    </body>
</html>