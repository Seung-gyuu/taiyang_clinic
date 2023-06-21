/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validateFirstName() {
    var firstNameInput = document.getElementById("first-name");
    var firstNameSpan = document.getElementById("first-name-span");

    if (firstNameInput.value.length > 20 || !/^[a-zA-Z]+$/.test(firstNameInput.value)) {
        firstNameSpan.textContent = "First name must be less than or equal to 20 characters and contain only letters.";
        firstNameSpan.style.color = "red";
        firstNameSpan.style.fontSize = "12px";
        firstNameSpan.style.display = "block";
        firstNameSpan.style.textAlign = "center";
    } else {
        firstNameSpan.textContent = "";
        firstNameSpan.style.color = "";
        firstNameSpan.style.fontSize = "";
        firstNameSpan.style.display = "";
        firstNameSpan.style.textAlign = "";
    }
}

function validateLastName() {
    var lastNameInput = document.getElementById("last-name");
    var lastNameSpan = document.getElementById("last-name-span");

    if (lastNameInput.value.length > 20 || !/^[a-zA-Z]+$/.test(lastNameInput.value)) {
        lastNameSpan.textContent = "Last name must be less than or equal to 20 characters and contain only letters.";
        lastNameSpan.style.color = "red";
        lastNameSpan.style.fontSize = "12px";
        lastNameSpan.style.display = "block";
        lastNameSpan.style.textAlign = "center";

    } else {
        lastNameSpan.textContent = "";
        lastNameSpan.style.color = "";
        lastNameSpan.style.fontSize = "";
        lastNameSpan.style.display = "";
        lastNameSpan.style.textAlign = "";

    }
}

function validateEmail() {
    var emailInput = document.getElementById("email");
    var emailSpan = document.getElementById("email-span");
    if (!/\S+@\S+\.\S+/.test(emailInput.value)) {
        emailSpan.textContent = "Email must be in valid email format! (johndoe@gmail.com)";
        emailSpan.style.color = "red";
        emailSpan.style.fontSize = "12px";
        emailSpan.style.display = "block";
        emailSpan.style.textAlign = "center";

    } else {
        emailSpan.textContent = "";
        emailSpan.style.color = "";
        emailSpan.style.fontSize = "";
        emailSpan.style.display = "";
        emailSpan.style.textAlign = "";
    }
}

function validatePhone() {
    var phoneInput = document.getElementById("phone");
    var phoneSpan = document.getElementById("phone-span");
    if (!/^\d{10}$/.test(phoneInput.value)) {
        phoneSpan.textContent = "Phone must be in valid format! (4031231234)";
        phoneSpan.style.color = "red";
        phoneSpan.style.fontSize = "12px";
        phoneSpan.style.display = "block";
        phoneSpan.style.textAlign = "center";
    } else {
        phoneSpan.textContent = "";
        phoneSpan.style.color = "";
        phoneSpan.style.fontSize = "";
        phoneSpan.style.display = "";
        phoneSpan.style.textAlign = "";
    }
}

function validatePassword() {
    var passInput = document.getElementById("password");
    var passSpan = document.getElementById("password-span");
    if (passInput.value.length <= 8 || !/\d/.test(passInput.value)) {
        passSpan.textContent = "Password must have at least 8 characters and at least 1 digit";
        passSpan.style.color = "red";
        passSpan.style.fontSize = "12px";
        passSpan.style.display = "block";
        passSpan.style.textAlign = "center";
    } else {
        passSpan.textContent = "";
        passSpan.style.color = "";
        passSpan.style.fontSize = "";
        passSpan.style.display = "";
        passSpan.style.textAlign = "";

    }
}
