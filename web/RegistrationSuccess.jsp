<%-- 
    Document   : registrationSuccess
    Created on : 28.02.2022, 19:34:14
    Author     : CK
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:if test="${um.user == null}">
    <c:redirect url="/Login.jsp"/>
</c:if>
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
                <h1 style="color: #67C53F">Hallo ${um.user.firstName}!</h1>
                <p>Du hast dich erfolgreich registriert.</p>
                <c:if test="${!um.user.isActive}">
                    <p>Schau in deinem Emailpostfach nach, um deine Emailadresse zu verifizieren.</p>
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
                    <form action="Index" method="POST">
                        <input type="hidden"
                               name="u_id"
                               id="u_id"
                               value="${um.user.userId}">
                        <div class="field">
                            <input type="submit" 
                                   value="Zur Startseite" 
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
