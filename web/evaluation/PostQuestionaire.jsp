<%-- 
    Document   : PostQuestionaire
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
        <title>Gardenly Nach-Befragung</title>
    </head>
    <body class="antialiased h-screen body-bg font-Metropolis transition-all">

        <!-- header -->
        <div class="container px-4 mx-auto">

            <!-- title + text area -->
            <div class="flex items-center py-6">
                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Nach-Befragung</h2>
            </div>

        </div>
        <c:choose>
            <c:when test="${!pam.errors}">
                <!-- edit personal data form start -->
                <div class="container px-4 mx-auto">
                    <div class="w-full mt-6">
                        <!--begin :: notice -->
                        <p>
                            Die Nach-Befragung findet nach der einwächigen Testphase von Gardenly statt. Der Fragebogen dient dazu, deine Zufriedenheit mit Gardenly auszudrücken. Deine Antworten werden mir helfen zu verstehen, welche Aspekte des Systems dir besonders wichtig sind. Denke bitte so weit wie möglich an alle Aufgaben, die du mit Gardenly erledigt hast, während du diese Fragen beantwortest. Bitte lese jede Aussage gründlich und gib an, wie sehr du ihr zustimmst oder nicht. Alle Felder sind Pflichtfelder. Ich danke dir!
                        </p>
                        <div style="padding: 10px"></div>
                        <!--end :: notice -->

                        <form action="PostQuestionaireLanding" method="POST">
                            <!--begin :: Nickname-->
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
                            <!--end :: Nickname-->

                            <!--begin :: title Performance Expectancy -->
                            <div class="flex items-center py-6">
                                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Performance Expectancy / Leistungserwartung</h2>
                            </div>
                            <!--end :: title Performance Expectancy -->

                            <!--begin :: pe1-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="pe1">
                                    PE1: Ich empfinde Gardenly in meinem Alltag als nützlich.
                                </label>
                                <select required id="pe1" name="pe1" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: pe1-->
                            <!--begin :: pe2-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="pe2">
                                    PE2: Die Nutzung von Gardenly erhöht meine Chancen, Dinge zu erreichen, die mir wichtig sind.
                                </label>
                                <select required id="pe2" name="pe2" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: pe2-->
                            <!--begin :: pe3-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="pe3">
                                    PE3: Die Nutzung von Gardenly hilft mir dabei, Dinge schneller zu erreichen.
                                </label>
                                <select required id="pe3" name="pe3" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: pe3-->
                            <!--begin :: pe4-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="pe4">
                                    PE4: Die Nutzung von Gardenly erhöht meine Produktivität.
                                </label>
                                <select required id="pe4" name="pe4" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: pe4-->

                            <!--begin :: title Effort Expectancy -->
                            <div class="flex items-center py-6">
                                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Effort Expectancy / Aufwandserwartung</h2>
                            </div>
                            <!--end :: title Effort Expectancy -->

                            <!--begin :: ee1-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="ee1">
                                    EE1: Gardenly anwenden zu lernen ist einfach für mich.
                                </label>
                                <select required id="ee1" name="ee1" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: ee1-->
                            <!--begin :: ee2-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="ee2">
                                    EE2: Meine Interaktion mit Gardenly ist klar und verständlich.
                                </label>
                                <select required id="ee2" name="ee2" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: ee2-->
                            <!--begin :: ee3-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="ee3">
                                    EE3: Ich finde, Gardenly ist einfach anzuwenden.
                                </label>
                                <select required id="ee3" name="ee3" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: ee3-->
                            <!--begin :: ee4-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="ee4">
                                    EE4: Es ist einfach für mich, geübt im Verwenden von Gardenly zu werden.
                                </label>
                                <select required id="ee4" name="ee4" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: ee4-->

                            <!--begin :: title Social Influence -->
                            <div class="flex items-center py-6">
                                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Social Influence / Sozialer Einfluss</h2>
                            </div>
                            <!--end :: title Social Influence -->


                            <!--begin :: si1-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="si1">
                                    SI1: Personen, die mir wichtig sind, denken, ich sollte Gardenly verwenden.
                                </label>
                                <select required id="si1" name="si1" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: si1-->
                            <!--begin :: si2-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="si2">
                                    SI2: Personen, die mein Verhalten beeinflussen, denken, ich sollte Gardenly verwenden.
                                </label>
                                <select required id="si2" name="si2" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: si2-->
                            <!--begin :: si3-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="si3">
                                    SI3: Personen, deren Meinung ich schätze, ziehen vor, dass ich Gardenly verwende.
                                </label>
                                <select required id="si3" name="si3" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: si3-->

                            <!--begin :: title Facilitating Conditions -->
                            <div class="flex items-center py-6">
                                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Facilitating Conditions / Erleichternde Bedingungen</h2>
                            </div>
                            <!--end :: title Facilitating Conditions -->


                            <!--begin :: fc1-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="fc1">
                                    FC1: Ich habe die notwendigen Ressourcen zum Verwenden von Gardenly.
                                </label>
                                <select required id="fc1" name="fc1" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: fc1-->
                            <!--begin :: fc2-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="fc2">
                                    FC2: Ich habe das notwendige Wissen zum Verwenden von Gardenly.
                                </label>
                                <select required id="fc2" name="fc2" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: fc2-->
                            <!--begin :: fc3-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="q14">
                                    FC3: Gardenly ist kompatibel mit anderen von mir benutzten Technologien und Anwendungen.
                                </label>
                                <select required id="fc3" name="fc3" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: fc3-->
                            <!--begin :: fc4-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="fc4">
                                    FC4: Ich kann Hilfe von anderen bekommen, wenn ich Schwierigkeiten beim Verwenden von Gardenly habe.
                                </label>
                                <select required id="fc4" name="fc4" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: fc4-->

                            <!--begin :: title Hedonic Motivation  -->
                            <div class="flex items-center py-6">
                                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Hedonic Motivation / Hedonische Motivation</h2>
                            </div>
                            <!--end :: title Hedonic Motivation  -->


                            <!--begin :: hm1-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="hm1">
                                    HM1: Gardenly zu verwenden macht Spaß.
                                </label>
                                <select required id="hm1" name="hm1" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: hm1-->
                            <!--begin :: hm2-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="hm2">
                                    HM2: Gardenly zu verwenden ist vergnüglich.
                                </label>
                                <select required id="hm2" name="hm2" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: hm2-->
                            <!--begin :: hm3-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="hm3">
                                    HM3: Gardenly zu verwenden ist sehr unterhaltsam.
                                </label>
                                <select required id="hm3" name="hm3" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: hm3-->

                            <!--begin :: title Price Value  -->
                            <div class="flex items-center py-6">
                                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Price Value / Preis-Leistungs-Verhältnis</h2>
                            </div>
                            <!--end :: title Price Value  -->


                            <!--begin :: pv1-->
                            <div class="mb-4">
                                <!--begin :: notice -->
                                <p>
                                    Bitte stelle dir für die folgenden Fragen vor, dass Gardenly 70,- € kosten würde.
                                </p>
                                <div style="padding: 10px"></div>
                                <!--end :: notice -->
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="pv1">
                                    PV1: Gardenly ist preisgünstig (Kaufpreis 70,- €).
                                </label>
                                <select required id="pv1" name="pv1" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: pv1-->
                            <!--begin :: pv2-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="pv2">
                                    PV2: Gardenly bietet einen guten Nutzen für das Geld (Kaufpreis 70,- €).
                                </label>
                                <select required id="pv2" name="pv2" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: pv2-->
                            <!--begin :: pv3-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="pv3">
                                    PV3: Zum derzeitigen Preis bietet Gardenly einen guten Nutzen (Kaufpreis 70,- €).
                                </label>
                                <select required id="pv3" name="pv3" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: pv3-->

                            <!--begin :: title Habit  -->
                            <div class="flex items-center py-6">
                                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Habit / Gewohnheit</h2>
                            </div>
                            <!--end :: title Habit  -->


                            <!--begin :: ht1-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="ht1">
                                    HT1: Gardenly zu verwenden ist bei mir zur Angewohnheit geworden.
                                </label>
                                <select required id="ht1" name="ht1" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: ht1-->
                            <!--begin :: ht2-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="ht2">
                                    HT2: Ich bin süchtig danach Gardenly zu verwenden.
                                </label>
                                <select required id="ht2" name="ht2" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: ht2-->
                            <!--begin :: ht3-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="ht3">
                                    HT3: Ich muss Gardenly verwenden.
                                </label>
                                <select required id="ht3" name="ht3" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: ht3-->
                            <!--begin :: ht4-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="ht4">
                                    HT4: Gardenly zu verwenden ist bei mir zu etwas Natürlichem geworden.
                                </label>
                                <select required id="ht4" name="ht4" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: ht4-->

                            <!--begin :: title Behavioral Intention -->
                            <div class="flex items-center py-6">
                                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Behavioral Intention / Verhaltensabsicht</h2>
                            </div>
                            <!--end :: title Behavioral Intention -->


                            <!--begin :: bi1-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="bi1">
                                    BI1: Ich beabsichtige, in der Zukunft auch weiterhin Gardenly zu verwenden.
                                </label>
                                <select required id="bi1" name="bi1" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: bi1-->
                            <!--begin :: bi2-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="bi2">
                                    BI2: Ich werde im Alltag immer versuchen, Gardenly zu verwenden.
                                </label>
                                <select required id="bi2" name="bi2" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: bi2-->
                            <!--begin :: bi3-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="bi3">
                                    BI3: Ich habe vor, weiterhin regelmäßig Gardenly zu verwenden.
                                </label>
                                <select required id="bi3" name="bi3" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: bi3-->

                            <!--begin :: title Use Behavior -->
                            <div class="flex items-center py-6">
                                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Use Behavior / Verwendung</h2>
                            </div>
                            <!--end :: title Use Behavior -->


                            <!--begin :: use-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="use">
                                    USE: Bitte wähle deine Nutzungshäufigkeit von Gardenly aus:
                                </label>
                                <select required id="use" name="use" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
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
                            <!--end :: use-->

                            <!--begin :: title Software Quality -->
                            <div class="flex items-center py-6">
                                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">App (Software) Qualität</h2>
                            </div>
                            <!--end :: title Software Quality -->


                            <!--begin :: sq1-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="sq1">
                                    SQ1: Die App sieht attraktiv aus und nutzt passende Schriftarten und Farben.
                                </label>
                                <select required id="sq1" name="sq1" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: sq1-->
                            <!--begin :: sq2-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="sq2">
                                    SQ2: Die App sieht gut organisiert aus.
                                </label>
                                <select required id="sq2" name="sq2" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: sq2-->
                            <!--begin :: sq3-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="sq3">
                                    SQ3: Die App ist jederzeit erreichbar und zuverlässig.
                                </label>
                                <select required id="sq3" name="sq3" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: sq3-->
                            <!--begin :: sq4-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="sq4">
                                    SQ4: Die App ist vertrauenswürdig.
                                </label>
                                <select required id="sq4" name="sq4" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: sq4-->
                            <!--begin :: sq5-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="sq5">
                                    SQ5: Der Inhalt der App ist nützlich und stets aktuell.
                                </label>
                                <select required id="sq5" name="sq5" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: sq5-->

                            <!--begin :: title Hardware Quality -->
                            <div class="flex items-center py-6">
                                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Geräte (Hardware) Qualität</h2>
                            </div>
                            <!--end :: title Hardware Quality -->


                            <!--begin :: hq1-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="hq1">
                                    HQ1: Das Gerät sieht attraktiv aus und nutzt passende Bauteile.
                                </label>
                                <select required id="hq1" name="hq1" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: hq1-->
                            <!--begin :: hq2-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="hq2">
                                    HQ2: Das Gerät sieht gut organisiert aus.
                                </label>
                                <select required id="hq2" name="hq2" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: hq2-->
                            <!--begin :: hq3-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="hq3">
                                    HQ3: Das Gerät ist jederzeit betriebsbereit und zuverlässig.
                                </label>
                                <select required id="hq3" name="hq3" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: hq3-->
                            <!--begin :: hq4-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="hq4">
                                    HQ4: Das Gerät ist vertrauenswürdig.
                                </label>
                                <select required id="hq4" name="hq4" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: hq4-->
                            <!--begin :: hq5-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="hq5">
                                    HQ5: Die Informationen die das Gerät liefern sind nützlich und stets aktuell.
                                </label>
                                <select required id="hq5" name="hq5" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                                    <option value="" disabled selected>Bitte wählen</option>
                                    <option value="Stimme absolut zu">Stimme absolut zu</option>
                                    <option value="Stimme zu">Stimme zu</option>
                                    <option value="Stimme eher zu">Stimme eher zu</option>
                                    <option value="Neutral">Neutral</option>
                                    <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                                    <option value="Stimme nicht zu">Stimme nicht zu</option>
                                    <option value="Stimme überhaupt nicht zu">Stimme überhaupt nicht zu</option>

                                </select>
                            </div>
                            <!--end :: hq5-->


                            <!--begin :: title Offene Fragen -->
                            <div class="flex items-center py-6">
                                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Offene Fragen</h2>
                            </div>
                            <!--end :: title Offene Fragen -->


                            <!--begin :: lob-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="lob">
                                    Folgendes lobe ich besonders an Gardenly.
                                </label>
                                <textarea required class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline" 
                                          id="lob" 
                                          name="lob" 
                                          rows="4"
                                          ></textarea>
                            </div>
                            <!--end :: lob-->
                            <!--begin :: kritik-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="kritik">
                                    Folgendes kritisiere ich besonders an Gardenly.
                                </label>
                                <textarea required class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline" 
                                          id="kritik" 
                                          name="kritik" 
                                          rows="4"
                                          ></textarea>
                            </div>
                            <!--end :: kritik-->
                            <!--begin :: weiterentwicklung-->
                            <div class="mb-4">
                                <label class="block text-gray-900 text-sm font-bold mb-2"
                                       for="weiterentwicklung">
                                    Folgendes würde ich mir für eine nächste Version von Gardenly wünschen.
                                </label>
                                <textarea required class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline" 
                                          id="weiterentwicklung" 
                                          name="weiterentwicklung" 
                                          rows="4"
                                          ></textarea>
                            </div>
                            <!--end :: weiterentwicklung-->
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
