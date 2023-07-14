
window.onload=loadMessage;

function loadMessage(){
    var msg = document.getElementById("addmsg").textContent;
    if(msg!==null && msg!==""){
        alert(msg);
    }
}

var fn = 0;
var ln = 0;
var e = 0;
var p = 0;
var ps = 0; 


function validateFirstName() {
    var firstNameInput = document.getElementById("first-name");
    var firstNameSpan = document.getElementById("first-name-span");

    if (firstNameInput.value.length > 20 || !/^[a-zA-Z]+$/.test(firstNameInput.value)) {
       
            firstNameSpan.textContent = "First name must be less than or equal to 20 characters and contain only letters.";
        
       
        firstNameSpan.style.color = "red";
        firstNameSpan.style.fontSize = "12px";
        firstNameSpan.style.display = "block";
        firstNameSpan.style.textAlign = "center";
        firstNameInput.style.border="solid red 1px";
        fn=1;
        fullform();
    } else {
        firstNameSpan.textContent = "";
        firstNameSpan.style.color = "";
        firstNameSpan.style.fontSize = "";
        firstNameSpan.style.display = "";
        firstNameSpan.style.textAlign = "";
        firstNameInput.style.border="";
        fn=0;
        fullform();
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
        lastNameInput.style.border="solid red 1px";
        ln=1;
        fullform();
    } else {
        lastNameSpan.textContent = "";
        lastNameSpan.style.color = "";
        lastNameSpan.style.fontSize = "";
        lastNameSpan.style.display = "";
        lastNameSpan.style.textAlign = "";
        lastNameInput.style.border="";
        ln=0;
        fullform();

    }
}

function validateEmail() {
    var emailInput = document.getElementById("email");
    var emailSpan = document.getElementById("email-span");
    if (!/^[a-zA-Z0-9._]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(emailInput.value)) {
    
            emailSpan.textContent = "Email must be in valid email format! (johndoe@gmail.com)";
        
        
        emailSpan.style.color = "red";
        emailSpan.style.fontSize = "12px";
        emailSpan.style.display = "block";
        emailSpan.style.textAlign = "center";
        emailInput.style.border="solid red 1px";
        e=1;
        fullform();

    } else {
        emailSpan.textContent = "";
        emailSpan.style.color = "";
        emailSpan.style.fontSize = "";
        emailSpan.style.display = "";
        emailSpan.style.textAlign = "";
        emailInput.style.border="";
        e=0;
        fullform();
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
        phoneInput.style.border="solid red 1px";
        p=1;
        fullform();
    } else {
        phoneSpan.textContent = "";
        phoneSpan.style.color = "";
        phoneSpan.style.fontSize = "";
        phoneSpan.style.display = "";
        phoneSpan.style.textAlign = "";
        phoneInput.style.border="";
        p=0;
        fullform();
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
        passInput.style.border="solid red 1px";
        ps=1;
        fullform();
    } else {
        passSpan.textContent = "";
        passSpan.style.color = "";
        passSpan.style.fontSize = "";
        passSpan.style.display = "";
        passSpan.style.textAlign = "";
        passInput.style.border="";
        ps=0;
        fullform();
    }
}
function fullform() {
    var sum = fn + ln + e + p + ps;
    var button = document.getElementById("submitbutton");
    if (sum !== 0) {
        button.style.border = "solid red 1px";
        button.style.backgroundColor = "red";
        button.disabled = true;
        button.style.cursor = "default";
    } else {
        button.style.border = "";
        button.style.backgroundColor = "#0B486B";
        button.disabled = false;
        button.style.cursor = "pointer";
    }
}

//$(document).ready(function() {
//  $('#submitbutton').click(function(event) {
//    event.preventDefault(); // Prevent form submission
//
//    // Call the addUser function with the message parameter
//    addUser("${message}");
//  });
//});

function addUser(message) {
  if (message !== "Account created!") {
    $('#addmsg').text(message);
    $('#newUsersModal').modal('show');
  }
}


//function addUser(message) {
//  if (message !== "") {
//    $('#addmsg').text(message);
////    $('#newUsersModal').modal('show');
//    $('#newUsersModal').modal({
//      backdrop: 'static',
//      keyboard: false
//    });
//  }
//}

//  function addUser() {
//    var message = "${message}";
//    if (message !== "") {
//      $('#addmsg').text(message);
//      $('#newUsersModal').modal('show');
//      return false;
//    }
//  }






