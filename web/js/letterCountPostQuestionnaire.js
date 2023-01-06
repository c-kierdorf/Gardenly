/*
    Document   : letterCountPostQuestionnaire.js
    Created on : 21.11.2022, 17:58:27
    Author     : CK
    Description: Letter Counter for open questions in pre- and post-Questionnaire
*/

// letter counter for textarea "Lob"
const inputLob = document.getElementById("lob");
const letterCountLob = document.getElementById("letter-count-lob");
inputLob.addEventListener("input", () => {
    const letterCount = (inputLob.value.match(/[a-z]/gi) || []).length;

    letterCountLob.textContent = 500 - letterCount;
});

// letter counter for textarea "Kritik"
const inputKritik = document.getElementById("kritik");
const letterCountKritik = document.getElementById("letter-count-kritik");
inputKritik.addEventListener("input", () => {
    const letterCount = (inputKritik.value.match(/[a-z]/gi) || []).length;

    letterCountKritik.textContent = 500 - letterCount;
});

// letter counter for textarea "Weiterentwicklung"
const inputWeiterentwicklung = document.getElementById("weiterentwicklung");
const letterCountWeiterentwicklung = document.getElementById("letter-count-weiterentwicklung");
inputWeiterentwicklung.addEventListener("input", () => {
    const letterCount = (inputWeiterentwicklung.value.match(/[a-z]/gi) || []).length;

    letterCountWeiterentwicklung.textContent = 500 - letterCount;
});
