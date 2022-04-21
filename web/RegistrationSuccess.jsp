<%-- 
    Document   : RegistrationSuccess
    Created on : 28.02.2022, 19:34:14
    Author     : CK
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' href='/Gardenly/css/gardenly.css'>
        <title>Gardenly Registration Success</title>
    </head>
    <body>
        <a href="/Gardenly/Index" title="Zur Startseite">
            <img src="/img/GardenlyLogo1420x290.png" 
                 width="200" 
                 alt="Gardenly Logo"
                 style="margin-top: 20px; margin-bottom: 70px"/>
        </a>
        <c:choose>
            <c:when test="${!um.errors}">
                <p>
                    <b>Du hast dich erfolgreich registriert.</b><br />
                    <br />
                    Du kannst dich nun mit deiner E-Mailadresse und Passwort 
                    bei Gardenly anmelden.
                </p>
                <c:if test="${!um.user.isActive}">
                    <p>
                        Schau in deinem Emailpostfach nach, um deine Emailadresse zu verifizieren.<br />
                        Diesen Schritt kannst du auch später nachholen.
                    </p>
                    <form action="Verification" method="POST">
                        <input type="hidden"
                               name="u_id"
                               id="u_id"
                               value="${um.user.userId}">
                        <div class="field">
                            <label for="authcode">Email-Verifikationscode</label>
                            <input type="text" id="authcode" name="authcode" required>
                        </div>
                        <div class="field">
                            <input type="submit" 
                                   value="Verifizieren" 
                                   style="background-color: #67C53F;
                                   color: white">
                        </div>
                    </form>
                    <form action="Login.jsp" method="POST">
                        <div class="field">
                            <input type="submit" 
                                   value="Zum Login" 
                                   style="background-color:#67C53F; color: white">
                        </div>
                    </form>
                </c:if>
            </c:when>
            <c:otherwise>
                <div class="error">${um.status}</div>
                <a href="Register.jsp">Erneut registrieren</a>
            </c:otherwise>
        </c:choose>
        <div style="margin:50px"></div>   
        <footer>&copy; Gardenly Inc. 2022 | <a href="/Gardenly/legal/Impressum.jsp" title="Zum Impressum" class="footer">Impressum</a></footer>
    </body>
</html>
