// get all add buttons (top right corner and tile)
var addPlantsButtons = document.getElementsByClassName("add-plant");
var closeButton = document.getElementById("close-button");
var shield = document.getElementById("shield");
var overlay = document.getElementById("overlay");
var loginButton = document.getElementById("login");
var registerWithMail = document.getElementById("register-with-mail");


// show shield
function showShield() {
    shield.classList.remove('hidden');
    shield.classList.add('block','animate__fadeIn');
    console.log("Shield angezeigt, und Animation go");

    var handler = function() {
        shield.removeEventListener("animationend", handler, false);
        shield.classList.remove('animate__fadeIn');
        console.log("Shield Animation fertig und class removed");
    };
    shield.addEventListener("animationend", handler, false);
}

// hide shield
function hideShield() {

    shield.classList.add('animate__fadeOut');

    let handler = function() {
        shield.removeEventListener("animationend", handler, false);
        shield.classList.remove('animate__fadeOut','block');
        shield.classList.add('hidden');
        console.log("Shield Outro Animation Class removed");
    };
    shield.addEventListener("animationend", handler, false);
    console.log("close button clicked");
}

// show overlay
function showOverlay() {
    showShield();
    overlay.classList.remove('hidden');
    overlay.classList.add('block','animate__fadeInUpBig');
    console.log("Overlay angezeigt, und Animation go");

    let handler = function() {
        overlay.removeEventListener('animationend', handler, false);
        overlay.classList.remove('animate__fadeInUpBig');
        console.log('❌ Overlay Entry Animation Class removed');
    };
    overlay.addEventListener("animationend", handler, false);

}

// hide overlay
function hideOverlay() {
    hideShield();
    overlay.classList.remove('animate__fadeInUpBig');
    overlay.classList.add('animate__fadeOutDownBig');   
    
    let handler = function() {
        overlay.removeEventListener("animationend", handler, false);
        overlay.classList.remove('block','animate__fadeOutDownBig');
        overlay.classList.add('hidden');
        console.log('ist fertig');
    };
    overlay.addEventListener("animationend", handler, false);

}

for (var i = 0; i < addPlantsButtons.length; i++) {
    addPlantsButtons[i].addEventListener('click', showOverlay, false);
}

closeButton.addEventListener('click', hideOverlay);
shield.addEventListener('click', hideOverlay);
try{
    loginButton.addEventListener('click', showOverlay);
} catch (e) {}

try{
    registerWithMail.addEventListener('click', showOverlay);
} catch (e) {}


function validatePassword() {
    var passwordValue = document.getElementById("password").value;
    console.log(passwordValue);
    errors = [];
    if (passwordValue.length >= 10) {
        document.getElementById("password-length-checker").classList.remove("fa-circle-xmark","text-red-500");
        document.getElementById("password-length-checker").classList.add("fa-check-circle", "text-main-green-500");
        errors.push("Your password must be at least 8 characters");
    } else{
        document.getElementById("password-length-checker").classList.remove("fa-check-circle", "text-main-green-500");
        document.getElementById("password-length-checker").classList.add("fa-circle-xmark","text-red-500");
        errors.push("Your password must contain at least one letter.");
    }
    if ((passwordValue.search(/[a-z]/) >= 0) && (passwordValue.search(/[A-Z]/) >= 0)) {
        document.getElementById("lowerUppercase-checker").classList.remove("fa-circle-xmark","text-red-500");
        document.getElementById("lowerUppercase-checker").classList.add("fa-check-circle", "text-main-green-500");
    } else{
        document.getElementById("lowerUppercase-checker").classList.remove("fa-check-circle", "text-main-green-500");
        document.getElementById("lowerUppercase-checker").classList.add("fa-circle-xmark","text-red-500");
        errors.push("Your password must contain at least one uppercase and one lowercase letter.");
    }
    if ((passwordValue.search(/[0-9]/)) >= 0) {
        document.getElementById("number-checker").classList.remove("fa-circle-xmark","text-red-500");
        document.getElementById("number-checker").classList.add("fa-check-circle", "text-main-green-500");
        errors.push("Your password must contain at least one digit.");
    } else{
        document.getElementById("number-checker").classList.remove("fa-check-circle", "text-main-green-500");
        document.getElementById("number-checker").classList.add("fa-circle-xmark","text-red-500");
    }
    if ((passwordValue.search(/[^A-Za-z0-9]/)) >= 0) {
        document.getElementById("special-char-checker").classList.remove("fa-circle-xmark","text-red-500");
        document.getElementById("special-char-checker").classList.add("fa-check-circle", "text-main-green-500");
        errors.push("Your password must contain at least one digit.");
    } else{
        document.getElementById("special-char-checker").classList.remove("fa-check-circle", "text-main-green-500");
        document.getElementById("special-char-checker").classList.add("fa-circle-xmark","text-red-500");
        errors.push("Your password must contain at least one special character.");
    }

    if (errors.length > 0) {
        
        return false;
    }
    return true;
}

document.getElementById("password").addEventListener('input', validatePassword);


function checkStrength(){
    return {
        showPasswordField: true,
        passwordScore: 0,
        password: '',
        chars: {
            lower: 'abcdefghijklmnopqrstuvwxyzäöü',
            upper: 'ABCDEFGHIJKLMNOPQRSTUVWXYZÄÖÜ',
            numeric: '0123456789',
            symbols: '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'
        },
        charsLength: 10,
        checkStrength: function() {
            if(!this.password) return this.passwordScore = 0;
            this.passwordScore = zxcvbn(this.password).score + 1;
        },
       
    }
}