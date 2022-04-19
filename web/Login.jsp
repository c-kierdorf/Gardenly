<%-- 
    Document   : login
    Created on : 28.02.2022, 11:30:32
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
        <script type="text/javascript" src="/Gardenly/js/gardenly.js"></script>
        <title>Gardenly Login</title>
    </head>
    <body class="antialiased h-screen body-bg font-Metropolis transition-all">

        <!-- shield-->
        <section id="shield" class="shield hidden bg-black bg-opacity-50 z-20 w-full h-full fixed top-0 inset-x-0 animate__animated">
            <div class=""></div>
        </section>

        <!-- logo area -->
        <section class="container text-center py-12">
            <div class="container px-4 mx-auto">
                <a href="/Gardenly/Index" title="Zur Startseite">
                    <img class="mx-auto w-9/12" src="/img/logo-main.svg" />
                </a>
            </div>
        </section>

        <!-- keyvisual -->
        <section class="mx-auto text-center">
            <img class="w-full" src="/img/keyvisuals/login.png" />
        </section>

        <!--        
    
            Buttons MK BEGIN  
    
        -->
        <section class="container text-center px-4 mx-auto fixed bottom-5 inset-x-0 z-10 w-full">
            <!------------- InvalidLogin CK ------------->
            <c:if test="${um.errors}">
                <div id="invalidLogin" 
                     class="invalid-login container">
                    <div class="error">${um.status}</div>
                </div>
            </c:if>
            <!-------------------- Register Button MK -------------------->
            <div id="registerButton" style="display: block">
                <a href="Register.jsp" id="register" class="register">
                    <div class="bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                        Registrieren
                    </div>
                </a>
            </div>
            <!-------------------- Login Button MK -------------------->
            <a href="#" id="login" class="login">
                <div class="bg-white hover:bg-gray-100 active:transform active:scale-90 transition-all text-gray-900 font-semibold w-full py-4 px-4 rounded-xl">
                    Anmelden
                </div>
            </a>
            <!--        
                
                        Footer CK
                
            -->
            <div style="margin:50px"></div>
            <footer>&copy; Gardenly Inc. 2022 | <a href="/Gardenly/legal/Impressum.jsp" title="Zum Impressum" class="footer">Impressum</a></footer>
        </section>

        <!-- 🔑 login overlay -->

        <!-- title area -->
        <section id="overlay" class="overlay hidden bg-white rounded-t-2xl z-30 w-full fixed bottom-0 inset-x-0 animate__animated">
            <div class="container px-4 mx-auto">

                <!-- title + text area -->
                <div class="flex items-center py-6">
                    <h2 class="h-10 text-3xl pt-2 text-main-green font-Metropolis font-bold">Anmelden</h2>

                    <div class="ml-auto">
                        <!-- close button -->
                        <a id="close-button" href="#" class="close-button w-3 h-3 p-0">
                            <i class="fa fa-xmark text-2xl px-2 pt-0 mt-2 text-gray-500 bg-gray-200 hover:text-white hover:bg-gray-500 rounded-full transition-all"></i>
                        </a>
                    </div>
                </div>
                <p class="text-base font-medium text-gray-500">Melde dich mit deinem <img class="inline pl-1" src="img/logo-small.svg">-Konto an.</p>

                <!-- login form -->
                <div class="w-full mt-6">
                    <form class="" action="Index" method="POST">
                        <div class="mb-4">
                            <label class="block text-gray-900 text-sm font-bold mb-2" 
                                   for="mail">
                                E-Mail-Adresse
                            </label>
                            <input class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline" 
                                   id="mail"
                                   name="u_email"
                                   type="email"
                                   placeholder="max.musterfrau@gardenly.de"
                                   required >
                        </div>
                        <div class="mb-6">
                            <label class="block text-gray-900 text-sm font-bold mb-2 " 
                                   for="pwd">
                                Passwort
                            </label>
                            <input class="shadow appearance-none rounded transition-all w-full py-2 px-3 border focus:border-main-green-500 text-gray-900 mb-3 leading-tight focus:outline-none focus:shadow-outline" 
                                   id="pwd"
                                   name="u_pwd"
                                   type="password" 
                                   placeholder="******************"
                                   required>
                            <!--<p class="text-red-500 text-xs italic text-semibold">Please choose a password.</p>-->
                        </div>
                        <div class="items-center justify-between my-6">
                            <div class="text-center bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                                <input 
                                    id="register" 
                                    class="register"
                                    type="submit" 
                                    value="Anmelden">
                            </div>
                            <a class="inline-block mt-6 align-baseline font-bold text-sm text-center w-full text-main-green-500 hover:text-main-green-600" href="/Gardenly/passwordrecovery/ForgotPassword.jsp">
                                Passwort vergessen?
                            </a>
                        </div>
                    </form>
                </div>

            </div>
        </section>
        <!-- 🌷 login overlay end -->
        <!--        
        
                Buttons MK END 
        
        -->

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