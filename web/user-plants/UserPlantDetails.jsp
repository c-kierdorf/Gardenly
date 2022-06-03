<%-- 
    Document   : UserPlantDetails
    Created on : 24.03.2022, 11:27:43
    Author     : CK
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
        <link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png" />
        <link rel="icon" type="image/png" sizes="16x16" href="img/favicon-16x16.png" />
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
        <script type="text/javascript" src="/Gardenly/js/gardenly.js"></script>
        <title>Gardenly Meine Pflanze Details</title>
    </head>
    <body class="antialiased h-screen body-bg font-Metropolis mb-14 transition-all">

        <!-- shield-->
        <section id="shield" class="shield hidden bg-black bg-opacity-50 z-20 w-full h-full fixed top-0 inset-x-0 animate__animated">
            <div class=""></div>
        </section>

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
                Profil
            </a>

        </nav>

        <!-- header -->
        <section>
            <div class="container px-4 mx-auto">
                <nav class="flex items-center py-6">
                    <a href="javascript:history.back()" class="add-plant">
                        <i class="fa fa-chevron-left font-bold text-xl px-3 pt-3 text-main-green"></i>
                    </a>
                    <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">${upm.userPlant.userPlantName}</h2>


                </nav>
            </div>
        </section>

        <!-- picture and stats -->
        <section>
            <div class="container px-4 mx-auto">
                <div class="flex items-center pb-6">
                    <div>
                        <img class="rounded-xl shadow-xl" 
                             width="115" 
                             height="115" 
                             <c:choose>
                                 <c:when test="${upm.userPlant.userPlantPicturePath != ''}">
                                     alt="Foto der Userpflanze"
                                     src="/img/user-plants/${upm.userPlant.userPlantPicturePath}" 
                                 </c:when>
                                 <c:otherwise>
                                     alt="Default Foto der Pflanze"
                                     src="/img/plants/${upm.userPlant.plantsFk.picturePath}" 
                                 </c:otherwise>
                             </c:choose>
                             />
                    </div>
                    <div>
                        <ul class="list-none text-md leading-loose ml-8">
                            <li>
                                <i class="far fa-smile text-xl mr-1 text-main-green align-middle"></i> 
                                ${upm.userPlant.health}%
                            </li>
                            <li><i class="wi wi-raindrops text-4xl mr-1 text-blue-500 align-middle"></i> 
                                ${upm.userPlant.soilmoistureNow}% 
                                <c:if test="${(upm.userPlant.isConnected == true) and (upm.userPlant.soilmoistureNow <= 30)}">
                                    <button class="text-blue-500 border-blue-500 hover:text-white hover:bg-blue-500 leading-0 align-middle ml-4 px-2 rounded-lg border-solid text-sm font-bold border-2"
                                            onclick="window.open(
                                                            'https://gardenly.garden/Watering?id=${upm.userPlant.userPlantsId}&waterlevel=70&watering=now&soilmoisture=100',
                                                            '_blank');">
                                        Bewässern
                                    </button>
                                </c:if>
                            </li>
                            <li><i class="wi wi-day-sunny text-1xl mr-1 text-orange-500 align-middle"></i> ausreichend Licht</li>
                            <li>
                                <c:choose>
                                    <c:when test="${upm.userPlant.waterlevel >= 1}">
                                        <i class="fa-solid fa-glass-water text-xl mr-1 text-blue-500 align-middle"></i> 
                                        Wasserstand ok
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fa-solid fa-glass-water text-xl mr-1 text-red-500 align-middle"></i> 
                                        Wassertank leer
                                    </c:otherwise>
                                </c:choose>
                            </li>
                            <li><c:if test="${upm.userPlant.isConnected}">
                                    <i class="fa-solid fa-plug-circle-check text-xl mr-1 text-main-green"></i> 
                                    Modul verbunden
                                </c:if>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <!-- current weather -->
        <section>
            <div class="container px-4 mx-auto">
                <h3 class="text-lg mt-3 font-semibold">Außenbedingungen</h3>
                <div class="flex items-center py-6">
                    <c:choose>
                        <c:when test="${!wm.errors}">
                            <div class="font-semibold align-middle"><img src="https://openweathermap.org/img/wn/${wm.weatherJsonObject.weather.get(0).getIcon()}.png" width="15px" alt="Openweathermap Icon" /> ${wm.weatherJsonObject.weather.get(0).getDescription()}</div>
                            <div class="flex ml-auto">
                                <div class="font-semibold mr-6 align-middle"><i class="wi wi-thermometer text-lg mr-1 text-main-green"></i> ${wm.weatherJsonObject.main.temp}° C</div>
                                <div class="font-semibold align-middle"><i class="wi wi-strong-wind text-lg mr-1 text-main-green"></i> ${wm.weatherJsonObject.wind.speed} km/h</div>
                            </div> 
                        </c:when>
                        <c:otherwise>
                            ${wm.status}
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

        </section>

        <!-- last waterings -->
        <section>
            <div class="container px-4 mx-auto">
                <h3 class="text-lg mt-3 font-semibold">Letzte Bewässerung</h3>
                <div>
                    <ul class="watering-list">
                        <c:choose>
                            <c:when test="${upm.userPlant.wateringDate != null}">
                                <li>
                                    <span class="waterlist-item-icon">
                                        <i class="far fa-smile "></i>
                                    </span>
                                    <span class="waterlist-item-value">
                                        150 ml
                                    </span>
                                    <span class="waterlist-item-title">
                                        Bewässerung
                                    </span>
                                    <span class="waterlist-item-datetime">
                                        <fmt:formatDate type = "both" 
                                                        dateStyle = "long" 
                                                        timeStyle = "short" 
                                                        timeZone = "Europe/Berlin" 
                                                        value = "${upm.userPlant.wateringDate}" /> Uhr
                                    </span>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <span class="waterlist-item-icon">
                                        <i class="far fa-smile "></i>
                                    </span>
                                    <span class="waterlist-item-title">Bisher wurde die Pflanze noch nicht gewässert :-)</span>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </section>

        <!-- actions -->
        <section>
            <div class="container px-4 mx-auto">
                <div class="w-full">
                    <section class="text-center px-4 mx-auto w-full mt-12">
                        <a href="/plants/PlantDetails?p_id=${upm.userPlant.plantsFk.plantsId}" 
                           id="show-in-wiki" 
                           class="show-in-wiki">
                            <div class="bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                                <i class="fa fa-book"></i> Pflanze im Wiki anzeigen
                            </div>
                        </a>
                        <a href="/UserPlantEdit?up_id=${upm.userPlant.userPlantsId}" 
                           id="plant-edit" 
                           class="plant-edit">
                            <div class="bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                                <i class="fa fa-pen"></i> Pflanze bearbeiten
                            </div>
                        </a>

                        <!-- placeholder -->
                        <div class="h-1"></div>

                        <a href="/UserPlantDeleteSuccess?up_id=${upm.userPlant.userPlantsId}" 
                           id="plant-delete" 
                           class="plant-delete"
                           onclick="return confirm('Pflanze wirklich löschen?');">
                            <div class="bg-red-500 hover:bg-red-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                                <i class="fa fa-trash"></i> Pflanze löschen
                            </div>
                        </a>
                    </section>
                </div>
            </div>
        </section>

        <!--                    
        
        Footer CK
        
        -->
        <footer class="text-center">&copy; Gardenly Inc. 2022 | <a href="/legal/Impressum.jsp" title="Zum Impressum" class="footer">Impressum</a></footer>
        <div class="py-12"></div>
        <!-- footer embeds -->
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
