<%-- 
    Document   : Notifications
    Created on : 18.04.2022, 11:36:35
    Author     : CK
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${um.user == null}">
    <c:redirect url="/Login.jsp"/>
</c:if>
<!DOCTYPE html>
<html lang="de">
    <head>
        <!-- 
       
           Header MK begin 
       
        -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link rel="icon" type="image/png" sizes="32x32" href="/img/favicon-32x32.png" />
        <link rel="icon" type="image/png" sizes="16x16" href="/img/favicon-16x16.png" />
        <link rel="stylesheet" href="/css/output.css" />
        <link rel="stylesheet" href="/css/fonts.css" />
        <link rel="stylesheet" href="/css/animate.min.css" />

        <link rel="stylesheet" href="/css/fontawesome.min.css" />
        <link rel="stylesheet" href="/css/brands.min.css" />
        <link rel="stylesheet" href="/css/regular.min.css" />
        <link rel="stylesheet" href="/css/solid.min.css" />
        <link rel="stylesheet" href="/css/weather-icons.css" />
        <!-- 
        
            Header MK end 
        
        -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="robots" content="noindex">
        <link rel='stylesheet' type='text/css' href='/Gardenly/css/gardenly.css'>

        <title>Gardenly Meldungen</title>
    </head>
    <body class="antialiased h-screen body-bg font-Metropolis transition-all">

        <!-- fixed nav -->
        <nav class="bottom-nav fixed bottom-0 inset-x-0 z-10 bg-white border-gray-300 flex justify-between text-sm">

            <a href="/Notifications" class="menu-item w-full basis-1/5 pt-3 pb-2 text-center text-xs font-medium text-gray-500 hover:bg-blue-200 hover:text-blue-800 transition duration-300">
                <i class="block fa fa-inbox text-2xl mr-1 text-gray-400 mb-1"></i><br />
                Meldungen
            </a>

            <a href="/plants/PlantsDashboard.jsp" class="menu-item w-full basis-1/5 pt-3 pb-2 text-center text-xs font-medium text-gray-500 hover:bg-blue-200 hover:text-blue-800">
                <i class="block fa fa-book text-2xl mr-1 text-gray-400 mb-1"></i><br />
                Wiki
            </a>

            <a href="/Index" style="position: relative" class="menu-item menu-item-main w-full basis-1/5 pt-0 text-center font-medium text-xs text-gray-900 hover:bg-blue-200 hover:text-blue-800">
                <div class="rounded-full -mt-6 text-center mb-3 mx-auto">
                    <img class="w-9 mb-2 text-center py-4 mx-auto" src="/img/logo.svg">
                </div>
                Mein<br />Garten
            </a>

            <a href="/Automation" class="menu-item w-full basis-1/5 pt-3 pb-2 text-center font-medium text-xs text-gray-500 hover:bg-blue-200 hover:text-blue-800">
                <i class="block fa-solid fa-sliders text-2xl mr-1 text-gray-400 mb-1"></i><br />
                Automation
            </a>

            <a href="/settings/Settings.jsp" class="menu-item w-full basis-1/5 pt-3 pb-2 text-center text-xs font-medium text-gray-500 hover:bg-blue-200 hover:text-blue-800">
                <i class="block fa-solid fa-gear text-2xl mr-1 text-gray-400 mb-1"></i><br />
                Einstellungen
            </a>

        </nav>

        <!-- header -->
        <div class="container px-4 mx-auto">

            <!-- title + text area -->
            <div class="flex items-center py-6">
                <a href="javascript:history.back()" class="add-plant">
                    <i class="fa fa-chevron-left font-bold text-xl px-3 pt-3 text-main-green"></i>
                </a>
                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Meldungen</h2>
            </div>

            <c:choose>
                <c:when test="${!upm.errors}">
                    <c:forEach items="${upm.userPlants}" var="up">
                        <h3>Alle Meldungen zu ${up.userPlantName}</h3>
                        <c:choose>
                            <c:when test="${up.userPlantPicturePath != ''}">
                                <img src="/img/user-plants/${up.userPlantPicturePath}" 
                                     width="100px" 
                                     alt="Foto der Userpflanze"/>
                            </c:when>
                            <c:otherwise>
                                <img src="/img/plants/${up.plantsFk.picturePath}" 
                                     alt="Default Foto der Pflanze"
                                     width="100px" />
                            </c:otherwise>
                        </c:choose>
                        <br />
                        <p>
                            <b>Gesundheit:</b> ${up.health}%<br>
                            <b>Temperatur:</b> ${up.temperatureNow}° C<br>
                            <b>Luftfeuchtigkeit:</b> ${up.humidityNow}%<br>
                            <b>Bodenfeuchtigkeit:</b> ${up.soilmoistureNow}%<br>
                            <b>Lichteinfluss:</b> ${up.lightNow} Lumen<br>
                            <c:choose>
                                <c:when test="${up.waterlevel >= 1}">
                                    <b>Wasserstand Gardenlymodul:</b> ok<br>
                                </c:when>
                                <c:otherwise>
                                    <b>Wasserstand Gardenlymodul:</b> kein Wasser im Tank<br>
                                </c:otherwise>
                            </c:choose>
                            <b>Transfer Intervall:</b> ${up.transferInterval}000 ms<br>
                            <b>ID:</b> ${up.userPlantsId}<br>
                            <b>Mit Arduino connected:</b> ${up.isConnected}
                        </p>
                        <p>
                            <b>Letzte Bewässerung</b><br>
                            <c:choose>
                                <c:when test="${up.wateringDate != null}">
                                    <fmt:formatDate type = "both" 
                                                    dateStyle = "long" 
                                                    timeStyle = "short" 
                                                    timeZone = "Europe/Berlin" 
                                                    value = "${up.wateringDate}" /> Uhr
                                </c:when>
                                <c:otherwise>
                                    Bisher wurde die Pflanze noch nicht gewässert :-)
                                </c:otherwise>
                            </c:choose>
                        </p>
                        <div class="py-6"></div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="card flex-auto p-4 rounded-2xl bg-white">
                        <div>
                            <p class="text-sm mt-3 font-semibold">${upm.status}</p>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <!--                    
            
            Footer CK
            
        -->
        <footer class="text-center">&copy; Gardenly Inc. 2022 | <a href="/legal/Impressum.jsp" title="Zum Impressum" class="footer">Impressum</a></footer>
        <div class="py-12"></div>
        <!-- footer embeds MK -->
        <script type="text/javascript" src="/js/main.js"></script>
        <script type="text/javascript" src="/js/include.js"></script>

        <script type="text/javascript" src="/js/brands.min.js"></script>
        <script type="text/javascript" src="/js/regular.min.js"></script>
        <script type="text/javascript" src="/js/solid.min.js"></script>

        <script>
            includeHTML();
        </script>
    </body>
</html>
