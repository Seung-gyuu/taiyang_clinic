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
var canceledAppointmentsData = [];
var completedAppointmentsData = [];

// Assuming appointmentsArrayList, canceledAppointmentsArrayList, and completedAppointmentsArrayList
// contain the corresponding appointment objects
<%
    Vector<Appointment> appointmentsArrayList = (Vector<Appointment>) request.getAttribute("appts");
    Vector<Appointment> canceledAppointmentsArrayList = (Vector<Appointment>) request.getAttribute("canceledAppts");
    Vector<Appointment> completedAppointmentsArrayList = (Vector<Appointment>) request.getAttribute("completedAppts");
    // Convert appointments data to JSON format
    StringBuilder appointmentsJson = new StringBuilder();
    StringBuilder canceledAppointmentsJson = new StringBuilder();
    StringBuilder completedAppointmentsJson = new StringBuilder();
    int totalAppointmentsCount = 0;
    List<Integer> labels = new ArrayList<>();

    for (int i = 0; i < appointmentsArrayList.size(); i++) {
        Appointment appointment = appointmentsArrayList.get(i);
        String appointmentDate = appointment.getTimeid().getFulldate().getTruncatedDate();
        int dayOfMonth = appointment.getTimeid().getFulldate().getDaynumber();

        // Build JSON object for total appointments
        appointmentsJson.append("{");
        appointmentsJson.append("\"date\":\"").append(appointmentDate).append("\",");
        appointmentsJson.append("\"dayOfMonth\":").append(dayOfMonth).append(",");
        totalAppointmentsCount++;
        appointmentsJson.append("\"count\":").append(totalAppointmentsCount);
        appointmentsJson.append("}");

        // Add comma separator for all but the last appointment
        if (i < appointmentsArrayList.size() - 1) {
            appointmentsJson.append(",");
        }

        // Check if the appointment is canceled
        if (canceledAppointmentsArrayList.contains(appointment)) {
            // Build JSON object for canceled appointments
            canceledAppointmentsJson.append("{");
            canceledAppointmentsJson.append("\"date\":\"").append(appointmentDate).append("\",");
            canceledAppointmentsJson.append("\"dayOfMonth\":").append(dayOfMonth).append(",");
            canceledAppointmentsJson.append("\"count\":1");
            canceledAppointmentsJson.append("}");

            // Add comma separator for all but the last canceled appointment
            if (canceledAppointmentsArrayList.indexOf(appointment) < canceledAppointmentsArrayList.size() - 1) {
                canceledAppointmentsJson.append(",");
            }
        }

        // Check if the appointment is completed
        if (completedAppointmentsArrayList.contains(appointment)) {
            // Build JSON object for completed appointments
            completedAppointmentsJson.append("{");
            completedAppointmentsJson.append("\"date\":\"").append(appointmentDate).append("\",");
            completedAppointmentsJson.append("\"dayOfMonth\":").append(dayOfMonth).append(",");
            completedAppointmentsJson.append("\"count\":1");
            completedAppointmentsJson.append("}");

            // Add comma separator for all but the last completed appointment
            if (completedAppointmentsArrayList.indexOf(appointment) < completedAppointmentsArrayList.size() - 1) {
                completedAppointmentsJson.append(",");
            }
        }

        // Add dayOfMonth to labels array
        if (!labels.contains(dayOfMonth)) {
            labels.add(dayOfMonth);
        }
    }
%>

            // Parse the JSON appointments data
            var appointments = JSON.parse('[<%= appointmentsJson.toString()%>]');
            var canceledAppointments = JSON.parse('[<%= canceledAppointmentsJson.toString()%>]');
            var completedAppointments = JSON.parse('[<%= completedAppointmentsJson.toString()%>]');

            // Process the appointments data
            appointments.forEach(function (appointment) {
                var dayOfMonth = appointment.dayOfMonth;
                var count = appointment.count;

                var index = labels.indexOf(dayOfMonth);
                if (index === -1) {
                    labels.push(dayOfMonth);
                    appointmentsData.push(count);
                } else {
                    appointmentsData[index] += count;
                }
            });

            // Process the canceled appointments data
            canceledAppointments.forEach(function (appointment) {
                var dayOfMonth = appointment.dayOfMonth;
                var count = appointment.count;

                var index = labels.indexOf(dayOfMonth);
                if (index === -1) {
                    labels.push(dayOfMonth);
                    canceledAppointmentsData.push(count);
                } else {
                    canceledAppointmentsData[index] = count;
                }
            });

            // Process the completed appointments data
            completedAppointments.forEach(function (appointment) {
                var dayOfMonth = appointment.dayOfMonth;
                var count = appointment.count;

                var index = labels.indexOf(dayOfMonth);
                if (index === -1) {
                    labels.push(dayOfMonth);
                    completedAppointmentsData.push(count);
                } else {
                    completedAppointmentsData[index] = count;
                }
            });

            // Sort the labels in ascending order
            labels.sort(function (a, b) {
                return a - b;
            });

            // Fill in missing days with zero count
            var daysInMonth = labels[labels.length - 1]; // Last day in the labels array
            for (var i = 1; i <= daysInMonth; i++) {
                if (!labels.includes(i)) {
                    labels.push(i);
                    appointmentsData.push(0);
                    canceledAppointmentsData.push(0);
                    completedAppointmentsData.push(0);
                }
            }

            // Create the line chart using Chart.js
            var ctx = document.getElementById('lineChart').getContext('2d');
            var lineChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [
                        {
                            label: 'Total Appointments',
                            data: appointmentsData,
                            fill: false,
                            borderColor: 'rgb(75, 192, 192)',
                            tension: 0.1
                        },
                        {
                            label: 'Canceled Appointments',
                            data: canceledAppointmentsData,
                            fill: false,
                            borderColor: 'rgb(255, 99, 132)',
                            tension: 0.1
                        },
                        {
                            label: 'Completed Appointments',
                            data: completedAppointmentsData,
                            fill: false,
                            borderColor: 'rgb(54, 162, 235)',
                            tension: 0.1
                        }
                    ]
                },
                options: {
                    // Add any additional options for styling and customization
                }
            });
        </script>
    </body>
</html>
