<%-- 
    Document   : Connect
    Created on : 26.04.2022, 11:00:36
    Author     : CK
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page contentType="application/json" pageEncoding="UTF-8"%>--%>

<c:choose>
    <c:when test="${!upm.errors}">
        ID: ${upm.userPlant.userPlantsId}
    </c:when>
    <c:otherwise>
        <p style="color: red">
            ${upm.status}
        </p>
    </c:otherwise>
</c:choose>
