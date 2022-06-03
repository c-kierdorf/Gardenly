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
        <script type="text/javascript" src="/Gardenly/js/gardenly.js"></script>
        <title>Gardenly Suchergebnis nach Pflanzen</title>
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
                Profil
            </a>

        </nav>

        <!-- header -->
        <section>
            <div class="container px-4 mx-auto">
                <div class="flex items-center py-6">
                    <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Pflanzen Wiki</h2>
                </div>
                <c:if test="${pim.identified}">
                    <p class="text-base font-medium text-gray-500 py-2">
                        Folgende Pflanze konnten wir für dich identifizieren: 
                    </p>
                </c:if>
            </div>
        </section>


        <!-- plant tiles -->
        <section>
            <div class="container px-4 mx-auto">
                <div class="flex grid flex-row flex-wrap gap-3 grid-cols-2 items-center py-6">
                    <!-- cards-->
                    <c:choose>
                        <c:when test="${!pm.errors}">
                            <c:forEach items="${pm.plants}" var="p">
                                <a href="/plants/PlantDetails?p_id=${p.plantsId}" 
                                   title="Details der Pflanze aufrufen" 
                                   class="a-userPlants-index">
                                    <div class="card flex-auto p-4 rounded-2xl bg-white">
                                        <div class="flex">
                                            <div>
                                                <img src="/img/plants/${p.picturePath}" 
                                                     alt="Foto der Pflanze"
                                                     class="img-userPlants-index" />
                                            </div>
                                            <div class="ml-auto">
                                                <div class="text-right font-semibold font-md text-xs">${p.growingHeight} cm</div>
                                                <div class="text-right font-semibold font-md  text-xs"><i class="wi wi-raindrops text-8 mr-1 text-blue-500"></i> ${p.watering}</div>
                                            </div>
                                        </div>
                                        <div>
                                            <p class="text-sm mt-3 font-semibold">${p.name}</p>
                                            <p class="text-xs font-semibold text-gray-500">${p.orderBiology}</p>
                                        </div>
                                    </div>
                                </a>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="card flex-auto p-4 rounded-2xl bg-white">
                                <div>
                                    <p class="text-sm mt-3 font-semibold">${pm.status}</p>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>

                    <c:if test="${um.user.isAdmin}">
                        <!-- card: add new plant-->
                        <a href="PlantAdd.jsp" class="card add-plant flex-auto p-4 rounded-2xl bg-white">
                            <div>
                                <i class="fas fa-plus-circle text-2xl text-main-green"></i>
                            </div>
                            <div class="text-md mt-3 font-semibold">Pflanze<br> hinzufügen</div>
                        </a>
                    </c:if>

                </div>
                <c:if test="${pim.identified}">
                    <p class="text-base font-medium text-gray-500 py-6">
                        Wenn es die richtige Pflanze ist, klicke auf die Pflanze, um sie deinem Garten hinzuzufügen. 
                        Sonst starte eine neue Identifikation.
                    </p>
                </c:if>
                <!--        
                                     
                                     Footer CK
                                     
                -->
                <footer class="text-center">&copy; Gardenly Inc. 2022 | <a href="/legal/Impressum.jsp" title="Zum Impressum" class="footer">Impressum</a></footer>
                <div class="py-12"></div>
            </div>
        </section>
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
