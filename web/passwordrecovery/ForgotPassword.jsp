<%-- 
    Document   : ForgotPassword
    Created on : 05.03.2022, 11:22:00
    Author     : CK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' href='/Gardenly/css/gardenly.css'>
        <title>Gardenly Passwort vergessen?</title>
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
        <h1 style="color: #67C53F">Passwort vergessen?</h1>
        <p>
            Kein Problem! Hier kannst du dein altes Passwort zurücksetzen 
            und ein neues anlegen.
        </p>
        <form action="NewPasswordEmailSent" method="POST">
            <div class="field">
                <label for="email">E-Mail-Adresse</label>
                <input type="text" id="email" name="email" required>
            </div>
            <div class="field">
                <input type="submit" 
                       value="Passwort zurücksetzen" 
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
