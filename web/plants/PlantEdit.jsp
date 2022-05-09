<%-- 
    Document   : PlantEdit
    Created on : 14.03.2022, 10:45:52
    Author     : CK
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${!um.user.isAdmin}">
    <c:redirect url="/Gardenly/index.jsp"/>
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
        <title>Gardenly Suchergebnis nach Pflanzen</title>
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

            <a href="/Index" style="position: relative" class="menu-item menu-item-main w-full basis-1/5 pt-0 text-center font-medium text-xs text-gray-900 hover:bg-blue-200 hover:text-blue-800">
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
            <div class="flex items-center py-6">
                <a href="javascript:history.back()" class="add-plant">
                    <i class="fa fa-chevron-left font-bold text-xl px-3 pt-2.5 text-main-green"></i>
                </a>
                <h2 class="h-10 text-3xl pt-2 text-main-green font-Metropolis font-bold">Pflanze bearbeiten</h2>
            </div>
        </div>

        <!-- add plant start -->
        <section class="block bg-white w-full rounded-t-2xl z-30 inset-x-0">

            <c:choose>
                <c:when test="${!pm.errors}">

                    <form action="PlantEditSuccess" 
                          method="POST" 
                          enctype="multipart/form-data" >

                        <input hidden type="text" id="p_id" name="p_id" value="${pm.plant.plantsId}" >

                        <div class="justify-center">

                            <!-- row current picture-->
                            <div class="flex flex-row flex-wrap w-full gap-3 items-start items-center py-6">
                                <!-- cell left-->
                                <div class="flex-none w-24 p-4 bg-white">
                                    <p class="text-xs font-semibold text-gray-500 p-input-labels">Bild</p>
                                </div>

                                <!-- cell right-->
                                <div class="grow p-3 bg-white">
                                    <div class="flex w-full">
                                        <img src="/img/plants/${pm.plant.picturePath}" 
                                             width="100" 
                                             height="117" 
                                             alt="Bild der Pflanzen" />
                                    </div>
                                </div>
                            </div>

                            <!-- row new picture-->
                            <div class="flex flex-row flex-wrap w-full gap-3 items-start items-center py-6">

                                <!-- cell left-->
                                <div class="flex-none w-24 p-4 bg-white">
                                    <p class="text-xs font-semibold text-gray-500 p-input-labels">Neues Bild?</p> 
                                    <input type="checkbox" id="pictureYes" name="pictureYes" value="1">
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

                            <!-- row name-->
                            <div class="flex flex-row flex-wrap w-full gap-3 items-start items-center border-b-2 border-gray-300">

                                <!-- cell left-->
                                <div class="flex-none w-24 p-4 bg-white">
                                    <p class="text-xs font-semibold text-gray-500 p-input-labels">Name</p>
                                </div>

                                <!-- cell right-->
                                <div class="grow p-2 bg-white">
                                    <input class="border-0 w-full py-2 px-3 font-medium text-sm text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                           type="text" 
                                           id="pflanzenname" 
                                           name="p_name" 
                                           value="${pm.plant.name}" 
                                           required >
                                    <p class="text-base font-medium text-gray-900"></p>
                                </div>
                            </div>

                            <!-- row orderBiology-->
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
                                           value="${pm.plant.orderBiology}" 
                                           required >
                                    <p class="text-base font-medium text-gray-900"></p>
                                </div>
                            </div>

                            <!-- row familyBiology-->
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
                                           value="${pm.plant.familyBiology}" 
                                           required >
                                    <p class="text-base font-medium text-gray-900"></p>
                                </div>
                            </div>

                            <!-- row subfamilyBiology-->
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
                                           value="${pm.plant.subfamilyBiology}" 
                                           required >
                                    <p class="text-base font-medium text-gray-900"></p>
                                </div>
                            </div>
                                           
                            <!-- row scientificName -->
                            <div class="flex flex-row flex-wrap w-full gap-3 items-start items-center border-b-2 border-gray-300">

                                <!-- cell left-->
                                <div class="flex-none w-24 p-4 rounded-2xl bg-white">
                                    <p class="text-xs font-semibold text-gray-500 p-input-labels">Wissens. Name</p>
                                </div>

                                <!-- cell right-->
                                <div class="grow p-2 bg-white">
                                    <input class="border-0 w-full py-2 px-3 font-medium text-sm text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                           type='text' 
                                           id='scientificName' 
                                           name='scientificName' 
                                           value="${pm.plant.scientificName}" 
                                           required >
                                    <p class="text-base font-medium text-gray-900"></p>
                                </div>
                            </div>

                            <div class="h-4 bg-gray-200"></div>

                            <!-- row growingHeight-->
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
                                           value="${pm.plant.growingHeight}" 
                                           min="1" step="1" 
                                           required >
                                    <p class="text-base font-medium text-gray-900"></p>
                                </div>
                            </div>

                            <div class="h-4 bg-gray-200"></div>

                            <!-- row watering-->
                            <div class="flex flex-row flex-wrap w-full gap-3 items-start items-center border-b-2 border-gray-300">

                                <!-- cell left-->
                                <div class="flex-none w-24 p-4 rounded-2xl bg-white">
                                    <p class="text-xs font-semibold text-gray-500 p-input-labels">Gieß-<br />empfehlung</p>
                                </div>

                                <!-- cell right-->
                                <div class="grow p-2 bg-white">
                                    <select class="border-0 w-full py-2 px-3 font-medium text-sm text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                            name="watering" 
                                            id="watering" 
                                            required >
                                        <option selected value="${pm.plant.watering}">${pm.plant.watering}</option>
                                        <option value="Wenig">Wenig</option>
                                        <option value="Mäßig">Mäßig</option>
                                        <option value="Viel">Viel</option>
                                    </select>
                                    <p class="text-base font-medium text-gray-900"></p>
                                </div>

                                <!-- row careRecommendations-->
                                <div class="flex flex-row flex-wrap w-full gap-3 items-start items-center border-b-2 border-gray-300">

                                    <!-- cell left-->
                                    <div class="flex-none w-24 p-4 bg-white">
                                        <p class="text-xs font-semibold text-gray-500 p-input-labels">Pflegeaufwand</p>
                                    </div>

                                    <!-- cell right-->
                                    <div class="grow p-2 bg-white">
                                        <select class="border-0 w-full py-2 px-3 font-medium text-sm text-gray-700 leading-tight focus:outline-none focus:shadow-outline" 
                                                name="careRecommendations" 
                                                id="careRecommendations" 
                                                required >
                                            <option selected value="${pm.plant.careRecommendations}">${pm.plant.careRecommendations}</option>
                                            <option value="Einfach">Einfach</option>
                                            <option value="Mittel">Mittel</option>
                                            <option value="Schwer">Schwer</option>
                                        </select>
                                        <p class="text-base font-medium text-gray-900"></p>
                                    </div>
                                </div>

                                <!-- row location-->
                                <div class="flex flex-row flex-wrap w-full gap-3 items-start items-center border-b-2 border-gray-300">

                                    <!-- cell left-->
                                    <div class="flex-none w-24 p-4 bg-white">
                                        <p class="text-xs font-semibold text-gray-500 p-input-labels">Standort (Aktuell: ${pm.plant.location})</p>
                                    </div>

                                    <!-- cell right-->
                                    <div class="grow p-2 bg-white">
                                        <input type="checkbox" id="locationHell" name="locationHell" value="hell">
                                        <label for="locationHell">hell</label><br>
                                        <input type="checkbox" id="locationSonnig" name="locationSonnig" value="sonnig">
                                        <label for="locationSonnig">sonnig</label><br>
                                        <input type="checkbox" id="locationHalbschattig" name="locationHalbschattig" value="halbschattig">
                                        <label for="locationHalbschattig">halbschattig</label><br>
                                        <input type="checkbox" id="locationSchattig" name="locationSchattig" value="schattig">
                                        <label for="locationSchattig">schattig</label><br>
                                        <input type="checkbox" id="locationWarm" name="locationWarm" value="warm">
                                        <label for="locationWarm">warm</label><br>
                                        <input type="checkbox" id="locationKuehl" name="locationKuehl" value="kühl">
                                        <label for="locationKuehl">kühl</label><br>
                                        <input type="checkbox" id="locationLuftfeucht" name="locationLuftfeucht" value="luftfeucht">
                                        <label for="locationLuftfeucht">luftfeucht</label><br>
                                        <input type="checkbox" id="locationWindgeschuetzt" name="locationWindgeschuetzt" value="windgeschützt">
                                        <label for="locationWindgeschuetzt">windgeschützt</label><br>
                                        <input type="checkbox" id="locationKeineSonne" name="locationKeineSonne" value="keine direkte Sonne">
                                        <label for="locationKeineSonne">keine direkte Sonne</label><br>
                                        <input type="checkbox" id="locationNordfenster" name="locationNordfenster" value="Nordfenster">
                                        <label for="locationNordfenster">Nordfenster</label><br>
                                        <input type="checkbox" id="locationOstfenster" name="locationOstfenster" value="Ostfenster">
                                        <label for="locationOstfenster">Ostfenster</label><br>
                                        <input type="checkbox" id="locationSuedfenster" name="locationSuedfenster" value="Südfenster">
                                        <label for="locationSuedfenster">Südfenster</label><br>
                                        <input type="checkbox" id="locationWestfenster" name="locationWestfenster" value="Westfenster">
                                        <label for="locationWestfenster">Westfenster</label><br>
                                        <input type="checkbox" id="locationIndoor" name="locationIndoor" value="Indoor">
                                        <label for="locationIndoor">Indoor</label><br>
                                        <input type="checkbox" id="locationOutdoor" name="locationOutdoor" value="Outdoor">
                                        <label for="locationOutdoor">Outdoor</label><br> 
                                        <p class="text-base font-medium text-gray-900"></p>
                                    </div>
                                </div>

                                <div class="h-4 bg-gray-200"></div>

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
                        </div>

                    </form>
                </c:when>
                <c:otherwise>
                    <div class="card flex-auto p-4 rounded-2xl bg-white">
                        <div>
                            <p class="text-sm mt-3 font-semibold">${pm.status}</p>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </section>
        <!-- edit plant end -->

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
