<%-- 
    Document   : PlantsDashboard
    Created on : 10.03.2022, 12:32:39
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
        <title>Gardenly Plants Dashboard</title>
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
                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Pflanzen Wiki</h2>
            </div>

            <p class="text-base font-medium text-gray-500 py-6">
                Allgemeine Informationen zu Pflanzenarten und Pflegehinweise.<br />
                Suche nach einer Pflanze für weitere Informationen oder zeige alle 
                in der Datenbank hinterlegten Pflanzen an.
            </p>

        </div>

        <!-- search forms start -->

        <div class="container px-4 mx-auto">
            <div class="w-full mt-6">
                <form action="PlantList" method="POST" enctype="multipart/form-data" >
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2" 
                               for="firstName">
                            Pflanzenname
                        </label>
                        <input class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline" 
                               type="text" 
                               id="name" 
                               name="p_name"  
                               required>
                    </div>
                    <div class="items-center justify-between my-6">
                        <div class="text-center bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                            <input type="submit" 
                                   value="Suche Pflanze" >
                        </div>
                    </div>
                </form>
                <form action="PlantList" method="POST" enctype="multipart/form-data" >
                    <input type="hidden" id="name" name="p_name" value="%">
                    <div class="items-center justify-between my-6">
                        <div class="text-center bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                            <input type="submit" 
                                   value="Zeige alle Pflanzen" >
                        </div>
                    </div>
                </form>
                <c:if test="${um.user.isAdmin}">
                    <form action="PlantAdd.jsp" method="POST">
                        <div class="items-center justify-between my-6">
                            <div class="text-center bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                                <input type="submit" 
                                       value="Neue Pflanze hinzufügen" >
                            </div>
                        </div>
                    </form>
                </c:if>
            </div>
        </div>

        <!-- search forms end -->

        <!-- search tipp -->
        <div class="container px-4 mx-auto">

            <p class="text-base font-medium text-gray-500 py-6">
                Bei der Suche kann man % als Wildcard benutzen, um eine partielle 
                Suche zu starten. Zum Beispiel "D%" eingeben (ohne Anführungszeichen), 
                um alle Pflanzen mit dem Anfangsbuchstaben "D" zu finden).
            </p>

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
