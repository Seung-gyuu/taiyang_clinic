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


function getLanguageCookie() {
    var name = "language=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var cookieArray = decodedCookie.split(';');

    for (var i = 0; i < cookieArray.length; i++) {
        var cookie = cookieArray[i].trim();
        if (cookie.indexOf(name) === 0) {
            return cookie.substring(name.length);
        }
    }

    return null;
}




function resetCalendar() {
    var daysContent = document.querySelector(".days-content");
    var shiftAmount = document.querySelector(".days-content .availableDay").offsetWidth;
    week = weekCounter.value;
    daysContent.style.transform = "translateX(-" + (week * shiftAmount * 7) + "px)";
    var message = document.getElementById("hiddenmessage").value;
                            if (message !== "")
                            alert(message);

}


function goLeft() {
    if (week === 0)
        return;
//    var daysContent = document.querySelector(".days-content");
    var daysContent = document.querySelector(".days-content");
//    var shiftAmount = document.querySelector(".days-content .availableDay").offsetWidth;
var shiftAmount = document.querySelector(".days-content").offsetWidth;
    week--;
    console.log("week",week);
    console.log("shiftAmount",shiftAmount);
//    daysContent.style.transform = "translateX(-" + (week * shiftAmount * 7) + "px)";
 daysContent.style.transform = "translateX(-" + (week * shiftAmount ) + "px)";
    weekCounter.value = week;
}

function goRight() {
    if (week === 16)
        return;
    var daysContent = document.querySelector(".days-content");
//    var shiftAmount = document.querySelector(".days-content .availableDay").offsetWidth;
var shiftAmount = document.querySelector(".days-content").offsetWidth;
    week++;
//    daysContent.style.transform = "translateX(-" + (week * shiftAmount * 7) + "px)";
 daysContent.style.transform = "translateX(-" + (week * shiftAmount) + "px)";
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
                if (language === "en") {
                    localStorage.setItem('loginMessage', 'Please login to book an appointment');
                    window.location.href = '/en/login';
                }
                if (language === "kr") {
                    localStorage.setItem('loginMessage', '예약하려면 로그인하십시오');
                    window.location.href = '/kr/login';
                }

            }
        }
    };
    xhr.send();
}
function showForm() {
    var confirmBox = document.getElementById('confirmBox');
    var dynamicHtml = document.getElementById('dynamicHtml').value;

    // Update the content of the popup box with the retrieved day name and month name
    var output;

    if (language === "en") {
        output = "Booking for:  " + clickedDayName + ", " + clickedMonthName + " " + clickedDayNumber + " " + clickedstartTime + " to " + clickedendTime;
    }
    if (language === "kr") {
        output = "예약 시간:  " + clickedDayName + ", " + clickedMonthName + " " + clickedDayNumber + " " + clickedstartTime + " 에서 " + clickedendTime + " 까지 ";
    }

    
//    output += "<br>" + clickedstartTime + " to " + clickedendTime;
//    output += "<br>";
    output += "<form method='post' action='/book''>";
    if (language === "en") {
        output += "<h2 class='confirmService'>Select Service Type</h2>";
    }
    if (language === "kr") {
        output += "<h2 class='confirmService'>서비스 유형 선택</h2>";
    }
    
//    output += "<c:forEach items='${services}' var='s'>";
//    output += "<input type='radio' name='serviceType' value='${s.getServiceid()}'>${s.getServiceName()";
//    output += "</c:forEach>";
    output += dynamicHtml;
    output += "<br>";
    output += "<input type='hidden' name='timeId' value='" + clickedTimeId + "'>";
    if (language === "en") {
        output += "<label for='description'>Description (optional) </label> <br> ";
    }
    if (language === "kr") {
        output += "<label for='description'>설명 (선택 사항)</label> <br> ";
    }
    
    
    
    output += " <textarea rows='10' cols='50'  class='description-box'  type='textfield' name='description' id='description'></textarea>";
    
    
    if (language === "en") {
        output += "<div class='popupBtns'><input type='button' onclick='cancel()' value='Cancel' class='cancelBtn'>";
    output += "<input type='submit' id='bookbutton' value='Book' disabled='true' class='confirmBtn'></div>";
    }
    if (language === "kr") {
        output += "<div class='popupBtns'><input type='button' onclick='cancel()' value='취소' class='cancelBtn'>";
    output += "<input type='submit' id='bookbutton' value='예약' disabled='true' class='confirmBtn'></div>";
    }
    
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
                var output = "";
                if (language === "en") {
                    output = "<div class='popupText'>Do you want to book for " + dayName + ", " + monthName + " " + dayNumber + " from " + startTime + " to " + endTime + "?</div>";
                    output += "<br>" + "<div class='popupBtns'><button onclick='cancel()' value='Cancel' class='cancelBtn'>Cancel</button>" +
                            "<button onclick='confirm()' value='confirm' class='confirmBtn'>Confirm</button></div>";
                }
                if (language === "kr") {
                    output = "<div class='popupText'> " + dayName + ", " + monthName + " " + dayNumber + " "+ startTime + " 부터 " + endTime + " 까지로 예약하시겠습니까" + "?</div>";
                    output += "<br>" + "<div class='popupBtns'><button onclick='cancel()' value='Cancel' class='cancelBtn'>취소</button>" +
                            "<button onclick='confirm()' value='confirm' class='confirmBtn'>확인</button></div>";
                }

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