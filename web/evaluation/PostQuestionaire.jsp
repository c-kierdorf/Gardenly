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
                <a href="javascript:history.back()" class="add-plant">
                    <i class="fa fa-chevron-left font-bold text-xl px-3 pt-3 text-main-green"></i>
                </a>
                <h2 class="text-3xl pt-2 text-main-green font-Metropolis font-bold">Nach-Befragung</h2>
            </div>

        </div>
        <!-- edit personal data form start -->
        <div class="container px-4 mx-auto">
            <div class="w-full mt-6">
                <p>
                    Dieser Fragebogen gibt Ihnen die Möglichkeit, Ihre Zufriedenheit mit der mit der Benutzerfreundlichkeit Ihres primären Computersystems auszudrücken. Ihre Antworten werden uns helfen zu verstehen, welche Aspekte des Systems Ihnen besonders wichtig sind und die Aspekte, die Sie zufrieden stellen. Denken Sie bitte so weit wie möglich an alle Aufgaben, die Sie mit dem System erledigt haben, während Sie diese Fragen beantworten. Bitte lesen Sie jede Aussage und geben Sie an, wie sehr Sie ihr zustimmen oder nicht zustimmen der Aussage zustimmen oder nicht zustimmen, indem Sie eine Zahl auf der Skala ankreuzen. Wenn eine Aussage nicht auf Sie zutrifft kreisen Sie bitte "Keine Angabe" ein. Wann immer es angebracht ist, schreiben Sie bitte Kommentare zur Erläuterung Ihre Antworten. Wir danken Ihnen!
                </p>
                <div style="padding: 10px"></div>
                <form action="PostQuestionaireSuccess" method="POST">
                    <!--begin :: Nickname-->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2" 
                               for="nickName">
                            Vorname oder Nickname (bitte korrekt schreiben, sonst muss man alles wieder neu ausfüllen)
                        </label>
                        <input class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline" 
                               type="text" 
                               id="nickName" 
                               name="nickName" 
                               required>
                    </div>
                    <!--end :: Nickname-->
                    
                    <!--begin :: q1-->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="q1">
                            Insgesamt bin ich zufrieden damit, wie einfach das System zu bedienen ist.
                        </label>
                        <select required id="q1" name="q1" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="Stimme ausdrücklich zu">Stimme ausdrücklich zu</option>
                            <option value="Stimme zu">Stimme zu</option>
                            <option value="Stimme eher zu">Stimme eher zu</option>
                            <option value="Neutral">Neutral</option>
                            <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                            <option value="Stimme nicht zu">Stimme nicht zu</option>
                            <option value="Stimme ausdrücklich nicht zu">Stimme ausdrücklich nicht zu</option>
                            <option value="Keine Angabe">Keine Angabe</option>
                        </select>
                    </div>
                    <!--end :: q1-->
                    <!--begin :: q2-->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="q2">
                            Es ist nicht einfach, das System zu bedienen.
                        </label>
                        <select required id="q2" name="q2" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="Stimme ausdrücklich zu">Stimme ausdrücklich zu</option>
                            <option value="Stimme zu">Stimme zu</option>
                            <option value="Stimme eher zu">Stimme eher zu</option>
                            <option value="Neutral">Neutral</option>
                            <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                            <option value="Stimme nicht zu">Stimme nicht zu</option>
                            <option value="Stimme ausdrücklich nicht zu">Stimme ausdrücklich nicht zu</option>
                            <option value="Keine Angabe">Keine Angabe</option>
                        </select>
                    </div>
                    <!--end :: q2-->
                    <!--begin :: q3-->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="q3">
                            Mit dem System kann ich das Ziel Pflanzenbewässerung effektiv erreichen.
                        </label>
                        <select required id="q3" name="q3" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="Stimme ausdrücklich zu">Stimme ausdrücklich zu</option>
                            <option value="Stimme zu">Stimme zu</option>
                            <option value="Stimme eher zu">Stimme eher zu</option>
                            <option value="Neutral">Neutral</option>
                            <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                            <option value="Stimme nicht zu">Stimme nicht zu</option>
                            <option value="Stimme ausdrücklich nicht zu">Stimme ausdrücklich nicht zu</option>
                            <option value="Keine Angabe">Keine Angabe</option>
                        </select>
                    </div>
                    <!--end :: q3-->
                    <!--begin :: q4-->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="q4">
                            Ich bin nicht in der Lage, mit dem System die Pflanzenbewässerung schnell zu erledigen.
                        </label>
                        <select required id="q4" name="q4" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="Stimme ausdrücklich zu">Stimme ausdrücklich zu</option>
                            <option value="Stimme zu">Stimme zu</option>
                            <option value="Stimme eher zu">Stimme eher zu</option>
                            <option value="Neutral">Neutral</option>
                            <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                            <option value="Stimme nicht zu">Stimme nicht zu</option>
                            <option value="Stimme ausdrücklich nicht zu">Stimme ausdrücklich nicht zu</option>
                            <option value="Keine Angabe">Keine Angabe</option>
                        </select>
                    </div>
                    <!--end :: q4-->
                    <!--begin :: q5-->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="q5">
                            Das System erlaubt mir, Pflanzenbewässerung effizient zu machen.
                        </label>
                        <select required id="q5" name="q5" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="Stimme ausdrücklich zu">Stimme ausdrücklich zu</option>
                            <option value="Stimme zu">Stimme zu</option>
                            <option value="Stimme eher zu">Stimme eher zu</option>
                            <option value="Neutral">Neutral</option>
                            <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                            <option value="Stimme nicht zu">Stimme nicht zu</option>
                            <option value="Stimme ausdrücklich nicht zu">Stimme ausdrücklich nicht zu</option>
                            <option value="Keine Angabe">Keine Angabe</option>
                        </select>
                    </div>
                    <!--end :: q5-->
                    <!--begin :: q6-->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="q6">
                            Ich fühle mich nicht wohl dabei, das System zu benutzen.
                        </label>
                        <select required id="q6" name="q6" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="Stimme ausdrücklich zu">Stimme ausdrücklich zu</option>
                            <option value="Stimme zu">Stimme zu</option>
                            <option value="Stimme eher zu">Stimme eher zu</option>
                            <option value="Neutral">Neutral</option>
                            <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                            <option value="Stimme nicht zu">Stimme nicht zu</option>
                            <option value="Stimme ausdrücklich nicht zu">Stimme ausdrücklich nicht zu</option>
                            <option value="Keine Angabe">Keine Angabe</option>
                        </select>
                    </div>
                    <!--end :: q6-->
                    <!--begin :: q7-->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="q7">
                            Es war einfach zu lernen, wie das System funktioniert.
                        </label>
                        <select required id="q7" name="q7" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="Stimme ausdrücklich zu">Stimme ausdrücklich zu</option>
                            <option value="Stimme zu">Stimme zu</option>
                            <option value="Stimme eher zu">Stimme eher zu</option>
                            <option value="Neutral">Neutral</option>
                            <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                            <option value="Stimme nicht zu">Stimme nicht zu</option>
                            <option value="Stimme ausdrücklich nicht zu">Stimme ausdrücklich nicht zu</option>
                            <option value="Keine Angabe">Keine Angabe</option>
                        </select>
                    </div>
                    <!--end :: q7-->
                    <!--begin :: q8-->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="q8">
                            Ich glaube, ich konnte das System schnell zweckmäßig bedienen.
                        </label>
                        <select required id="q8" name="q8" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="Stimme ausdrücklich zu">Stimme ausdrücklich zu</option>
                            <option value="Stimme zu">Stimme zu</option>
                            <option value="Stimme eher zu">Stimme eher zu</option>
                            <option value="Neutral">Neutral</option>
                            <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                            <option value="Stimme nicht zu">Stimme nicht zu</option>
                            <option value="Stimme ausdrücklich nicht zu">Stimme ausdrücklich nicht zu</option>
                            <option value="Keine Angabe">Keine Angabe</option>
                        </select>
                    </div>
                    <!--end :: q8-->
                    <!--begin :: q9-->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="q9">
                            Bei Fehlern zeigt das System klare Hinweise, wie ich den Fehler beheben kann.
                        </label>
                        <select required id="q9" name="q9" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="Stimme ausdrücklich zu">Stimme ausdrücklich zu</option>
                            <option value="Stimme zu">Stimme zu</option>
                            <option value="Stimme eher zu">Stimme eher zu</option>
                            <option value="Neutral">Neutral</option>
                            <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                            <option value="Stimme nicht zu">Stimme nicht zu</option>
                            <option value="Stimme ausdrücklich nicht zu">Stimme ausdrücklich nicht zu</option>
                            <option value="Keine Angabe">Keine Angabe</option>
                        </select>
                    </div>
                    <!--end :: q9-->
                    <!--begin :: q10-->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="q10">
                            Wenn ich einen Fehler gemacht habe, konnte ich diesen schnell wieder beheben.
                        </label>
                        <select required id="10" name="q10" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="Stimme ausdrücklich zu">Stimme ausdrücklich zu</option>
                            <option value="Stimme zu">Stimme zu</option>
                            <option value="Stimme eher zu">Stimme eher zu</option>
                            <option value="Neutral">Neutral</option>
                            <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                            <option value="Stimme nicht zu">Stimme nicht zu</option>
                            <option value="Stimme ausdrücklich nicht zu">Stimme ausdrücklich nicht zu</option>
                            <option value="Keine Angabe">Keine Angabe</option>
                        </select>
                    </div>
                    <!--end :: q10-->
                    <!--begin :: q11-->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="q11">
                            Die Informationen, die das System bereitstellt (Anleitungen oder Hinweise) sind unverständlich.
                        </label>
                        <select required id="11" name="q11" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="Stimme ausdrücklich zu">Stimme ausdrücklich zu</option>
                            <option value="Stimme zu">Stimme zu</option>
                            <option value="Stimme eher zu">Stimme eher zu</option>
                            <option value="Neutral">Neutral</option>
                            <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                            <option value="Stimme nicht zu">Stimme nicht zu</option>
                            <option value="Stimme ausdrücklich nicht zu">Stimme ausdrücklich nicht zu</option>
                            <option value="Keine Angabe">Keine Angabe</option>
                        </select>
                    </div>
                    <!--end :: q11-->
                    <!--begin :: q12-->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="q12">
                            Es ist einfach, die Informationen zu finden, die ich brauche.
                        </label>
                        <select required id="12" name="q12" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="Stimme ausdrücklich zu">Stimme ausdrücklich zu</option>
                            <option value="Stimme zu">Stimme zu</option>
                            <option value="Stimme eher zu">Stimme eher zu</option>
                            <option value="Neutral">Neutral</option>
                            <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                            <option value="Stimme nicht zu">Stimme nicht zu</option>
                            <option value="Stimme ausdrücklich nicht zu">Stimme ausdrücklich nicht zu</option>
                            <option value="Keine Angabe">Keine Angabe</option>
                        </select>
                    </div>
                    <!--end :: q12-->
                    <!--begin :: q13-->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="q13">
                            Die Informationen, die das System bereitstellt, sind nicht einfach zu verstehen.
                        </label>
                        <select required id="13" name="q13" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="Stimme ausdrücklich zu">Stimme ausdrücklich zu</option>
                            <option value="Stimme zu">Stimme zu</option>
                            <option value="Stimme eher zu">Stimme eher zu</option>
                            <option value="Neutral">Neutral</option>
                            <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                            <option value="Stimme nicht zu">Stimme nicht zu</option>
                            <option value="Stimme ausdrücklich nicht zu">Stimme ausdrücklich nicht zu</option>
                            <option value="Keine Angabe">Keine Angabe</option>
                        </select>
                    </div>
                    <!--end :: q13-->
                    <!--begin :: q14-->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="q14">
                            Die Informationen sind effizient und helfen mir, das System zweckmäßig zu bedienen.
                        </label>
                        <select required id="14" name="q14" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="Stimme ausdrücklich zu">Stimme ausdrücklich zu</option>
                            <option value="Stimme zu">Stimme zu</option>
                            <option value="Stimme eher zu">Stimme eher zu</option>
                            <option value="Neutral">Neutral</option>
                            <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                            <option value="Stimme nicht zu">Stimme nicht zu</option>
                            <option value="Stimme ausdrücklich nicht zu">Stimme ausdrücklich nicht zu</option>
                            <option value="Keine Angabe">Keine Angabe</option>
                        </select>
                    </div>
                    <!--end :: q14-->
                    <!--begin :: q15-->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="q15">
                            Die Informationen auf dem Display sind klar verständlich.
                        </label>
                        <select required id="15" name="q15" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="Stimme ausdrücklich zu">Stimme ausdrücklich zu</option>
                            <option value="Stimme zu">Stimme zu</option>
                            <option value="Stimme eher zu">Stimme eher zu</option>
                            <option value="Neutral">Neutral</option>
                            <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                            <option value="Stimme nicht zu">Stimme nicht zu</option>
                            <option value="Stimme ausdrücklich nicht zu">Stimme ausdrücklich nicht zu</option>
                            <option value="Keine Angabe">Keine Angabe</option>
                        </select>
                    </div>
                    <!--end :: q15-->
                    <!--begin :: q16-->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="q16">
                            Das Interface des Systems ist angenehm.
                        </label>
                        <select required id="16" name="q16" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="Stimme ausdrücklich zu">Stimme ausdrücklich zu</option>
                            <option value="Stimme zu">Stimme zu</option>
                            <option value="Stimme eher zu">Stimme eher zu</option>
                            <option value="Neutral">Neutral</option>
                            <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                            <option value="Stimme nicht zu">Stimme nicht zu</option>
                            <option value="Stimme ausdrücklich nicht zu">Stimme ausdrücklich nicht zu</option>
                            <option value="Keine Angabe">Keine Angabe</option>
                        </select>
                    </div>
                    <!--end :: q16-->
                    <!--begin :: q17-->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="q17">
                            Mag es, das Interface des Systems zu bedienen.
                        </label>
                        <select required id="17" name="q17" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="Stimme ausdrücklich zu">Stimme ausdrücklich zu</option>
                            <option value="Stimme zu">Stimme zu</option>
                            <option value="Stimme eher zu">Stimme eher zu</option>
                            <option value="Neutral">Neutral</option>
                            <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                            <option value="Stimme nicht zu">Stimme nicht zu</option>
                            <option value="Stimme ausdrücklich nicht zu">Stimme ausdrücklich nicht zu</option>
                            <option value="Keine Angabe">Keine Angabe</option>
                        </select>
                    </div>
                    <!--end :: q17-->
                    <!--begin :: q18-->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="q18">
                            Das System hat alle Funktionen und Möglichkeiten, die ich erwarte.
                        </label>
                        <select required id="18" name="q18" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="Stimme ausdrücklich zu">Stimme ausdrücklich zu</option>
                            <option value="Stimme zu">Stimme zu</option>
                            <option value="Stimme eher zu">Stimme eher zu</option>
                            <option value="Neutral">Neutral</option>
                            <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                            <option value="Stimme nicht zu">Stimme nicht zu</option>
                            <option value="Stimme ausdrücklich nicht zu">Stimme ausdrücklich nicht zu</option>
                            <option value="Keine Angabe">Keine Angabe</option>
                        </select>
                    </div>
                    <!--end :: q18-->
                    <!--begin :: q19-->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="q19">
                            Insgesamt bin ich unzufrieden mit dem System.
                        </label>
                        <select required id="19" name="q19" class="shadow appearance-none border transition-all focus:border-main-green-500 rounded w-full py-2 px-3 text-gray-900 leading-tight focus:outline-none focus:shadow-outline">
                            <option value="" disabled selected>Bitte wählen</option>
                            <option value="Stimme ausdrücklich zu">Stimme ausdrücklich zu</option>
                            <option value="Stimme zu">Stimme zu</option>
                            <option value="Stimme eher zu">Stimme eher zu</option>
                            <option value="Neutral">Neutral</option>
                            <option value="Stimme eher nicht zu">Stimme eher nicht zu</option>
                            <option value="Stimme nicht zu">Stimme nicht zu</option>
                            <option value="Stimme ausdrücklich nicht zu">Stimme ausdrücklich nicht zu</option>
                            <option value="Keine Angabe">Keine Angabe</option>
                        </select>
                    </div>
                    <!--end :: q19-->
                    <!--begin :: lob-->
                    <div class="mb-4">
                        <label class="block text-gray-900 text-sm font-bold mb-2"
                               for="lob">
                            Folgendes lobe ich besonders an dem System.
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
                            Folgendes kritisiere ich besonders an dem System.
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
                            Folgendes würde ich mir für eine nächste Version des Systems wünschen.
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
