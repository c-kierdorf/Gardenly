/*
    Document   : letterCountPreQuestionaire.js
    Created on : 21.11.2022, 17:58:27
    Author     : CK
    Description: Letter Counter for open questions in pre- and post-questionnaire
*/

// letter counter for textarea "Erwartungen"
const inputErwartungen = document.getElementById("erwartungen");
const letterCountErwartungen = document.getElementById("letter-count-erwartungen");
inputErwartungen.addEventListener("input", () => {
    const letterCount = (inputErwartungen.value.match(/[a-z]/gi) || []).length;

    letterCountErwartungen.textContent = 500 - letterCount;
});