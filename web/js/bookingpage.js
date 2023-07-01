var week = 0;
var weekCounter = document.getElementById("weekCounter");
window.onload = resetCalendar;

var clickedTimeId;
var clickedDayName;
var clickedMonthName;
var clickedDayNumber;
var clickedstartTime;
var clickedendTime;



function resetCalendar() {
    var daysContent = document.querySelector(".days-content");
    var shiftAmount = document.querySelector(".days-content .availableDay").offsetWidth;
    week = weekCounter.value;
    daysContent.style.transform = "translateX(-" + (week * shiftAmount * 7) + "px)";
    var message = document.getElementById("hiddenmessage").value;
    if (message === "Appointment Created!" || message === "Cannot have more than 3 upcoming appointments at once!") {
        alert(message);
    }
    //this function will take the weekcounter that is reset by the form and should 
    //put them back to where they were whenever they click a button for booking
}


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


function cancel() {
    var popupBox = document.getElementById('popupBox');
    var confirmBox = document.getElementById('confirmBox');
    popupBox.style.display = 'none';
    confirmBox.style.display = 'none';
}

function confirm() {
    // Make an AJAX request to check if the user is logged in
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/check-login', true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var isLoggedIn = xhr.responseText;

            if (isLoggedIn === 'true') {
                // User is logged in, display the form
                var popupBox = document.getElementById('popupBox');
                popupBox.style.display = "none";
                showForm();
            } else {
                // User is not logged in, redirect to the login page
                localStorage.setItem('loginMessage', 'Please login to book an appointment');
                window.location.href = '/login';
            }
        }
    };
    xhr.send();
}
function showForm() {
    var confirmBox = document.getElementById('confirmBox');
    var dynamicHtml = document.getElementById('dynamicHtml').value;

    // Update the content of the popup box with the retrieved day name and month name
    var output = "Booking for:  " + clickedDayName + ", " + clickedMonthName + " " + clickedDayNumber + " " + clickedstartTime + " to " + clickedendTime;
//    output += "<br>" + clickedstartTime + " to " + clickedendTime;
//    output += "<br>";
    output += "<form method='post' action='/book''>";
    output += "<h2 class='confirmService'>Select Service Type</h2>";
//    output += "<c:forEach items='${services}' var='s'>";
//    output += "<input type='radio' name='serviceType' value='${s.getServiceid()}'>${s.getServiceName()";
//    output += "</c:forEach>";
    output += dynamicHtml;
    output += "<br>";
    output += "<input type='hidden' name='timeId' value='" + clickedTimeId + "'>";
    output += "<label for='description'>Description (optional) </label> <br> ";
    output += " <textarea rows='10' cols='50'  class='description-box'  type='textfield' name='description' id='description'></textarea>";
    output += "<div class='popupBtns'><input type='button' onclick='cancel()' value='Cancel' class='cancelBtn'>";
    output += "<input type='submit' id='bookbutton' value='Book' disabled='true' class='confirmBtn'></div>";
    output += "<input type='hidden' name='action' value='book' >";
    output += "</form>";
//    popupBox.innerHTML = output;
    document.getElementById('confirmContent').innerHTML = output;
    confirmBox.style.display = 'block';
}

function enableBook() {
    var bookbutton = document.getElementById('bookbutton');
    bookbutton.disabled = false;
}


function getTime(timeId) {
    fetch('/getTime?timeId=' + timeId)
            .then(response => response.json())
            .then(data => {
                var dayName = clickedDayName = data.dayName;
                var monthName = clickedMonthName = data.monthName;
                var dayNumber = clickedDayNumber = data.dayNumber;
                var startTime = clickedstartTime = data.startTime;
                var endTime = clickedendTime = data.endTime;
                clickedTimeId = timeId;

                // Get the reference to your popup box element
                var popupBox = document.getElementById('popupBox');

//                var span = document.getElementsByClassName("book_close")[0];

                // Update the content of the popup box with the retrieved day name and month name
                var output = "<div class='popupText'>Do you want to book for " + dayName + ", " + monthName + " " + dayNumber + " from " + startTime + " to " + endTime + "?</div>";
                output += "<br>" + "<div class='popupBtns'><button onclick='cancel()' value='Cancel' class='cancelBtn'>Cancel</button>" +
                        "<button onclick='confirm()' value='confirm' class='confirmBtn'>Confirm</button></div>";
//                popupBox.innerHTML = output;
                document.getElementById('popupContent').innerHTML = output;

                // Show the popup box
                popupBox.style.display = 'block';
            })
            .catch(error => {
                // Handle any error that occurs during the request
                console.error('Error:', error);
            });
}

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