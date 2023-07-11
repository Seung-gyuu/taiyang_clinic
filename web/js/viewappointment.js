/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function getAppointmentDetails(timeID) {
    fetch('/getApptDetails?timeId=' + timeID) //make the new server endpoint, get appointment details.  Add popup with details and href to view forms for that userID
            .then(response => response.json())
            .then(data => {
                var firstName  = data.firstName;
                var lastName  = data.lastName;
                var serviceName  = data.serviceName;
                var apptDesc  = data.apptDesc;
                var userId  = data.userId;
                
                 var output = "";
               
                    output = "<div class='popupText'>Appointment Details";
                    output += "<br> Name: " + firstName + " " + lastName;
                    output += "<br> Service Name: " + serviceName;
                    output += "<br> Desc: " + apptDesc;
                    output+="<a href=/vform?userId="+userId + ">View forms </a>";
                    output+="<button onClick='closePopup()'>Close</button>";
                    output+="</div>";
                
                document.getElementById('popupContent').innerHTML = output;

                // Show the popup box
                var popupBox = document.getElementById('popupBox');
                popupBox.style.display = 'block';
                
                
            })
            .catch(error => {
                // Handle any error that occurs during the request
                console.error('Error:', error);
            });
}

function closePopup(){
    var popupBox = document.getElementById('popupBox');
                popupBox.style.display = 'none';
}


window.onclick = function (event) {
    var popupBox = document.getElementById('popupBox');
    var confirmBox = document.getElementById('confirmBox');
    if (event.target === popupBox) {
        popupBox.style.display = "none";
    }
    if (event.target === confirmBox) {
        confirmBox.style.display = "none";
    }

}