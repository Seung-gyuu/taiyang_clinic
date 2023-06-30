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


function formPopUp(userId) {
    fetch('/getUserInfo?userId=' + userId)
            .then(response => response.json())
            .then(data => {
                var firstName = data.firstName;
                var lastName = data.lastName;
                var email = data.email;
                var userId = data.userId;
                // Get the reference to your popup box element
                var popupBox = document.getElementById('popupBox');

                //                var span = document.getElementsByClassName("book_close")[0];

                // Update the content of the popup box with the retrieved day name and month name
                var output = "<div class='popupText'> Add Form for  " + firstName + ", " + lastName + " <br>" + email + "?</div>";
                output += "<form method='post' action='aform'  enctype='multipart/form-data'>";
                output += "<input type='hidden' name='action' value='addForm' >";
                output += "<input type='hidden' name='userId' value='" + userId + "'>";
                output += "<input type='radio' name='formType' value='medical'> Medical Form <br>";
                output += "<input type='radio' name='formType' value='consent'> Consent Form <br>";
                output += "<br><input type='file' name='pdfFile' accept='application/pdf'>";
                output += "<br>" + "<div class='popupBtns'><button onclick='cancel()' value='Cancel' class='cancelBtn'>Cancel</button>";
                output += "<input type='submit' class='addFormBtn' value='Add Form'></form></div>";
                //                popupBox.innerHTML = output;
                document.getElementById('popupContent').innerHTML = output;

                // Show the popup box
                popupBox.style.display = 'block';
            })
            .catch(error => {
                // Handle any error that occurs during the request
                console.error('Error:', error);
            });
             popupBox.style.display = 'block';
            
            
}

