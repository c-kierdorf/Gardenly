<%-- 
    Document   : NewPasswordEmailSent
    Created on : 05.03.2022, 12:19:12
    Author     : crill
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' href='/Gardenly/css/gardenly.css'>
        <title>Gardenly Email zur Passwortwiederherstellung gesendet</title>
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
        </nav>
        <h1 style="color: #67C53F">E-Mail versendet</h1>
        <p>
            Die Email zum zurücksenden deines Passworts wurde erfolgreich
            versendet. Bitte sieh in deinem E-Mail-Postfach nach und klicke 
            auf den dort angegebenen Link, um das Passwort zurückzusetzen.
        </p>
        <!--        
                
                        Footer passwordrecovery
                
        -->
        <a href="/Gardenly/index.jsp">Zur Startseite</a>
        <div style="margin:50px"></div>
        <footer>&copy; Gardenly Inc. 2022 | <a href="/Gardenly/legal/Impressum.jsp" title="Zum Impressum" class="footer">Impressum</a></footer>
    </body>
</html>
