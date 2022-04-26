<%-- 
    Document   : Connect
    Created on : 26.04.2022, 11:00:36
    Author     : CK
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gardenly Connect to Arduino</title>
    </head>
    <body>
        <h1>Arduino Connect Status:</h1>
        <c:choose>
            <c:when test="${!upm.errors}">
                <p style="color: green">
                    Alles in Ordnung :-)
                </p>
                <p>
                    Code für Arduino:
                </p>
                TRIGrequestInterval=1ENDETRIGrequestWatering=falseENDETRIGrequestPlantID=${upm.userPlant.userPlantsId}ENDETRIGrequestSensorSensitive=240ENDETRIGrequestSensorInsensitive=1ENDE
            </c:when>
            <c:otherwise>
                <p style="color: red">
                    ${upm.status}
                </p>
                <p>
                    Code für Arduino:
                </p>
                TRIGrequestInterval=1ENDETRIGrequestWatering=falseENDETRIGrequestPlantID=0ENDETRIGrequestSensorSensitive=240ENDETRIGrequestSensorInsensitive=1ENDE
            </c:otherwise>
        </c:choose>
    </body>
</html>
