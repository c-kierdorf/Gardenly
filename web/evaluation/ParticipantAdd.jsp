<%-- 
    Document   : ParticipantAdd.jsp
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
        <title>Gardenly Testperson hinzufügen</title>
    </head>
    <body class="antialiased h-screen body-bg font-Metropolis transition-all">

        <!-- header -->
        <div class="container px-4 mx-auto">

            <!-- title + text area -->
            <div class="flex items-center py-6">
                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Testperson hinzufügen</h2>
            </div>

        </div>
        <!-- edit personal data form start -->
        <div class="container px-4 mx-auto">
            <div class="w-full mt-6">
                <form action="ParticipantAddLanding" method="POST">
                    <!--begin :: notice -->
                    <p>
                        Mit diesem Fragebogen werden Stammdaten wie Name, Alter und Geschlecht erfasst, damit du sie nicht bei den folgenden Fragebögen immer wieder neu eingeben musst. Alle Felder sind Pflichtfelder.
                    </p>
                    <div style="padding: 10px"></div>
                    <!--end :: notice -->

                    <!--begin :: title core data -->
                    <div class="flex items-center py-6">
                        <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Stammdaten</h2>
                    </div>
                    <!--end :: title core data -->

                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2" 
                               for="nickName">
                            Vorname oder Pseudonym
                        </label>
                        <input class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline" 
                               type="text" 
                               id="nickName" 
                               name="nickName" 
                               required>
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2" 
                               for="age">
                            Alter
                        </label>
                        <input class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline" 
                               type="text" 
                               id="age" 
                               name="age" 
                               required>
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="gender">
                            Geschlecht
                        </label>
                        <select required id="gender" name="gender" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="m">m</option>
                            <option value="w">w</option>
                            <option value="d">d</option>
                        </select>
                    </div>


                    <!--begin :: title Education -->
                    <div class="flex items-center py-6">
                        <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Ausbildung und Beruf</h2>
                    </div>
                    <!--end :: title Education -->


                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="education">
                            Höchster Bildungsabschluss
                        </label>
                        <select required id="education" name="education" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="Hauptschule">Hauptschule</option>
                            <option value="Realschule">Realschule</option>
                            <option value="Realschule">Fachabitur</option>
                            <option value="Abitur">Abitur</option>
                            <option value="Studium">Studium</option>
                        </select>
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="profession">
                            Beruf
                        </label>
                        <select required id="profession" name="profession" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="Selbstständig">Selbstständig</option>
                            <option value="Angestellt">Angestellt</option>
                            <option value="Schüler/in">Schüler/in</option>
                            <option value="Student">Student/in</option>
                            <option value="Arbeitssuchend">Arbeitssuchend</option>
                            <option value="Rentner/in">Rentner/in</option>
                        </select>
                    </div>
                    
                    <!--begin :: title consent -->
                    <div class="flex items-center py-6">
                        <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Einverständnis</h2>
                    </div>
                    <!--end :: title consent -->

                    <div class="mb-4">
                        <input type="checkbox" 
                               id="consent" 
                               name="consent" 
                               value="Einwilligung erteilt"
                               required
                               >
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="consent">
                            Hiermit erkläre ich mich damit einverstanden, dass die hier eingegebenen Daten und zukünftigen Antworten bei den Fragebögen im Rahmen der Studie zur Akzeptanz automatisierter Pflanzenpflege anonym gespeichert werden. Über die Datenschutzbedingungen wurde ich von der Studienleitung persönlich aufgeklärt.
                        </label>
                    </div>

                    <!--begin :: title Email -->
                    <div class="flex items-center py-6">
                        <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Benachrichtigung</h2>
                    </div>
                    <!--end :: title Email -->

                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="email">
                            E-Mail (optional, wenn du eine Kopie der Ergebnisse erhalten möchtest)
                        </label>
                        <input class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline" 
                               type="email" 
                               id="email" 
                               name="email" 
                               value=""
                               >
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
