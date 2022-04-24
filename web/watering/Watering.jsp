<%-- 
    Document   : Watering
    Created on : 06.04.2022, 22:28:26
    Author     : CK
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gardenly Aktualisierung UserPlant</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${!upm.errors}">
                <h1>Aktualisierung erfolgreich</h1>
                <p>
                    Name der Pflanze: ${upm.userPlant.userPlantName}<br />
                    Besitzer: ${upm.userPlant.userFk.firstName} ${upm.userPlant.userFk.lastName}<br />
                    Letztes Bewässerungsdatum: <fmt:formatDate type = "both"  
                                                       timeZone="Europe/Berlin" 
                                                       dateStyle = "long" 
                                                       timeStyle = "short" 
                                                       value="${upm.userPlant.wateringDate}" /> Uhr<br />
                    Letzter gespeicherter Wasserstand: ${upm.userPlant.waterlevel}<br />
                </p>
            </c:when>
            <c:otherwise>
                <p style="color: red">${upm.status}</p>
            </c:otherwise>
        </c:choose>

    </body>
</html>
