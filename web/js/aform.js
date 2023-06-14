var users = [
    {firstName: "John", lastName: "Doe", email: "john.doe@example.com", phoneNumber: "1234567890", consentForm: "", medicalForm: ""},
    {firstName: "Jane", lastName: "Smith", email: "jane.smith@example.com", phoneNumber: "9876543210", consentForm: "", medicalForm: ""}
];

var searchUserInput = document.getElementById("searchUserInput");
var searchUserBtn = document.getElementById("searchUserBtn");
var userTableBody = document.getElementById("userTableBody");
var formsSection = document.getElementById("formsSection");
var consentFormTextarea = document.getElementById("consentFormTextarea");
var medicalFormTextarea = document.getElementById("medicalFormTextarea");
var uploadButton = document.getElementById("uploadButton");
var saveButton = document.getElementById("saveButton");

searchUserBtn.addEventListener("click", function () {
    var searchTerm = searchUserInput.value.trim().toLowerCase();
    var matchedUsers = users.filter(function (user) {
        var fullName = user.firstName.toLowerCase() + " " + user.lastName.toLowerCase();
        return fullName.includes(searchTerm);
    });

    displayUserTable(matchedUsers);
});

function displayUserTable(users) {
    userTableBody.innerHTML = "";

    users.forEach(function (user) {
        var row = document.createElement("tr");

        var firstNameCell = document.createElement("td");
        firstNameCell.textContent = user.firstName;
        row.appendChild(firstNameCell);

        var lastNameCell = document.createElement("td");
        lastNameCell.textContent = user.lastName;
        row.appendChild(lastNameCell);

        var emailCell = document.createElement("td");
        emailCell.textContent = user.email;
        row.appendChild(emailCell);

        var phoneNumberCell = document.createElement("td");
        phoneNumberCell.textContent = user.phoneNumber;
        row.appendChild(phoneNumberCell);

        var actionsCell = document.createElement("td");
        var viewButton = document.createElement("button");
        viewButton.className = "btn btn-primary";
        viewButton.textContent = "View";
        viewButton.addEventListener("click", function () {
            displayForms(user);
        });
        actionsCell.appendChild(viewButton);

        row.appendChild(actionsCell);

        userTableBody.appendChild(row);
    });
}

function displayForms(user) {
    consentFormTextarea.value = user.consentForm;
    medicalFormTextarea.value = user.medicalForm;

    formsSection.style.display = "block";

    uploadButton.addEventListener("click", function () {

        alert("File uploaded successfully!");
    });

    saveButton.addEventListener("click", function () {

        alert("Form saved successfully!");
    });
}
