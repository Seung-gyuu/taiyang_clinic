<%-- 
    Document   : admingraph
    Created on : Jul 14, 2023, 12:36:35 AM
    Author     : Hussein
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Appointment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    </head>
    <body>
        <h1>Currently Showing For ${month}, ${year}</h1>


        <%
            int startYear = 2023;
            int startMonth = 5;

            // Get the current date
            Calendar currentDate = Calendar.getInstance();
            int currentYear = currentDate.get(Calendar.YEAR);
            int currentMonth = currentDate.get(Calendar.MONTH) + 1; // January is represented by 0

            // Month name mapping
            String[] monthNames = {
                "January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"
            };

            for (int year = startYear; year <= currentYear; year++) {
                int endMonth = (year == currentYear) ? currentMonth : 12; // Set the end month based on the current year
                for (int month = startMonth; month < endMonth; month++) {
                    String link = "/analytics?year=" + year + "&month=" + month;
                    String monthName = monthNames[month - 1]; // Get the month name from the array
        %>
        <a href="<%= link%>"><%= monthName%> <%= year%></a>
        <%
                }
                startMonth = 1; // Reset start month for subsequent years
            }
        %>  


        <canvas id="lineChart"></canvas>


        <table>
            <tr><td>In ${month} ${year} You Had: </td> <td>${TotalMade} Appointments</td></tr>
            <tr><td> You Had: </td> <td>${TotalGoneThrough} Complete Appointments</td></tr>
            <tr><td> You Had: </td> <td>${TotalCanceled} Canceled Appointments</td></tr>
            <tr><td> You Had: </td> <td> ~ ${AvgDaily} Appointments Created Per Day</td></tr>
        </table>

        <table>

            <thead>
            <th>Service Name</th>
            <th>Service Count</th>
        </thead>
        <c:forEach items="${serviceCounts}" var="entry">
            <tr>
                <td>${entry.key}</td>
                <td>${entry.value}</td>
            </tr>
        </c:forEach>
    </table>

    <table>

        <thead>
        <th>Start Time</th>
        <th>Count</th>
    </thead>
    <c:forEach items="${sortedTimeCounts}" var="entry">
        <tr>
            <td>${entry.key}</td>
            <td>${entry.value}</td>
        </tr>
    </c:forEach>
</table>
<div id="popup">

</div>

<script>
    // Parse xValuesJson and yValuesJson into arrays
    var xValuesTotal = JSON.parse('${xValuesTotalJson}');
    var yValuesTotal = JSON.parse('${yValuesTotalJson}');
    //var xValuesCanceled = JSON.parse('${xValuesCanceledJson}');
    var yValuesCanceled = JSON.parse('${yValuesCanceledJson}');
    //var xValuesComplete = JSON.parse('${xValuesCompleteJson}');
    var yValuesComplete = JSON.parse('${yValuesCompleteJson}');

    var yValuesApptMadeDaily = JSON.parse('${yValuesApptMadeDailyJson}');
    // Create the line chart using Chart.js
    var ctx = document.getElementById('lineChart').getContext('2d');
    var lineChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: xValuesTotal,
            datasets: [
                {
                    label: 'Total Appointments',
                    data: yValuesTotal,
                    fill: false,
                    borderColor: 'blue',
                    tension: 0.1
                },
                {
                    label: 'Canceled Appointments',
                    data: yValuesCanceled,
                    fill: false,
                    borderColor: 'red',
                    tension: 0.1
                },
                {
                    label: 'Complete Appointments',
                    data: yValuesComplete,
                    fill: false,
                    borderColor: 'green',
                    tension: 0.1
                },
                {
                    label: 'Daily Appointments',
                    data: yValuesApptMadeDaily,
                    fill: false,
                    borderColor: 'black',
                    tension: 0.1
                }
            ]
        },
        options: {
            onHover:(event,chartElement)=>{
                event.native.target.style.cursor=chartElement[0]? 'pointer': 'default';
            },
            scales: {
                y: {
                    suggestedMax: 20 // Set the desired maximum value for the y-axis
                }
            }
        }
    });

    var canvas = document.getElementById('lineChart');
    canvas.addEventListener('click', handleDailyAppointmentsClick);

// Update the handleDailyAppointmentsClick function to retrieve the clicked index
    function handleDailyAppointmentsClick(event) {

        var activePoints = lineChart.getElementsAtEventForMode(event, 'index', {intersect: true}, false);
        if (activePoints.length > 0) {

            var clickedIndex = activePoints[0].index;
            var clickedDay = xValuesTotal[clickedIndex];

            // Fetch appointment data and display the popup
            fetch('/getAppoinmentList?monthNumber=' + ${monthNumber} + '&year=' +${year} + '&dayNumber=' + clickedDay)
                    .then(response => response.json())
                    .then(data => {
                        showAppointmentPopup(clickedDay, data);
                    })
                    .catch(error => {
                        console.error('Error:', error);
                    });
        }

    }


    function showAppointmentPopup(clickedDay, appointmentList) {
        // Create a popup element
        var popup = document.getElementById("popup");
        popup.textContent = "";
        popup.classList.add('popup');

        // Create a close button
        var closeButton = document.createElement('button');
        closeButton.classList.add('close-button');
        closeButton.textContent = 'Close';
        closeButton.addEventListener('click', function () {
            popup.textContent=""; // Remove the popup when the close button is clicked
        });

        // Create a heading to display the day and month
        var heading = document.createElement('h2');
        heading.textContent = 'Showing appointments made for ' + clickedDay;

        // Create a table to display the appointment data
        var table = document.createElement('table');

        // Create table headers
        var tableHeaders = document.createElement('tr');
        var header1 = document.createElement('th');
        header1.textContent = 'Count';
        var header2 = document.createElement('th');
        header2.textContent = 'Appointment ID';
        var header3 = document.createElement('th');
        header3.textContent = 'Status';
        var header4 = document.createElement('th');
        header3.textContent = 'First Name';
        var header5 = document.createElement('th');
        header4.textContent = 'Last Name';
        var header6 = document.createElement('th');
        header5.textContent = 'Service Name';
        var header7 = document.createElement('th');
        header6.textContent = 'Description';

        tableHeaders.appendChild(header1);
        tableHeaders.appendChild(header2);
        tableHeaders.appendChild(header3);
        tableHeaders.appendChild(header4);
        tableHeaders.appendChild(header5);
        tableHeaders.appendChild(header6);
        tableHeaders.appendChild(header7);
        table.appendChild(tableHeaders);

        // Iterate over the appointment list and create table rows
        var i = 1;
        appointmentList.forEach(appointment => {
            var row = document.createElement('tr');

            // Create table cells for appointment data
            var cell1 = document.createElement('td');
            cell1.textContent = i;
            var cell2 = document.createElement('td');
            cell2.textContent = appointment.appointmentID;
            var cell3 = document.createElement('td');
            cell2.textContent = appointment.Status;
            var cell4 = document.createElement('td');
            cell3.textContent = appointment.FirstName;
            var cell5 = document.createElement('td');
            cell4.textContent = appointment.LastName;
            var cell6 = document.createElement('td');
            cell5.textContent = appointment.ServiceName;
            var cell7 = document.createElement('td');
            cell6.textContent = appointment.Description;

            row.appendChild(cell1);
            row.appendChild(cell2);
            row.appendChild(cell3);
            row.appendChild(cell4);
            row.appendChild(cell5);
            row.appendChild(cell6);
            row.appendChild(cell7);
            table.appendChild(row);
            i++;
        });

        // Add the elements to the popup

        popup.appendChild(heading);
        popup.appendChild(table);
        popup.appendChild(closeButton);
        // Add the popup to the document body
        document.body.appendChild(popup);
    }
</script>
</body>
</html>
