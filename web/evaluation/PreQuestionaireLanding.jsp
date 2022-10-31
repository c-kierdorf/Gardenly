<%-- 
    Document   : PreQuestionaireLanding.jsps
    Created on : 22.03.2022, 18:16:52
    Author     : CK
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="de">
    <head>
        <!-- 
        
            MK <head> begin 
        
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
        
            MK <head> end 
        
        -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="robots" content="noindex">
        <link rel='stylesheet' type='text/css' href='/Gardenly/css/gardenly.css'>
        <title>Gardenly Questionaire Success</title>
    </head>
    <body class="antialiased h-screen body-bg font-Metropolis transition-all">

        <!-- header -->
        <div class="container px-4 mx-auto">

            <!-- title + text area -->
            <div class="items-center py-6">
                <c:choose>
                    <c:when test="${!preqm.errors}">
                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Vielen Dank!</h2>

                <!-- show personal data -->
                <p class="text-base font-medium text-gray-500 py-6">
                    Fragebogen erfolgreich ausgefüllt
                </p>

                <section  class="text-center px-4 mx-auto w-full mt-12">
                    <a href="/evaluation/PreQuestionaire.jsp" id="login" class="register">
                        <div class="bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                            Weitere Befragung durchführen
                        </div>
                    </a>
                </section>
                </c:when>
                    <c:otherwise>
                        <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Fehler</h2>

                        <div class="error">
                            ${preqm.status}
                        </div>
                        
                        <a href="/evaluation/PreQuestionaire.jsp" id="login" class="register">
                        <div class="bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                            Neue Befragung durchführen
                        </div>
                    </a>
                    </c:otherwise>
                </c:choose>
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
