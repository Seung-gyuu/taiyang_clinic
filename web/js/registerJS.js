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
    } else {
        firstNameSpan.textContent = "";
    }
}

function validateLastName() {
    var lastNameInput = document.getElementById("last-name");
    var lastNameSpan = document.getElementById("last-name-span");

    if (lastNameInput.value.length > 20 || !/^[a-zA-Z]+$/.test(lastNameInput.value)) {
        lastNameSpan.textContent = "Last name must be less than or equal to 20 characters and contain only letters.";
    } else {
        lastNameSpan.textContent = "";
    }
}

function validateEmail() {
    var emailInput = document.getElementById("email");
    var emailSpan = document.getElementById("email-span");
    if (!/\S+@\S+\.\S+/.test(emailInput.value)) {
        emailSpan.textContent = "Email must be in valid email format! (johndoe@gmail.com)";
    } else {
        emailSpan.textContent = "";
    }
}

function validatePhone() {
    var phoneInput = document.getElementById("phone");
    var phoneSpan = document.getElementById("phone-span");
    if (!/^\d{10}$/.test(phoneInput.value)) {
        phoneSpan.textContent = "Phone must be in valid format! (4031231234)";
    } else {
        phoneSpan.textContent = "";
    }
}

function validatePassword() {
    var passInput = document.getElementById("password");
    var passSpan = document.getElementById("password-span");
    if (passInput.value.length <= 8 || !/\d/.test(passInput.value)) {
        passSpan.textContent = "Password must have at least 8 characters and at least 1 digit";
    } else {
        passSpan.textContent = "";
    }
}