var week = 0;

function goLeft() {
    if (week === 0)
        return;
    var daysContent = document.querySelector(".days-content");
    var shiftAmount = document.querySelector(".days-content .availableDay").offsetWidth;
    week--;
    daysContent.style.transform = "translateX(-" + (week * shiftAmount*7) + "px)";
}

function goRight() {
    if (week === 16)
        return;
    var daysContent = document.querySelector(".days-content");
    var shiftAmount = document.querySelector(".days-content .availableDay").offsetWidth;
    week++;
    daysContent.style.transform = "translateX(-" + (week * shiftAmount*7) + "px)";
}
