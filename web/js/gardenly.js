function showLoginForm() {
    let loginForm = document.getElementById("loginForm");
    let loginButton = document.getElementById("loginButton");
    let registerButton = document.getElementById("registerButton");
    if (loginForm.style.display === "none") {
        loginForm.style.display = "block";
        loginButton.style.display = "none";
        registerButton.style.display = "none";
    } else {
        loginForm.style.display = "none";
        loginButton.style.display = "block";
        registerButton.style.display = "block";
    }
}

function hideLoginForm() {
    let loginForm = document.getElementById("loginForm");
    let loginButton = document.getElementById("loginButton");
    let registerButton = document.getElementById("registerButton");
    if (loginForm.style.display === "block") {
        loginForm.style.display = "none";
        loginButton.style.display = "block";
        registerButton.style.display = "block";
    } else {
        loginForm.style.display = "block";
        loginButton.style.display = "none";
        registerButton.style.display = "none";
    }
}

function showRegistrationForm() {
    let registrationForm = document.getElementById("registrationForm");
    let registrationInfo = document.getElementById("registrationInfo");
    if (registrationForm.style.display === "none") {
        registrationForm.style.display = "block";
        registrationInfo.style.display = "none";
    } else {
        registrationForm.style.display = "none";
        registrationInfo.style.display = "block";
    }
}

function hideregistrationForm() {
    let registrationForm = document.getElementById("registrationForm");
    let registrationInfo = document.getElementById("registrationInfo");
    if (registrationForm.style.display === "block") {
        registrationForm.style.display = "none";
        registrationInfo.style.display = "block";
    } else {
        registrationForm.style.display = "block";
        registrationInfo.style.display = "none";
    }
}

function userPlantAdd() {

    let plantId = document.getElementById("plantType").value;
    
    const xhttp = new XMLHttpRequest();
    xhttp.onload = function () {
        document.getElementById("dynamicContent").innerHTML = this.responseText;
    };
    xhttp.open("GET", "GetPlantDetails?id=" + plantId, true);
    xhttp.send();
}

