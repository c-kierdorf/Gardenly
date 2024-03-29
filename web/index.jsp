<%-- 
    Document   : index
    Created on : 28.02.2022, 11:30:32
    Author     : CK
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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

        <title>Gardenly Home</title>
    </head>
    <body class="antialiased h-screen body-bg font-Metropolis transition-all">

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

            <a href="/plants/PlantsDashboard.jsp" class="active menu-item w-full basis-1/5 pt-3 pb-2 text-center text-xs font-medium text-gray-500 hover:bg-blue-200 hover:text-blue-800">
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
                <div class="flex items-center py-6">
                    <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Mein Garten</h2>

                    <div class="ml-auto">
                        <a href="#" class="add-plant">
                            <i class="far fa-plus text-4xl px-2 pt-0 text-main-green"></i>
                        </a>
                    </div>
                </div>
            </div>
        </section>

        <!-- status message -->
        <section>
            <div class="container px-4 mx-auto">

                <c:choose>
                    <c:when test="${!upm.errors}">
                        <c:set var="transferDateNull" value="true" />
                        <c:forEach items="${upm.userPlants}" var="up">
                            <c:if test="${up.transferDate != null}">
                                <c:set var="transferDateNull" value="false" />
                            </c:if>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${!transferDateNull}">
                                <c:set var="allPlantsHealthy" value="false" />
                                <c:forEach items="${upm.userPlants}" var="up">
                                    <c:if test="${up.health eq 'OK'}">
                                        <c:set var="allPlantsHealthy" value="true" />
                                    </c:if>
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${allPlantsHealthy}">
                                        <div class="status rounded-2xl p-4 bg-gradient-to-br from-main-green to-lime-400">
                                            <i class="fa text-3xl px-2 pt-0 text-white"></i>
                                            <span class="h-6 text-lg align-text-bottom font-bold text-white">Alles im grünen Bereich</span>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="rounded-2xl p-4 bg-gradient-to-br from-main-orange-500 to-main-orange-300">
                                            <i class="fa fa-triangle-exclamation text-3xl px-2 pt-0 text-white"></i>
                                            <span class="h-6 text-lg align-text-bottom font-bold text-white">Es gibt etwas zu prüfen</span>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <div class="status rounded-2xl p-4 bg-gradient-to-br from-main-green to-lime-400">
                                    <i class="fa text-3xl px-2 pt-0 text-white"></i>
                                    <span class="h-6 text-lg align-text-bottom font-bold text-white">Gardenly ist bereit</span>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <div class="status rounded-2xl p-4 bg-gradient-to-br from-main-green to-lime-400">
                            <i class="fa text-3xl px-2 pt-0 text-white"></i>
                            <span class="h-6 text-lg align-text-bottom font-bold text-white">Gardenly ist bereit</span>
                        </div>
                    </c:otherwise>    
                </c:choose>

                <!-- critical 
                <div class="rounded-2xl p-4 bg-gradient-to-br from-main-red-500 to-main-red-300">
                  <i class="fa fa-triangle-exclamation text-3xl px-2 pt-0 text-white"></i>
                  <span class="h-6 text-lg align-text-bottom font-bold text-white">{{ plant_name }} ist nicht erreichbar.</span>
                </div>
                -->

            </div>
        </section>

        <!--        
        
                Current weather data via API 
        
        -->
        <section>
            <div class="container px-4 mx-auto">
                <c:choose>
                    <c:when test="${!wm.errors}">
                        <div class="flex items-center py-6">
                            <div class="font-semibold align-middle"><img src="https://openweathermap.org/img/wn/${wm.weatherJsonObject.weather.get(0).getIcon()}.png" width="25px" alt="Openweathermap Icon"> ${wm.weatherJsonObject.weather.get(0).getDescription()}</div>
                            <div class="flex ml-auto">
                                <div class="font-semibold mr-6 align-middle"><i class="fa-solid fa-droplet-percent text-2xl mr-1 text-main-green"></i> ${wm.weatherJsonObject.main.humidity} %</div>
                                <div class="font-semibold align-middle"><i class="fa-solid fa-temperature-three-quarters text-2xl mr-1 text-main-green"></i> ${wm.weatherJsonObject.main.temp} ° C</div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        ${wm.status}
                    </c:otherwise>
                </c:choose>
            </div>
        </section>

        <!-- placeholder -->
        <section>
            <div class="h-4"></div>
        </section>

        <!-- plant tiles -->
        <section>
            <div class="container px-4 mx-auto">
                <div class="flex grid flex-row flex-wrap gap-3 grid-cols-2 items-center py-6">
                    <!-- cards-->
                    <c:choose>
                        <c:when test="${!upm.errors}">
                            <c:forEach items="${upm.userPlants}" var="up">
                                <a href="/UserPlantDetails?up_id=${up.userPlantsId}" 
                                   title="Details der Pflanze aufrufen" 
                                   class="a-userPlants-index">
                                    <div class="card flex-auto p-4 rounded-2xl bg-white">
                                        <div class="flex">
                                            <div>
                                                <c:choose>
                                                    <c:when test="${up.userPlantPicturePath != ''}">
                                                        <img src="/img/user-plants/${up.userPlantPicturePath}" 
                                                             alt="Foto der User-Pflanze"
                                                             class="img-userPlants-index" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="/img/plants/${up.plantsFk.picturePath}" 
                                                             alt="Default Foto der Pflanze"
                                                             class="img-userPlants-index" />
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="ml-auto">
                                                <c:choose>
                                                    <c:when test="${up.transferDate == null}">
                                                        <div class="text-right font-medium">
                                                            Keine Daten
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="text-right font-medium">
                                                            <c:choose>
                                                                <c:when test="${up.health == 'OK'}">
                                                                    <i class="fa-solid fa-circle-check text-lg mr-1 text-main-green-500 align-middle"></i> 
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <i class="fa-solid fa-triangle-exclamation text-lg mr-1 text-orange-500 align-middle"></i> 
                                                                </c:otherwise>
                                                            </c:choose>
                                                            ${up.health}
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${up.isConnected}">
                                                        <div class="text-right font-medium">
                                                            <i class="fa-solid fa-plug-circle-check text-lg mr-1 text-main-green"></i>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="text-right font-medium">
                                                            <i class="fa-solid fa-plug-circle-xmark text-lg mr-1 text-gray-400"></i>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <div>
                                            <p class="text-sm mt-3 font-semibold">${up.userPlantName}</p>
                                            <p class="text-xs font-semibold text-gray-500">${up.plantsFk.name}</p>
                                        </div>
                                    </div>
                                </a>
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

                    <!-- card: add new plant-->
                    <a href="#" class="card add-plant flex-auto p-4 rounded-2xl bg-white">
                        <div>
                            <i class="fas fa-plus-circle text-2xl text-main-green"></i>
                        </div>
                        <div class="text-md mt-3 font-semibold">Pflanze<br> hinzufügen</div>
                    </a>

                </div>
                <!--        
        
                E-Mail Verification
        
                -->
                <c:if test="${!um.user.isActive}">
                    <div style="margin:50px"></div>
                    <p class="text-base font-medium text-gray-500">
                        Du musst deine E-Mail Adresse noch verifizieren. Schau dazu in deinen Emails nach dem Verifikationscode und trage ihn in das Feld ein:
                    </p>
                    <form action="Verification" method="POST">
                        <input type="hidden"
                               name="u_id"
                               id="u_id"
                               value="${um.user.userId}">
                        <div class="mb-4 my-6">
                            <label class="block text-gray-900 text-sm font-bold mb-2"
                                   for="authcode">
                                Email-Verifikationscode
                            </label>
                            <input class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline" 
                                   type="text" 
                                   id="authcode" 
                                   name="authcode" 
                                   required>
                        </div>
                        <div class="items-center justify-between my-6">
                            <div class="text-center bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                                <input type="submit" 
                                       value="Verifizieren" >
                            </div>
                        </div>
                    </form>
                </c:if>
                <!--        
                                    
                                    Footer CK
                                    
                -->
                <footer class="text-center">&copy; Gardenly Inc. 2022 | <a href="/legal/Impressum.jsp" title="Zum Impressum" class="footer">Impressum</a></footer>
                <div class="py-12"></div>
            </div>
        </section> 

        <!-- 🌷 add plant overlay -->

        <!-- title area -->
        <section id="overlay" class="overlay hidden bg-white rounded-t-2xl z-30 w-full fixed bottom-0 inset-x-0 animate__animated">
            <div class="container px-4 mx-auto">

                <!-- title + text area -->
                <div class="flex items-center py-6">
                    <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Pflanze hinzufügen</h2>

                    <div class="ml-auto">
                        <!-- close button -->
                        <a id="close-button" href="#" class="close-button w-3 h-3 p-0">
                            <i class="fa fa-xmark text-2xl px-2 pt-0 mt-2 text-gray-500 bg-gray-200 hover:text-white hover:bg-gray-500 rounded-full transition-all"></i>
                        </a>
                    </div>
                </div>
                <p class="text-base font-medium text-gray-500">Um eine Pflanze hinzuzufügen, benötigst du ein freies <img class="inline pl-1" src="/img/logo-small.svg">-Modul.</p>

                <!-- selection buttons-->
                <div class="py-6 w-full">
                    <!-- button 1-->
                    <a href="/plants/PlantIdentify.jsp" class="flex flex-row items-center w-full p-6 pr-2 gap-5 rounded-3xl mb-4 bg-main-green hover:bg-main-green-600 transition-all">
                        <img class="flex-initial" src="/img/indentify-auto.svg"/>
                        <div>
                            <h3 class="text-white text-lg font-bold mb-1">Pflanze automatisch erkennen</h3>
                            <p class="text-main-green-50 font-medium text-sm">Fotografiere Deine Pflanze einfach mit der Kamera.</p>
                        </div>
                        <i class="fa fa-angle-right text-2xl px-2 pt-0 text-white ml-auto"></i>
                    </a>

                    <!-- button 2-->
                    <a href="/UserPlantAdd" class="flex flex-row items-center w-full p-6 pr-2 gap-5 rounded-3xl border-solid border border-gray-300 hover:bg-gray-200 transition-all">
                        <img class="flex-initial" src="/img/indentify-manually.svg"/>
                        <div>
                            <h3 class="text-gray-900 text-lg font-bold mb-1">Pfanze manuell hinzufügen</h3>
                            <p class="text-gray-500 font-medium text-sm">Gebe alle relevanten Informationen manuell an.</p>
                        </div>
                        <i class="fa fa-angle-right text-2xl px-2 pt-0 text-gray-900 ml-auto"></i>
                    </a>


                </div>

            </div>

        </section>
        <!-- 🌷 add plant overlay end -->

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
