<%-- 
    Document   : PlantDetails
    Created on : 24.04.2022, 11:26:15
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
        <title>Gardenly Pflanzen Details</title>
    </head>
    <body class="antialiased h-screen body-bg font-Metropolis">

        <!-- fixed nav -->
        <nav class="bottom-nav fixed bottom-0 inset-x-0 z-10 bg-white border-gray-300 flex justify-between text-sm">

            <a href="/notifications/Notifications.jsp" class="menu-item w-full basis-1/5 pt-3 pb-2 text-center text-xs font-medium text-gray-500 hover:bg-blue-200 hover:text-blue-800 transition duration-300">
                <i class="block fa fa-inbox text-2xl mr-1 text-gray-400 mb-1"></i><br />
                Meldungen
            </a>

            <a href="/plants/PlantsDashboard.jsp" class="menu-item w-full basis-1/5 pt-3 pb-2 text-center text-xs font-medium text-gray-500 hover:bg-blue-200 hover:text-blue-800">
                <i class="block fa fa-book text-2xl mr-1 text-gray-400 mb-1"></i><br />
                Wiki
            </a>

            <a href="/Gardenly/Index" style="position: relative" class="menu-item menu-item-main w-full basis-1/5 pt-0 text-center font-medium text-xs text-gray-900 hover:bg-blue-200 hover:text-blue-800">
                <div class="rounded-full -mt-6 text-center mb-3 mx-auto">
                    <img class="w-9 mb-2 text-center py-4 mx-auto" src="/img/logo.svg">
                </div>
                Mein<br />Garten
            </a>

            <a href="/automation/Automation.jsp" class="menu-item w-full basis-1/5 pt-3 pb-2 text-center font-medium text-xs text-gray-500 hover:bg-blue-200 hover:text-blue-800">
                <i class="block fa-solid fa-sliders text-2xl mr-1 text-gray-400 mb-1"></i><br />
                Automation
            </a>

            <a href="/settings/Settings.jsp" class="menu-item w-full basis-1/5 pt-3 pb-2 text-center text-xs font-medium text-gray-500 hover:bg-blue-200 hover:text-blue-800">
                <i class="block fa-solid fa-gear text-2xl mr-1 text-gray-400 mb-1"></i><br />
                Einstellungen
            </a>

        </nav>

        <!-- title area -->
        <div class="container px-4 mx-auto">

            <!-- title + text area -->
            <div class="items-center py-6">
                <h2 class="h-10 text-3xl pt-2 text-main-green font-Metropolis font-bold">${pm.plant.name}</h2>
            </div>

            <img src="/img/plants/${pm.plant.picturePath}" 
                 alt="Foto der Pflanze"
                 width="100px" />
            <br />
            <p>
                <b>Pflanzenname:</b> ${pm.plant.name}<br />
                <b>Ordnung:</b> ${pm.plant.orderBiology}<br />
                <b>Familie:</b> ${pm.plant.familyBiology}<br />
                <b>Unterfamilie:</b> ${pm.plant.subfamilyBiology}<br />
            </p>
            <div class="py-2"></div>
            <p>
                <b>Wuchshöhe in cm:</b> ${pm.plant.growingHeight}<br />
                <b>Gießempfehlung:</b> ${pm.plant.watering}<br />
                <b>Pflegeaufwand:</b> ${pm.plant.careRecommendations}<br />
                <b>Standort:</b> ${pm.plant.location}<br />
            </p>
            <c:if test="${um.user.isAdmin}">
                <div class="py-2"></div>
                <p>
                    <b>Admin Angaben:</b>
                    <b>Pflanzen ID:</b> ${pm.plant.plantsId}<br />
                    <b>Erstellt von:</b> ${pm.plant.createdBy.firstName} ${pm.plant.createdBy.lastName}
                </p>
            </c:if>

            <section  class="text-center px-4 mx-auto w-full mt-12">
                <a href="/Gardenly/Index" id="login" class="register">
                    <div class="bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                        Zu meinem Garten
                    </div>
                </a>
                <a href="PlantsDashboard.jsp" id="login" class="register">
                    <div class="bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                        Zum Pflanzen Wiki
                    </div>
                </a>
            </section>
        </div>
        <!--                    
        
        Footer CK
        
        -->
        <footer class="text-center">&copy; Gardenly Inc. 2022 | <a href="/Gardenly/legal/Impressum.jsp" title="Zum Impressum" class="footer">Impressum</a></footer>
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
