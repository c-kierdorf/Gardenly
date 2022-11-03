<%-- 
    Document   : PreQuestionaire
    Created on : 22.03.2022, 17:58:27
    Author     : CK
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Gardenly Vor-Befragung</title>
    </head>
    <body class="antialiased h-screen body-bg font-Metropolis transition-all">

        <!-- header -->
        <div class="container px-4 mx-auto">

            <!-- title + text area -->
            <div class="flex items-center py-6">
                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Vor-Befragung</h2>
            </div>

        </div>
        <c:choose>
            <c:when test="${!pam.errors}">
                <!-- edit personal data form start -->
                <div class="container px-4 mx-auto">
                    <div class="w-full mt-6">
                        <!--begin :: notice -->
                        <p>
                            Die Vor-Befragung dient dazu, deine Erwartungen zu erfassen, bevor du Gardenly getestet hast. Außerdem wird deine Grundeinstellung zu Technik und Smart Home Geräten erfragt, weil das für die spätere Auswertung wichtig ist. Bitte lies die Fragen gründlich und fülle die Antworten nach deiner persönlichen Einschätzung aus.
                        </p>
                        <div style="padding: 10px"></div>
                        <!--end :: notice -->

                        <form action="PreQuestionaireLanding" method="POST">
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2" 
                                       for="participantId">
                                    Testperson wählen
                                </label>
                                <select class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline" 
                                        name="participantId" 
                                        id="participantId" 
                                        required>
                                    <option value="" disabled selected>Bitte wähle deinen Namen</option>
                                    <c:forEach items="${pam.participants}" var="p">
                                        <option value="${p.participantId}">${p.nickName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <!--begin :: title experience -->
                            <div class="flex items-center py-6">
                                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Vorerfahrung</h2>
                            </div>
                            <!--end :: title experience -->


                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="haeufigkeitPflanzenpflege">
                                    Wie oft betreibst du Pflanzenpflege?
                                </label>
                                <select required id="haeufigkeitPflanzenpflege" name="haeufigkeitPflanzenpflege" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Niemals">Niemals</option>
                                    <option value="Einmal monatlich">Einmal monatlich</option>
                                    <option value="Mehrmals im Monat">Mehrmals im Monat</option>
                                    <option value="Einmal wöchentlich">Einmal wöchentlich</option>
                                    <option value="Mehrmals die Woche">Mehrmals die Woche</option>
                                    <option value="Einmal täglich">Einmal täglich</option>
                                    <option value="Mehrmals täglich">Mehrmals täglich</option>
                                    <option value="Einmal die Stunde">Einmal die Stunde</option>
                                    <option value="Mehrmals pro Stunde">Mehrmals pro Stunde</option>
                                </select>
                            </div>
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="erfahrungAutomatisiertePflanzenpflege">
                                    Hast du Erfahrung mit automatisierter Pflanzenpflege?
                                </label>
                                <select required id="erfahrungAutomatisiertePflanzenpflege" name="erfahrungAutomatisiertePflanzenpflege" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Bisher keine">Bisher keine</option>
                                    <option value="Weniger als 1 Jahr">Weniger als 1 Jahr</option>
                                    <option value="1-3 Jahre">1-3 Jahre</option>
                                    <option value="Mehr als 3 Jahre">Mehr als 3 Jahre</option>
                                </select>
                            </div>

                            <!--begin :: title attitude -->
                            <div class="flex items-center py-6">
                                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Grundhaltung</h2>
                            </div>
                            <!--end :: title attitude -->


                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="technik">
                                    Wie stehst du Technik generell gegenüber?
                                </label>
                                <select required id="technik" name="technik" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Äußerst interessiert">Äußerst interessiert</option>
                                    <option value="Interessiert">Interessiert</option>
                                    <option value="Eher interessiert">Eher interessiert</option>
                                    <option value="Neutral">Neutral/Egal/Gelassen</option>
                                    <option value="Eher desinteressiert<">Eher desinteressiert</option>
                                    <option value="Desinteressiert">Desinteressiert</option>
                                    <option value="Äußerst desinteressiert">Äußerst desinteressiert</option>
                                </select>
                            </div>
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="smartHome">
                                    Wie stehst du "Smart Home" Geräten speziell gegenüber?
                                </label>
                                <select required id="smartHome" name="smartHome" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Äußerst interessiert">Äußerst interessiert</option>
                                    <option value="Interessiert">Interessiert</option>
                                    <option value="Eher interessiert">Eher interessiert</option>
                                    <option value="Neutral">Neutral/Egal/Gelassen</option>
                                    <option value="Eher desinteressiert<">Eher desinteressiert</option>
                                    <option value="Desinteressiert">Desinteressiert</option>
                                    <option value="Äußerst desinteressiert">Äußerst desinteressiert</option>
                                    <option value="Der Begriff „Smart Home“ sagt mir nichts">Der Begriff „Smart Home“ sagt mir nichts</option>
                                </select>
                            </div>

                            <!--begin :: title expectation -->
                            <div class="flex items-center py-6">
                                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Erwartung</h2>
                            </div>
                            <!--end :: title expectation -->


                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="erwartungen">
                                    Was sind deine Erwartungen an das vorgestellte Gerät?
                                </label>
                                <textarea required class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline" 
                                          id="erwartungen" 
                                          name="erwartungen" 
                                          rows="4"
                                          ></textarea>
                            </div>
                            <div class="items-center justify-between my-6">
                                <div class="text-center bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                                    <input type="submit" 
                                           value="Speichern" >
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- edit personal data form end -->
            </c:when>
            <c:otherwise>
                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Fehler</h2>

                <div class="error">
                    ${pam.status}
                </div>

                <a href="/evaluation/ParticipantAdd.jsp" id="login" class="register">
                    <div class="bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                        Neue(n) Teilnehmer/in anlegen
                    </div>
                </a>
            </c:otherwise>
        </c:choose>

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
