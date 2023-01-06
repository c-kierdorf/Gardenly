<%-- 
    Document   : PreQuestionnaire
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
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
                            Die Vor-Befragung dient dazu, deine Erwartungen zu erfassen, bevor du Gardenly getestet hast. Außerdem wird deine Grundeinstellung zu Technik und Smart Home Geräten erfragt, weil das für die spätere Auswertung wichtig ist. Bitte lies die Fragen gründlich und fülle die Antworten nach deiner persönlichen Einschätzung aus. Alle Felder sind Pflichtfelder.
                        </p>
                        <div style="padding: 10px"></div>
                        <!--end :: notice -->

                        <form action="PreQuestionnaireLanding" method="POST">
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
                                    <option value="Eher desinteressiert">Eher desinteressiert</option>
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

                            <!--begin :: notice -->
                            <p>
                                Bitte versuche zumindest 500 Zeichen (ca. 100 Wörter) Text zu füllen, damit es genug Inhalt zum Auswerten gibt. Bitte keine Stichwörter. Falls du weitere Anregung benötigst, geben dir die Fragen und Textvorlagen unter dem Textfeld Hilfestellungen.
                            </p>
                            <div style="padding: 10px"></div>
                            <!--end :: notice -->


                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="erwartungen">
                                    Was sind deine Erwartungen an ein automatisches Pflanzenbewässerungssystem?
                                </label>
                                <textarea required class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline" 
                                          id="erwartungen" 
                                          name="erwartungen" 
                                          rows="4"
                                          minlength="500"
                                          placeholder="Ich erwarte mir von einem automatischen Pflanzenbewässerungssysten, dass..."
                                          ></textarea>
                                <span id="letter-count-erwartungen">500</span> Zeichen verbleiben
                            </div>

                            <!--begin :: accordion-->
                            <div class="accordion" id="accordionExample">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingOne">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                            Anregung #1
                                        </button>
                                    </h2>
                                    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <strong>Was bedeutet automatisierte Pflanzenbewässerung für dich?</strong><br><br>
                                            Beginne die Antwort z. B. mit: Automatische Pflanzenbewässerung bedeutet für mich...
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingTwo">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            Anregung #2
                                        </button>
                                    </h2>
                                    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <strong>Was waren deine bisherigen Strategien zur Pflanzenbewässerung?</strong><br><br>
                                            Beginne die Antwort z. B. mit: Bisher habe ich meine Pflanzen immer ... behandelt, daher erwarte ich von dem System ...
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingThree">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                            Anregung #3
                                        </button>
                                    </h2>
                                    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <strong>Könntest du dir vorstellen, deine Pflanzenpflege mit einem Smart Home System zu ergänzen oder zu ersetzen?</strong><br><br>
                                            Beginne die Antwort z. B. mit: Ich könnte mir (nicht) vorstellen, meine Pflanzenpflege mit einem automatischen Bewässerungssystem zu ergänzen/ersetzen.
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingFour">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                            Anregung #4
                                        </button>
                                    </h2>
                                    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            <strong>Was erwartest du von automatischer Pflanzenbewässerung allgemein?</strong><br><br>
                                            Beginne die Antwort z. B. mit: Allgemein erwarte ich mir von automatischer Pflanzenbewässerung...
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end :: accordion-->

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
        <script src="/Gardenly/js/letterCountPreQuestionnaire.js"></script>
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
