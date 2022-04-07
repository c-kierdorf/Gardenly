<%-- 
    Document   : Verification
    Created on : 02.03.2022, 23:35:09
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
        <title>Gardenly Verification</title>
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
                <h1>Super!</h1>
                <p>Du hast deine E-Mail-Adresse erfolgreich verifiziert.</p>
            </c:when>
            <c:otherwise>
                <div style="color: red">${um.status}</div>
            </c:otherwise>
        </c:choose>
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

        <footer>&copy; Gardenly Inc. 2022 | <a href="/Gardenly/legal/Impressum.jsp" title="Zum Impressum" class="footer">Impressum</a></footer>
    </body>
</html>
