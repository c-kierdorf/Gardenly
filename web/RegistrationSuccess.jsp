<%-- 
    Document   : RegistrationSuccess
    Created on : 28.02.2022, 19:34:14
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' href='/Gardenly/css/gardenly.css'>
        <title>Gardenly Regisitrierung erfolgreich</title>
    </head>
    <body class="antialiased h-screen body-bg font-Metropolis transition-all">

        <!-- logo area -->
        <section class="container text-center py-12">
            <div class="container px-4 mx-auto">
                <a href="/Gardenly/Index" title="Zur Startseite">
                    <img class="mx-auto w-9/12" src="/img/logo-main.svg" />
                </a>
            </div>
        </section>

        <!-- text area -->
        <section>
            <div class="container px-4 mx-auto mb-8">
                <c:choose>
                    <c:when test="${!um.errors}">
                        <h1 class="text-3xl text-main-green font-Metropolis font-bold">Registrierung erfolgreich</h1>
                        <p class="text-base font-medium text-gray-500">
                            Du kannst dich nun mit deiner E-Mailadresse und Passwort 
                            bei Gardenly anmelden.
                        </p>
                        <section  class="text-center px-4 mx-auto w-full mt-12">
                            <a href="/Gardenly/Login.jsp" id="login" class="register">
                                <div class="bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                                    Zum Login
                                </div>
                            </a>
                        </section>
                    </c:when>
                    <c:otherwise>
                        <div id="invalidLogin" 
                             class="invalid-login container">
                            <div class="error">
                                ${um.status}
                            </div>
                        </div>
                        <section  class="text-center px-4 mx-auto w-full mt-12">
                            <a href="/Register.jsp" id="login" class="register">
                                <div class="bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                                    Erneut registrieren
                                </div>
                            </a>
                        </section>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>
        <!--        
            
                    Footer CK
            
        -->
        <section  class="text-center px-4 mx-auto w-full mt-12">
            <div style="margin:50px"></div>
            <footer>&copy; Gardenly Inc. 2022 | <a href="/Gardenly/legal/Impressum.jsp" title="Zum Impressum" class="footer">Impressum</a></footer>
        </section>
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
