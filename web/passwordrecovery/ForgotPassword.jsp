<%-- 
    Document   : ForgotPassword
    Created on : 05.03.2022, 11:22:00
    Author     : CK
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Gardenly Passwort vergessen?</title>
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

        <div class="container px-4 mx-auto">
            <h1 class="text-3xl text-main-green font-Metropolis font-bold">Passwort vergessen?</h1>
            <p class="text-base font-medium text-gray-500">
                Kein Problem! Hier kannst du dein altes Passwort zurücksetzen 
                und ein neues anlegen.
            </p>
            <!-- reset pw form start -->
            <div class="w-full mt-6">
                <form action="NewPasswordEmailSent" method="POST">
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2" 
                               for="email">
                            E-Mail-Adresse
                        </label>
                        <input class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline" 
                               id="email" 
                               name="email"
                               type="email" 
                               placeholder="max.musterfrau@example.com"
                               required>
                    </div>
                    <div class="items-center justify-between my-6">
                        <div class="text-center bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                            <input type="submit" 
                                   value="Passwort zurücksetzen">
                        </div>
                    </div>
                </form>
            </div>
        </div>
            <!-- reset pw form end -->
            <!--                    
                
                Footer CK
                
            -->
            <footer class="text-center">&copy; Gardenly Inc. 2022 | <a href="/Gardenly/legal/Impressum.jsp" title="Zum Impressum" class="footer">Impressum</a></footer>

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
