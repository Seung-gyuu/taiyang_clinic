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
        <title>JSP Page</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body>
        <h1>Hello World!</h1>


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
            <c:forEach items="${serviceCounts}" var="entry">
                <thead>
                <th>Service Name</th>
                <th>Service Count</th>
                </thead>
            <tr>
                <td>${entry.key}</td>
                <td>${entry.value}</td>
            </tr>
        </c:forEach>
        </table>
        
        
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
                    scales: {
                        y: {
                            suggestedMax: 20, // Set the desired maximum value for the y-axis
                        }
                    }
                }
            });
        </script>
    </body>
</html>
