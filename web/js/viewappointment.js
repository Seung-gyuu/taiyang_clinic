/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function getAppointmentDetails(timeID) {
    fetch('/getApptDetails?timeId=' + timeID)
            .then(response => response.json())
            .then(data => {
                var dayName  = data.dayName;
                var monthName  = data.monthName;
                var dayNumber  = data.dayNumber;
                var startTime  = data.startTime;
                var endTime  = data.endTime;
            })
            .catch(error => {
                // Handle any error that occurs during the request
                console.error('Error:', error);
            });
}
