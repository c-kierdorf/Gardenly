<%-- 
    Document   : Register
    Created on : 28.02.2022, 18:41:43
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
        <link rel="stylesheet" href="css/output.css" />
        <link rel="stylesheet" href="css/fonts.css" />
        <link rel="stylesheet" href="css/animate.min.css" />

        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <link rel="stylesheet" href="css/brands.min.css" />
        <link rel="stylesheet" href="css/regular.min.css" />
        <link rel="stylesheet" href="css/solid.min.css" />
        <link rel="stylesheet" href="css/weather-icons.css" />

        <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.js" defer></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/zxcvbn/4.4.2/zxcvbn.js"></script>
        <!-- 
        
            MK <head> end 
        
        -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' href='/Gardenly/css/gardenly.css'>
        <script type="text/javascript" src="/Gardenly/js/gardenly.js"></script>
        <title>Gardenly Registration</title>
    </head>
    <body class="antialiased h-screen body-bg font-Metropolis transition-all">
        <!-- shield -->
        <section id="shield" class="shield hidden bg-black bg-opacity-50 z-20 w-full h-full fixed top-0 inset-x-0 animate__animated">
            <div class=""></div>
        </section>

        <!-- logo area -->
        <section class=" container text-center py-12">
            <div class="container px-4 mx-auto">
                <a href="/Gardenly/Index" title="Zur Startseite">
                    <img class="mx-auto w-9/12" src="img/logo-main.svg" />
                </a>
            </div>
        </section>

        <!------------- InvalidRegistration CK ------------->
        <c:if test="${um.errors}">

            <div id="invalidRegistration" 
                 style="display: block;
                 border: 1px solid #cccccc;
                 border-radius: 5px;
                 width: 400px;
                 padding: 10px">
                <div style="color: red">${um.status}</div>
            </div>
        </c:if>

        <!-- title area -->
        <section>
            <div class="container px-4 mx-auto mb-8">
                <h1 class="h-10 text-3xl text-main-green font-Metropolis font-bold">Account erstellen</h1>
                <p class="text-sm font-medium text-gray-500">Durch die Erstellung eines Gardenly-Kontos profitierst Du von folgenden Vorteilen:</p>
            </div>
        </section>

        <!-- features list -->
        <section>
            <div class="container px-4 mx-auto">
                <div class="w-full">
                    <ul class="">
                        <li class="flex p-3 ">
                            <i class="fa fa-check-circle text-xl px-2 pt-0 text-main-green-500 mr-2 -mt-1"></i>
                            <span class="font-semibold">Rufe Details zu deinen Pflanzen von überall und von allen Endgeräten auf.</span> 
                        </li>
                        <li class="flex p-3 ">
                            <i class="fa fa-check-circle text-xl px-2 pt-0 text-main-green-500 mr-2 -mt-1"></i>
                            <span class="font-semibold">Synchronisere deine Pflanzendaten mit der Gardenly-Cloud.</span> 
                        </li>
                        <li class="flex p-3 ">
                            <i class="fa fa-check-circle text-xl px-2 pt-0 text-main-green-500 mr-2 -mt-1"></i>
                            <span class="font-semibold">Pflanzen-Erkennung durch unsere künstliche Intelligenz.</span> 
                        </li>
                        <li class="flex p-3 ">
                            <i class="fa fa-check-circle text-xl px-2 pt-0 text-main-green-500 mr-2 -mt-1"></i>
                            <span class="font-semibold">Pflanzenprobleme erkennen.</span> 
                        </li>
                        <li class="flex p-3 ">
                            <i class="fa fa-check-circle text-xl px-2 pt-0 text-main-green-500 mr-2 -mt-1"></i>
                            <span class="font-semibold">Automatische Bewässerung.</span> 
                        </li>
                        <li class="flex p-3 ">
                            <i class="fa fa-check-circle text-xl px-2 pt-0 text-main-green-500 mr-2 -mt-1"></i>
                            <span class="font-semibold">Keine versteckte Kosten.</span> 
                        </li>
                    </ul>

                    <!-- buttons -->
                    <section class="text-center px-4 mx-auto w-full mt-12">
                        <a href="#" id="" class="">
                            <div class="bg-blue-700 hover:bg-blue-800 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                                <i class="fab fa-facebook-f mr-2"></i> Mit Facebook fortfahren
                            </div>
                        </a>
                        <a href="#" id="register-with-mail" class="register-with-mail">
                            <div class="bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                                Mit E-Mail registrieren
                            </div>
                        </a>
                        <a href="Login.jsp" id="" class="">
                            <div class="bg-transparent hover:bg-gray-100 active:transform active:scale-90 transition-all text-gray-900 font-semibold w-full py-4 px-4 rounded-xl">
                                Zurück   
                            </div>
                        </a>
                    </section>
                </div>
            </div>
        </section>

        <!-- ⛄️ register overlay -->

        <!-- title area -->
        <section id="overlay" class="overlay hidden bg-white rounded-t-2xl z-30 w-full fixed bottom-0 inset-x-0 animate__animated">
            <div class="container px-4 mx-auto">

                <!-- title + text area -->
                <div class="flex items-center py-6">
                    <h2 class="h-10 text-3xl pt-2 text-main-green font-Metropolis font-bold">Registrieren</h2>

                    <div class="ml-auto">
                        <!-- close button -->
                        <a id="close-button" href="#" class="close-button w-3 h-3 p-0">
                            <i class="fa fa-xmark text-2xl px-2 pt-0 mt-2 text-gray-500 bg-gray-200 hover:text-white hover:bg-gray-500 rounded-full transition-all"></i>
                        </a>
                    </div>
                </div>
                <h3 class="h-10 text-xl pt-2 text-grey-900 font-Metropolis font-bold">Wie dürfen wie Dich nennen?</h3>

                <!-- register form -->
                <div class="w-full mt-6">
                    <form action="RegistrationSuccess" method="POST">
                        <div class="mb-4">
                            <label class="block text-gray-900 text-sm font-bold mb-2" 
                                   for="vorname">
                                Vorname
                            </label>
                            <input class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline" 
                                   id="vorname" 
                                   name="u_vorname"
                                   type="text" 
                                   placeholder="Max"
                                   required >
                        </div>
                        <div class="mb-4">
                            <label class="block text-gray-900 text-sm font-bold mb-2" 
                                   for="nachname">
                                Nachname
                            </label>
                            <input class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline" 
                                   id="nachname" 
                                   name="u_nachname"
                                   type="text" 
                                   placeholder="Musterfrau"
                                   required>
                        </div>

                        <h3 class="h-10 text-xl pt-2 text-grey-900 font-Metropolis font-bold mt-10 mb-4">Deine Login-Daten</h3>

                        <div class="mb-4">
                            <label class="block text-gray-900 text-sm font-bold mb-2" 
                                   for="email">
                                E-Mail-Adresse
                            </label>
                            <input class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline" 
                                   id="email" 
                                   name="u_email"
                                   type="email" 
                                   placeholder="max.musterfrau@example.com"
                                   required>
                        </div>



                        <div class="w-full" x-data="checkStrength()" x-init="checkStrength()">
                            <div class="relative mb-2">
                                <input :type="showPasswordField?'password':'text'" 
                                       id="password" 
                                       name="u_pwd"
                                       x-model="password" 
                                       class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline" 
                                       placeholder="Password" 
                                       @input="checkStrength()"
                                       required>
                                <button class="block w-7 h-7 text-center text-xl leading-0 absolute top-2 right-2 text-gray-400 focus:outline-none hover:text-indigo-500 transition-colors" 
                                        @click.prevent="showPasswordField=!showPasswordField">
                                    <i class="far " :class="`fa-${showPasswordField?'eye':'eye-slash'}`"></i>
                                </button>
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


                        <div class="my-8">
                            <label class="block text-gray-900 text-sm font-bold mb-2" 
                                   for="agb">
                                AGB & Datenschutz
                            </label>
                            <div class="form-check">
                                <label class="inline-flex items-center mt-3">
                                    <input type="checkbox" 
                                           class="form-checkbox h-5 w-5 rounded-md text-main-green-500" 
                                           id="agb" 
                                           name="u_agb" 
                                           required>
                                    <span class="ml-2 text-sm font-medium ">
                                        Ich akzeptiere die <a href="/legal/Datenschutzerklaerung.jsp" target="_blank">Datenschutzbestimmungen und AGB</a>.
                                    </span>
                                </label>
                            </div>
                        </div>

                        <div class="items-center justify-between my-6">
                            <div class="text-center bg-main-green-500 hover:bg-main-green-600 active:transform active:scale-90 transition-all text-white font-semibold w-full py-4 px-4 rounded-xl mb-3">
                                <input type="submit" 
                                       value="Registrieren">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <!-- 🌷 register overlay end -->

        <!--        
                
                        Footer CK
                
        -->
        <div style="margin:50px"></div>
        <footer>&copy; Gardenly Inc. 2022 | <a href="/Gardenly/legal/Impressum.jsp" title="Zum Impressum" class="footer">Impressum</a></footer>

        <!-- footer embeds MK -->
        <script type="text/javascript" src="js/main.js"></script>
        <script type="text/javascript" src="js/include.js"></script>

        <script type="text/javascript" src="js/brands.min.js"></script>
        <script type="text/javascript" src="js/regular.min.js"></script>
        <script type="text/javascript" src="js/solid.min.js"></script>

        <script>
            includeHTML();
        </script>
    </body>
</html>