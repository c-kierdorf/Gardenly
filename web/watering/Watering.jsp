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
        <title>Gardenly Watering</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${!upm.errors}">
                <h1>Watering successful</h1>
                <p>
                    UserPlant name: ${upm.userPlant.userPlantName}<br />
                    Owner: ${upm.userPlant.userFk.firstName} ${upm.userPlant.userFk.lastName}<br />
                    New watering date: <fmt:formatDate type = "both"  
                                                       timeZone="Europe/Berlin" 
                                                       dateStyle = "long" 
                                                       timeStyle = "short" 
                                                       value="${upm.userPlant.wateringDate}" /> Uhr<br />
                    New waterlevel: ${upm.userPlant.waterlevel}<br />
                </p>
            </c:when>
            <c:otherwise>
                <p style="color: red">${upm.status}</p>
            </c:otherwise>
        </c:choose>

    </body>
</html>
