window.onload = function () {
    language = getLanguageCookie();
    resetCalendar();
};


var week = 0;
var weekCounter = document.getElementById("weekCounter");
var clickedTimeId;
var clickedDayName;
var clickedMonthName;
var clickedDayNumber;
var clickedstartTime;
var clickedendTime;
var language;

function goLeft() {
    if (week === 0)
        return;
    var daysContent = document.querySelector(".days-content");
    var shiftAmount = document.querySelector(".days-content .availableDay").offsetWidth;
    week--;
    daysContent.style.transform = "translateX(-" + (week * shiftAmount * 7) + "px)";
    weekCounter.value = week;
}

function goRight() {
    if (week === 16)
        return;
    var daysContent = document.querySelector(".days-content");
    var shiftAmount = document.querySelector(".days-content .availableDay").offsetWidth;
    week++;
    daysContent.style.transform = "translateX(-" + (week * shiftAmount * 7) + "px)";
    weekCounter.value = week;
}

// --- Referred bookingpage.js
//
//function confirm() {
//    // Make an AJAX request to check if the user is logged in
//    var xhr = new XMLHttpRequest();
//    xhr.open('GET', '/check-login', true);
//    xhr.onreadystatechange = function () {
//        if (xhr.readyState === 4 && xhr.status === 200) {
//            var isLoggedIn = xhr.responseText;
//
//            if (isLoggedIn === 'true') {
//                var popupBox = document.getElementById('popupBox');
//                popupBox.style.display = "none";
//                showForm();
//            } else {
//                localStorage.setItem('loginMessage', 'Please login to book an appointment');
//                window.location.href = '/en/login';
//
//            }
//        }
//    };
//    xhr.send();
//}
//function showForm() {
//    var confirmBox = document.getElementById('confirmBox');
//    var dynamicHtml = document.getElementById('dynamicHtml').value;
//
//    var output;
//
//    output = "Booking for:  " + clickedDayName + ", " + clickedMonthName + " " + clickedDayNumber + " " + clickedstartTime + " to " + clickedendTime;
//
//    output += "<form method='post' action='/book''>";
//    output += "<h2 class='confirmService'>Select Service Type</h2>";
//
//    output += dynamicHtml;
//    output += "<br>";
//    output += "<input type='hidden' name='timeId' value='" + clickedTimeId + "'>";
//    output += "<label for='description'>Description (optional) </label> <br> ";
//    output += " <textarea rows='10' cols='50'  class='description-box'  type='textfield' name='description' id='description'></textarea>";
//    output += "<div class='popupBtns'><input type='button' onclick='cancel()' value='Cancel' class='cancelBtn'>";
//    output += "<input type='submit' id='bookbutton' value='Book' disabled='true' class='confirmBtn'></div>";
//    output += "<input type='hidden' name='action' value='book' >";
//    output += "</form>";
////    popupBox.innerHTML = output;
//    document.getElementById('confirmContent').innerHTML = output;
//    confirmBox.style.display = 'block';
//}
//
//function enableBook() {
//    var bookbutton = document.getElementById('bookbutton');
//    bookbutton.disabled = false;
//}

//function getTime(timeId) {
//    fetch('/getTime?timeId=' + timeId)
//            .then(response => response.json())
//            .then(data => {
//                var startTime = clickedDayName = data.startTime;
//                var emdTime = clickedMonthName = data.emdTime;
//                var firstName = clickedDayNumber = data.firstName;
//                var lastName = clickedDayNumber = data.lastName;
//                var service = clickedendTime = data.service;
//                var describe = clickedDayNumber = data.describe;
//                clickedTimeId = timeId;
//
//                // Get the reference to your popup box element
//                var popupBox = document.getElementById('popupBox');
//
////                var span = document.getElementsByClassName("book_close")[0];
//
//                // Update the content of the popup box with the retrieved day name and month name
//                var output = "";
//                output = "<div class='popupText'>Start Time: " + startTime + "<br>End Time: " + emdTime + "<br>Name: " + firstName + ", " + lastName + "<br>Service: " + service + "<br> " + describe + "</div>";
//                output += "<br>" + "<div class='popupBtns'><button onclick='cancel()' value='Cancel' class='cancelBtn'>Cancel</button>" +
//                        "<button onclick='confirm()' value='confirm' class='confirmBtn'>Confirm</button></div>";
//
////                popupBox.innerHTML = output;
//                document.getElementById('popupContent').innerHTML = output;
//
//                // Show the popup box
//                popupBox.style.display = 'block';
//            })
//            .catch(error => {
//                // Handle any error that occurs during the request
//                console.error('Error:', error);
//            });
//}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
    var popupBox = document.getElementById('popupBox');
    var confirmBox = document.getElementById('confirmBox');
    if (event.target == popupBox) {
        popupBox.style.display = "none";
    }
    if (event.target == confirmBox) {
        confirmBox.style.display = "none";
    }

}

function changeStatus(time) {
    if (button.innerHTML === "Available") {
        fetch("/aavailability?timeId" + time, {
            method: 'POST'}).catch(error => console.log(error))
    }
}


// ---Referred aform.js
function formPopUp(timeId) {
    fetch('/getApptInfo?timeId=' + timeId)
            .then(response => response.json())
            .then(data => {
                var startTime = clickedDayName = data.startTime;
                var emdTime = clickedMonthName = data.emdTime;
                var firstName = clickedDayNumber = data.firstName;
                var lastName = clickedDayNumber = data.lastName;
                var service = clickedendTime = data.service;
                var describe = clickedDayNumber = data.describe;
                // Get the reference to your popup box element
                var popupBox = document.getElementById('popupBox');

                var output = "";
                output += "<div class='popupText'> Start Time: " + startTime + "<br>" + "End Time: " + emdTime + "<br>" + "Name: " + firstName + ", " + lastName + "<br>" + "Service: " + service + "<br>" + describe + "</div>";
                output += "<br>" + "<div class='popupBtns'><button onclick='cancel()' value='Cancel' class='cancelBtn'>Cancel</button>";
                document.getElementById('popupContent').innerHTML = output;

                // Show the popup box
                popupBox.style.display = 'block';
            })
            .catch(error => {
                // Handle any error that occurs during the request
                console.error('Error:', error);
            });
}

function cancel() {
    var popupBox = document.getElementById('popupBox');
    popupBox.style.display = 'none';
    document.getElementById('popupContent').innerHTML = "";
}
