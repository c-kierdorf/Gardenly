<%-- 
    Document   : PlantList
    Created on : 10.03.2022, 13:01:34
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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="robots" content="noindex">
        <link rel='stylesheet' type='text/css' href='/Gardenly/css/gardenly.css'>
        <script type="text/javascript" src="/Gardenly/js/gardenly.js"></script>
        <title>Gardenly Suchergebnis nach Pflanzen</title>
    </head>
    <body>
        <a href="/Gardenly/Index" title="Zur Startseite">
            <img src="/img/GardenlyLogo1420x290.png" 
                 width="200" 
                 alt="Gardenly Logo"
                 style="margin-top: 20px; margin-bottom: 70px"/>
        </a>
        <h1>Pflanzen Wiki</h1>
        <c:choose>
            <c:when test="${!pm.errors}">
                <c:forEach items="${pm.plants}" var="p">
                    <table class="tg">
                        <thead>
                            <tr>
                                <th class="tg-0lax">Foto</th>
                                <th class="tg-0lax">ID</th>
                                <th class="tg-0lax">Name</span></th>
                                <th class="tg-0lax">Standort</span></th>
                                <th class="tg-0lax">Gießempfehlung</span></th>
                                <th class="tg-0lax">Ordnung</th>
                                <th class="tg-0lax">Familie</th>
                                <th class="tg-0lax">Unterfamilie</th>
                                <th class="tg-0lax">Wuchshöhe</th>
                                <th class="tg-0lax">Pflegehinweis</th>
                                    <c:if test="${um.user.isAdmin}">
                                    <th class="tg-0lax">Bearbeiten</th>    
                                    </c:if>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="tg-0lax"><img src="/img/plants/${p.picturePath}" 
                                                         width="100" height="117" 
                                                         alt="Bild der Pflanzen"/> </td>
                                <td class="tg-0lax">${p.plantsId}</td>
                                <td class="tg-0lax">${p.name}</td>
                                <td class="tg-0lax">${p.location}</td>
                                <td class="tg-0lax">${p.watering}</td>
                                <td class="tg-0lax">${p.orderBiology}</td>
                                <td class="tg-0lax">${p.familyBiology}</td>
                                <td class="tg-0lax">${p.subfamilyBiology}</td>
                                <td class="tg-0lax">${p.growingHeight} cm</td>
                                <td class="tg-0lax">${p.careRecommendations}</td>
                                <c:if test="${um.user.isAdmin}">
                                    <td class="tg-0lax">
                                        <form action="PlantEdit" 
                                              method="POST">
                                            <div class="field">
                                                <input type="hidden" name="p_id" id="p_id" value="${p.plantsId}">
                                                <input type="submit" 
                                                       value="Bearbeiten" 
                                                       style="background-color: #67C53F;
                                                       color: white">
                                            </div>
                                        </form>
                                        <form action="PlantDeleteSuccess" 
                                              method="POST" 
                                              onsubmit="return confirm('Pflanze wirklich löschen?');">
                                            <div class="field">
                                                <input type="hidden" name="p_id" id="p_id" value="${p.plantsId}">
                                                <input type="submit" 
                                                       value="Löschen" 
                                                       style="background-color: #67C53F;
                                                       color: white">
                                            </div>
                                        </form>
                                    </td>
                                </c:if>
                            </tr>
                        </tbody>
                    </table>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="error">${pm.status}</div>
            </c:otherwise>
        </c:choose>
        <!--        
                
                        Footer
                
        -->
        <div style="margin:50px"></div>
        <nav>
            <a href="#">Meldungen</a> | <a href="/Gardenly/plants/PlantsDashboard.jsp">Wiki</a> | <a href="/Gardenly/Index">Mein Garten</a> | <a href="#">Automation</a> | <a href="/Gardenly/settings/Settings.jsp">Einstellungen</a>
        </nav>
        <div style="margin:50px"></div>
        <footer>&copy; Gardenly Inc. 2022 | <a href="/Gardenly/legal/Impressum.jsp" title="Zum Impressum" class="footer">Impressum</a></footer>
    </body>
</html>
