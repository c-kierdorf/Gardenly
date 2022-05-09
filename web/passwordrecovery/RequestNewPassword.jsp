<%-- 
    Document   : NewPassword
    Created on : 05.03.2022, 11:27:24
    Author     : CK
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:if test="${param.email == null}">
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' href='/Gardenly/css/gardenly.css'>
        <title>Gardenly Neues Passwort</title>
    </head>
    <body class="antialiased h-screen body-bg font-Metropolis transition-all">

        <!-- logo area -->
        <section class="container text-center py-12">
            <div class="container px-4 mx-auto">
                <a href="/Index" title="Zur Startseite">
                    <img class="mx-auto w-9/12" src="/img/logo-main.svg" />
                </a>
            </div>  
        </section>

        <div class="container px-4 mx-auto">
            <h1 class="h-10 text-3xl text-main-green font-Metropolis font-bold">Passwort zurücksetzen</h1>

            <!-- reset pw form start -->
            <div class="w-full mt-6">
                <form action="PasswordRecoverySuccess" method="POST">
                    <!-- dummy for js start -->
                    <a id="add-plant"></a>
                    <a id="close-button"></a>
                    <a id="shield"></a>  
                    <a id="overlay"></a>  
                    <a id="login"></a>  
                    <a id="register-with-mail"></a>  
                    <!-- dummy for js end -->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2" 
                               for="pw">
                            Neues Passwort
                        </label>

                        <div class="w-full" x-data="checkStrength()" x-init="checkStrength()">
                            <div class="relative mb-2">
                                <input type="password" 
                                       id="password" 
                                       name="pwd"
                                       x-model="password" 
                                       class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline" 
                                       placeholder="Passwort" 
                                       @input="checkStrength()"
                                       required>
<!--                                <button class="block w-7 h-7 text-center text-xl leading-0 absolute top-2 right-2 text-gray-400 focus:outline-none hover:text-indigo-500 transition-colors" 
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


                        <input type="hidden" id="email" name="email" value="${param.email}" readonly>
                        <input type="hidden" id="authcode" name="authcode" value="${param.authcode}" readonly>

                        <div class="items-center justify-between my-6">
                            <div class="text-center bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                                <input type="submit" 
                                       value="Jetzt zurücksetzen">
                            </div>
                        </div>

                    </div>  
                </form>
            </div>

            <!-- reset pw form end -->

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
