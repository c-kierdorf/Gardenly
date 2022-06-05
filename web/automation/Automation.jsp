<%-- 
    Document   : Automation
    Created on : 18.04.2022, 11:59:48
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

        <title>Gardenly Automation</title>
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
        <div class="container px-4 mx-auto">

            <!-- title + text area -->
            <div class="flex items-center py-6">
                <a href="javascript:history.back()" class="add-plant">
                    <i class="fa fa-chevron-left font-bold text-xl px-3 pt-3 text-main-green"></i>
                </a>
                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Automation</h2>
            </div>

            <!-- show automation data -->
            <p class="text-base font-medium text-gray-500 py-6">
                Hier kannst du einstellen, wie oft die Sensoren aktiviert und die Daten vom Modul an Gardenly übertragen werden.<br />
                <br />
                Es ist aktuell folgende Automation eingestellt:
            </p>
            <p class="text-base text-center font-bold text-gray-500 py-6">
                <b>
                    Performance Level:<br />
                </b>
                <c:choose>
                    <c:when test="${!upm.errors}">
                        <c:if test="${upm.userPlant.transferInterval == 1}">
                            <i class="fa-solid fa-bolt-lightning text-xl mr-1 text-red-500 align-middle"></i> High Performance
                        </c:if>
                        <c:if test="${upm.userPlant.transferInterval == 2}">
                            <i class="fa-solid fa-scale-balanced text-xl mr-1 text-main-green-500 align-middle"></i> Ausbalanciert
                        </c:if>
                        <c:if test="${upm.userPlant.transferInterval == 3}">
                            <i class="fa-solid fa-battery-empty text-xl mr-1 text-main-green-500 align-middle"></i> Stromsparmodus/Urlaubsmodus
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        ${upm.status}
                    </c:otherwise>
                </c:choose>
                <br /><br />
                <b>
                    Bewässerungsmodus:<br />
                </b>
                <c:choose>
                    <c:when test="${!upm.errors}">
                        <c:if test="${upm.userPlant.automaticWatering == true}">
                            <i class="fa-solid fa-wand-sparkles text-xl mr-1 text-main-green-500 align-middle"></i> Automatisch
                        </c:if>
                        <c:if test="${upm.userPlant.automaticWatering == false}">
                            <i class="fa-solid fa-user text-xl mr-1 text-main-green-500 align-middle"></i> Manuell
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        ${upm.status}
                    </c:otherwise>
                </c:choose>
            </p>
        </div>
        <!-- buttons -->
        <div class="container px-4 mx-auto">
            <div class="w-full">
                <section class="text-center px-4 mx-auto w-full mt-12">
                    <a href="/automation/AutomationEdit.jsp">
                        <div class="bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                            Modus ändern
                        </div>
                    </a>
                </section>   
            </div>
        </div>
        <!--                    
            
            Footer CK
            
        -->
        <footer class="text-center">&copy; Gardenly Inc. 2022 | <a href="/legal/Impressum.jsp" title="Zum Impressum" class="footer">Impressum</a></footer>

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
