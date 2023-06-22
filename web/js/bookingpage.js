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



function getTime(timeId){
     fetch('/getTime?timeId=' + timeId)
    .then(response => response.json())
    .then(data => {
      var dayName = data.dayName;
      var monthName = data.monthName;
      var dayNumber = data.dayNumber;
      var startTime = data.startTime;
      var endTime = data.endTime;
      // Get the reference to your popup box element
      var popupBox = document.getElementById('popupBox');

      // Update the content of the popup box with the retrieved day name and month name
      var output="Do you want to book for " + dayName + ", " + monthName +" "+  dayNumber + " from " + startTime + " to " + endTime + "?";
      output+="<br>" + '<button onclick="cancel()" value="Cancel">Cancel</button>' + 
              '<button onclick="confirm()" value="confirm">Confirm</button>';
      popupBox.innerHTML = output;

      // Show the popup box
      popupBox.style.display = 'block';
    })
    .catch(error => {
      // Handle any error that occurs during the request
      console.error('Error:', error);
    });
}