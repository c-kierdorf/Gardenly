<%-- 
    Document   : Register
    Created on : 28.02.2022, 18:41:43
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
        <title>Gardenly Registration</title>
    </head>
    <body>
        <a href="/Gardenly/Index" title="Zur Startseite">
            <img src="/img/GardenlyLogo1420x290.png" 
                 width="200" 
                 alt="Gardenly Logo"
                 style="margin-top: 20px; margin-bottom: 70px"/>
        </a>
        <c:if test="${um.errors}">
            <!------------- InvalidRegistration ------------->
            <div id="invalidRegistration" 
                 style="display: block;
                 border: 1px solid #cccccc;
                 border-radius: 5px;
                 width: 400px;
                 padding: 10px">
                <div style="color: red">${um.status}</div>
            </div>
        </c:if>
        <!------------- RegistrationInfo ------------->
        <div id="registrationInfo" style="display: block">
            <h2>Account erstellen</h2>
            <p>Durch die Erstellung eines Gardenly-Kontos profitierst Du von folgenden Vorteilen:</p>

            <b>&#9989; Rufe Details zu deinen Pflanzen von überall und von allen Endgeräten auf</b><br />
            <b>&#9989; Synchronisiere deine Pflanzendaten mit der Gardenly-Cloud</b><br />
            <b>&#9989; Pflanzen-Erkennung durch unsere künstliche Intelligenz</b><br />
            <b>&#9989; Pflanzenprobleme erkennen</b><br />
            <b>&#9989; Automatische Bewässerung</b><br />
            <b>&#9989; Keine versteckten Kosten</b><br />

            <div>
                <button style="
                        background-color: #4467B2;
                        color: white">
                    Mit Facebook fortfahren    
                </button>
            </div>
            <div>
                <button style="
                        background-color: #67C53F;
                        color: white"
                        onClick="showRegistrationForm()">
                    Mit E-Mail registrieren
                </button>
            </div>
            <a href="Login.jsp" 
               title="Zurück zur Login-Seite"
               style="
               color: black;
               text-decoration: none;
               margin: 20px">
                Zurück
            </a>
        </div>

        <!------------- RegistrationForm ------------->
        <div id="registrationForm" 
             style="display: none;
             border: 1px solid #cccccc;
             border-radius: 5px;
             width: 400px;
             padding: 10px">
            <form action="RegistrationSuccess" method="POST">
                <h2 style="color: #67C53F">Account erstellen</h2>
                <button type="button" 
                        style="
                        float: right;
                        border-radius: 50%;
                        background-color: #cccccc;
                        border: none;
                        text-align: center;
                        color: dimgray"
                        onClick="hideregistrationForm()">
                    X
                </button>
                <h3>Wie dürfen wir dich nennen?</h3>
                <div class="field">
                    <label for="vorname">Vorname</label>
                    <input type="text" id="vorname" name="u_vorname" required>
                </div>
                <div class="field">
                    <label for="nachname">Nachname</label>
                    <input type="text" id="nachname" name="u_nachname" required>
                </div>
                <h3>Deine Login-Daten</h3>
                <div class="field">
                    <label for="email">E-Mail-Adresse</label>
                    <input type="email" id="email" name="u_email" required>
                </div>
                <div class="field">
                    <label for="pwd">Passwort</label>
                    <input type="password" id="pwd" name="u_pwd" required>
                </div>
                <p>Das Passwort sollte folgende Bedingungen erfüllen:</p>
                <div class="p">
                    &#9989; mindestens 8 Zeichen.<br />
                    &#9989; mindestens ein Groß- und ein Kleinbuchstabe.<br />
                    &#9989; mindestens eine Ziffer.<br />
                    &#9989; mindestens ein Sonderzeichen.<br />
                </div> 
                <div>
                    <b>Datenschutz und AGB</b>
                </div>
                <div class="field">
                    <input type="checkbox" id="agb" name="u_agb" required>
                    <label for="agb">Ich akzeptiere die Datenschutzbestimmungen und die AGB</label>
                </div>
                <div class="field">
                    <input type="submit" 
                           value="Registrieren" 
                           style="
                           background-color: #67C53F;
                           color: white">
                </div>
            </form>
        </div>

        <div style="margin:50px"></div>
        <footer>&copy; Gardenly Inc. 2022 | <a href="/Gardenly/legal/Impressum.jsp" title="Zum Impressum" class="footer">Impressum</a></footer>
    </body>
</html>