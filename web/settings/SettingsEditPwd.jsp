<%-- 
    Document   : SettingsEditPwd
    Created on : 23.03.2022, 11:16:04
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
        <title>Gardenly Passwort ändern</title>
    </head>
    <body class="antialiased h-screen body-bg font-Metropolis transition-all">

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

        <!-- header -->
        <div class="container px-4 mx-auto">

            <!-- title + text area -->
            <div class="flex items-center py-6">
                <a href="javascript:history.back()" class="add-plant">
                    <i class="fa fa-chevron-left font-bold text-xl px-3 pt-2.5 text-main-green"></i>
                </a>
                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Passwort ändern</h2>
            </div>

        </div>
        <!-- edit pw form start -->
        <div class="container px-4 mx-auto">
            <div class="w-full mt-6">
                <form action="SettingsEditPwdSuccess" method="POST">
                    <!-- dummy for js start -->
                    <a id="add-plant"></a>
                    <a id="close-button"></a>
                    <a id="shield"></a>  
                    <a id="overlay"></a>  
                    <a id="login"></a>  
                    <a id="register-with-mail"></a>  
                    <!-- dummy for js end -->
                    <input type="text" 
                           id="u_id" 
                           name="u_id" 
                           value="${um.user.userId}" 
                           hidden
                           readonly>
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="oldPwd">
                            Altes Passwort eingeben
                        </label>
                        <input class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline" 
                               type="password" 
                               id="oldPwd" 
                               name="oldPwd" 
                               required>
                    </div>
                    <div class="w-full" x-data="checkStrength()" x-init="checkStrength()">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="newPwd">
                            Neues Passwort eingeben
                        </label>
                        <div class="relative mb-2">
                            <input type="password" 
                                   id="password"
                                   name="newPwd" 
                                   x-model="password" 
                                   class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline" 
                                   placeholder="" 
                                   @input="checkStrength()"
                                   required>
<!--                            <button class="block w-7 h-7 text-center text-xl leading-0 absolute top-2 right-2 text-gray-400 focus:outline-none hover:text-indigo-500 transition-colors" 
                                    @click.prevent="showPasswordField=!showPasswordField">
                                <i class="far " :class="`fa-${showPasswordField?'eye':'eye-slash'}`"></i>
                            </button>-->
                        </div>
                        <div class="flex -mx-1">
                            <template x-for="(v,i) in 5">
                                <div class="w-1/5 px-1 mt-1">
                                    <div class="h-2 rounded-xl transition-colors" :class="i<passwordScore?(passwordScore<=2?'bg-red-500':(passwordScore<=4?'bg-yellow-500':'bg-main-green-500')):'bg-gray-300'"></div>
                                </div>
                            </template>
                        </div>
                    </div>
                    <div class="text-sm mt-4 font-medium">
                        <div><i id="password-length-checker" class="fa fa-circle-xmark text-red-500 pr-1"></i> mindestens 10 Zeichen.</div>
                        <div><i id="lowerUppercase-checker" class="fa fa-circle-xmark text-red-500 pr-1"></i> mindestens ein Groß- und ein Kleinbuchstabe.</div>
                        <div><i id="number-checker" class="fa fa-circle-xmark text-red-500 pr-1"></i> mindestens eine Ziffer.</div>
                        <div><i id="special-char-checker" class="fa fa-circle-xmark text-red-500 pr-1"></i> mindestens ein Sonderzeichen.</div>
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
        <!-- edit pw form end -->
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
