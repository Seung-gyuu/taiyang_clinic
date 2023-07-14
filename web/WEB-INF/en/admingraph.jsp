<%-- 
    Document   : admingraph
    Created on : Jul 14, 2023, 12:36:35 AM
    Author     : Hussein
--%>

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
        <table>
            <c:forEach items="${appts}" var="appt">
                <tr><td>${appt.getTimeid().getFulldate().getTruncatedDate()}</td><td>${appt.getAppointmentid()}</td><td>${appt.getStatus()}</td><td>${appt.getUserid().getFirstname()}</td></tr>
            </c:forEach>
                
         
        </table>
        <h1>Canvas : </h1>
                <canvas id="lineChart"></canvas>
 <script>
        var appointmentsData = [];
        var labels = [];

        // Assuming appointmentsVector contains the appointment objects
        <%
        Vector<Appointment> appointmentsVector = (Vector<Appointment>) request.getAttribute("appts");
        System.out.print(appointmentsVector);
        // Convert appointments data to JSON format
        StringBuilder appointmentsJson = new StringBuilder();
        for (int i = 0; i < appointmentsVector.size(); i++) {
            Appointment appointment = appointmentsVector.get(i);
            String appointmentDate = appointment.getTimeid().getFulldate().getTruncatedDate();
            int dayOfMonth = appointment.getTimeid().getFulldate().getDaynumber();

            // Build JSON object for each appointment
            appointmentsJson.append("{");
            appointmentsJson.append("\"date\":\"").append(appointmentDate).append("\",");
            appointmentsJson.append("\"dayOfMonth\":").append(dayOfMonth).append(",");
            appointmentsJson.append("\"count\":1"); // Assuming each appointment has a count of 1
            appointmentsJson.append("}");

            // Add comma separator for all but the last appointment
            if (i < appointmentsVector.size() - 1) {
                appointmentsJson.append(",");
            }
        }
        %>

        // Parse the JSON appointments data
        var appointments = JSON.parse('[<%= appointmentsJson.toString() %>]');

        // Process the appointments data
        appointments.forEach(function(appointment) {
            var dayOfMonth = appointment.dayOfMonth;

            var index = labels.indexOf(dayOfMonth);
            if (index === -1) {
                labels.push(dayOfMonth);
                appointmentsData.push(1);
            } else {
                appointmentsData[index] += 1;
            }
        });

        // Determine the number of days in the month
        var daysInMonth = 31; // Modify this value based on the actual number of days in the month

        // Fill in missing days with zero count
        for (var i = 1; i <= daysInMonth; i++) {
            if (!labels.includes(i)) {
                labels.push(i);
                appointmentsData.push(0);
            }
        }

        // Sort the labels and data arrays in ascending order
        var sortedAppointmentsData = [];
        for (var i = 1; i <= daysInMonth; i++) {
            var index = labels.indexOf(i);
            sortedAppointmentsData.push(appointmentsData[index]);
        }
        labels.sort(function(a, b) { return a - b; });
        appointmentsData = sortedAppointmentsData;

        // Create the line chart using Chart.js
        var ctx = document.getElementById('lineChart').getContext('2d');
        var lineChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Appointments',
                    data: appointmentsData,
                    fill: false,
                    borderColor: 'rgb(75, 192, 192)',
                    tension: 0.1
                }]
            },
            options: {
                // Add any additional options for styling and customization
            }
        });
    </script>
    </body>
</html>
