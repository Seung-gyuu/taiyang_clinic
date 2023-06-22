var week = 0;
var weekCounter = document.getElementById("weekCounter");
window.onload=resetCalendar;


function resetCalendar(){
    var daysContent = document.querySelector(".days-content");
    var shiftAmount = document.querySelector(".days-content .availableDay").offsetWidth;
    week=weekCounter.value;
    daysContent.style.transform = "translateX(-" + (week * shiftAmount*7) + "px)";
    //this function will take the weekcounter that is reset by the form and should 
    //put them back to where they were whenever they click a button for booking
}


function goLeft() {
    if (week === 0)
        return;
    var daysContent = document.querySelector(".days-content");
    var shiftAmount = document.querySelector(".days-content .availableDay").offsetWidth;
    week--;
    daysContent.style.transform = "translateX(-" + (week * shiftAmount*7) + "px)";
    weekCounter.value=week;
}

function goRight() {
    if (week === 16)
        return;
    var daysContent = document.querySelector(".days-content");
    var shiftAmount = document.querySelector(".days-content .availableDay").offsetWidth;
    week++;
    daysContent.style.transform = "translateX(-" + (week * shiftAmount*7) + "px)";
    weekCounter.value=week;
}
