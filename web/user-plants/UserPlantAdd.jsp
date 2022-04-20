<%-- 
    Document   : UserPlantAdd
    Created on : 16.03.2022, 09:27:02
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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="robots" content="noindex">
        <link rel='stylesheet' type='text/css' href='/css/gardenly.css'>
        <script type="text/javascript" src="/js/gardenly.js"></script>

        <title>Gardenly Meine Pflanze hinzufügen</title>
    </head>


    <body class="antialiased h-screen body-bg font-Metropolis mb-14">

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

        <!-- 🌷 add plant -->
        <div class="container px-4 mx-auto">

            <!-- title + text area -->
            <div class="items-center py-6">
                <h2 class="h-10 text-3xl pt-2 text-main-green font-Metropolis font-bold">Meine Pflanze hinzufügen</h2>
            </div>
        </div>

        <!-- title area -->
        <section class="block bg-white w-full rounded-t-2xl z-30 inset-x-0">

            <form action="UserPlantAddSuccess" 
                  method="POST" 
                  enctype="multipart/form-data" >

                <div class="justify-center">

                    <!-- row 1-->
                    <div class="flex flex-row flex-wrap w-full gap-3 items-start items-center py-6">

                        <!-- cell left-->
                        <div class="flex-none w-24 p-4 bg-white">
                            <p class="text-xs font-semibold text-gray-500 p-input-labels">Bild<br />(optional)</p>
                        </div>

                        <!-- cell right-->
                        <div class="grow p-3 bg-white">
                            <div class="flex w-full">
                                <input type='file' 
                                       id='picture' 
                                       name='picture' >
                            </div>
                        </div>
                    </div>

                    <div class="h-1 bg-gray-200"></div>

                    <!-- row 2-->
                    <div class="flex flex-row flex-wrap w-full gap-3 items-start items-center border-b-2 border-gray-300">

                        <!-- cell left-->
                        <div class="flex-none w-24 p-4 bg-white">
                            <p class="text-xs font-semibold text-gray-500 p-input-labels">Name<br />(Pflicht)</p>
                        </div>

                        <!-- cell right-->
                        <div class="grow p-2 bg-white">
                            <input class="border-0 w-full py-2 px-3 font-medium text-sm text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                   type="text" 
                                   id="name" 
                                   name="up_name" 
                                   placeholder="Mein Pflanzenname" 
                                   required>
                            <p class="text-base font-medium text-gray-900"></p>
                        </div>
                    </div>

                    <!-- row 3-->
                    <div class="flex flex-row flex-wrap w-full gap-3 items-start items-center border-b-2 border-gray-300">

                        <!-- cell left-->
                        <div class="flex-none w-24 p-4 bg-white">
                            <p class="text-xs font-semibold text-gray-500 p-input-labels">Pflanzenart<br />(Pflicht)</p>
                        </div>

                        <!-- cell right-->
                        <div class="grow p-2 bg-white">
                            <c:choose>
                                <c:when test="${!pm.errors}">
                                    <select class="border-0 w-full py-2 px-3 font-medium text-sm text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                            name="plantType" 
                                            id="plantType" 
                                            onchange="userPlantAdd()"
                                            required>
                                        <option value="none" selected disabled hidden>Wähle eine Pflanzenart</option>
                                        <c:forEach items="${pm.plants}" var="p">
                                            <option value="${p.plantsId}">${p.name}</option>
                                        </c:forEach>
                                    </select>
                                </c:when>
                                <c:otherwise>
                                    <div class="error">${pm.status}</div>
                                </c:otherwise>
                            </c:choose>
                            <p class="text-base font-medium text-gray-900"></p>
                        </div>
                    </div>

                    <div class="h-4 bg-gray-200"></div>

                    <!-- dynamic content start -->
                    <div id="dynamicContent">

                        <!-- row 4-->
                        <div class="flex flex-row flex-wrap w-full gap-3 items-start items-center border-b-2 border-gray-300">

                            <!-- cell left-->
                            <div class="flex-none w-24 p-4 bg-white">
                                <p class="text-xs font-semibold text-gray-500 p-input-labels">Ordnung</p>
                            </div>

                            <!-- cell right-->
                            <div class="grow p-2 bg-white">
                                <input class="border-0 w-full py-2 px-3 font-medium text-sm text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                       type='text' 
                                       id='orderBiology' 
                                       name='orderBiology' 
                                       value=''
                                       readonly>
                                <p class="text-base font-medium text-gray-900"></p>
                            </div>
                        </div>

                        <!-- row 5-->
                        <div class="flex flex-row flex-wrap w-full gap-3 items-start items-center border-b-2 border-gray-300">

                            <!-- cell left-->
                            <div class="flex-none w-24 p-4 bg-white">
                                <p class="text-xs font-semibold text-gray-500 p-input-labels">Familie</p>
                            </div>

                            <!-- cell right-->
                            <div class="grow p-2 bg-white">
                                <input class="border-0 w-full py-2 px-3 font-medium text-sm text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                       type='text' 
                                       id='familyBiology' 
                                       name='familyBiology' 
                                       value=''
                                       readonly>
                                <p class="text-base font-medium text-gray-900"></p>
                            </div>
                        </div>

                        <!-- row 6-->
                        <div class="flex flex-row flex-wrap w-full gap-3 items-start items-center border-b-2 border-gray-300">

                            <!-- cell left-->
                            <div class="flex-none w-24 p-4 rounded-2xl bg-white">
                                <p class="text-xs font-semibold text-gray-500 p-input-labels">Unterfamilie</p>
                            </div>

                            <!-- cell right-->
                            <div class="grow p-2 bg-white">
                                <input class="border-0 w-full py-2 px-3 font-medium text-sm text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                       type='text' 
                                       id='subfamilyBiology' 
                                       name='subfamilyBiology' 
                                       value=''
                                       readonly>
                                <p class="text-base font-medium text-gray-900"></p>
                            </div>
                        </div>

                        <div class="h-4 bg-gray-200"></div>

                        <!-- row 7-->
                        <div class="flex flex-row flex-wrap w-full gap-3 items-start items-center border-b-2 border-gray-300">

                            <!-- cell left-->
                            <div class="flex-none w-24 p-4 rounded-2xl bg-white">
                                <p class="text-xs font-semibold text-gray-500 p-input-labels">Wuchshöhe in cm</p>
                            </div>

                            <!-- cell right-->
                            <div class="grow p-2 bg-white">
                                <input class="border-0 w-full py-2 px-3 font-medium text-sm text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                       type='number' 
                                       id='growingHeight' 
                                       name='growingHeight' 
                                       value=''
                                       readonly>
                                <p class="text-base font-medium text-gray-900"></p>
                            </div>
                        </div>

                        <!-- row 8-->
                        <div class="flex flex-row flex-wrap w-full gap-3 items-start items-center border-b-2 border-gray-300">

                            <!-- cell left-->
                            <div class="flex-none w-24 p-4 rounded-2xl bg-white">
                                <p class="text-xs font-semibold text-gray-500 p-input-labels">Gieß-<br />empfehlung</p>
                            </div>

                            <!-- cell right-->
                            <div class="grow p-2 bg-white">
                                <input class="border-0 w-full py-2 px-3 font-medium text-sm text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                       type='text' 
                                       id='watering' 
                                       name='watering' 
                                       value=''
                                       readonly>
                                <p class="text-base font-medium text-gray-900"></p>
                            </div>
                        </div>

                        <!-- row 9-->
                        <div class="flex flex-row flex-wrap w-full gap-3 items-start items-center border-b-2 border-gray-300">

                            <!-- cell left-->
                            <div class="flex-none w-24 p-4 rounded-2xl bg-white">
                                <p class="text-xs font-semibold text-gray-500 p-input-labels">Pflegeaufwand</p>
                            </div>

                            <!-- cell right-->
                            <div class="grow p-2 bg-white">
                                <input class="border-0 w-full py-2 px-3 font-medium text-sm text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                       type='text' 
                                       id='careRecommendations' 
                                       name='careRecommendations' 
                                       value=''
                                       readonly>
                                <p class="text-base font-medium text-gray-900"></p>
                            </div>
                        </div>

                        <div class="h-4 bg-gray-200"></div>

                    </div>
                    <!-- dynamic content end -->

                    <!-- save button-->
                    <div class="flex flex-row flex-wrap w-full gap-3 items-start items-center border-b-2 border-gray-300">
                        <div class="w-full mt-6">
                            <div class="items-center justify-between my-6 px-4">
                                <div class="text-center bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                                    <input type="submit"
                                           class="register"
                                           value="Speichern"  >
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="py-12"></div>
                </div>

            </form>
        </section>


        <!-- 🌷 add plant end -->

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
