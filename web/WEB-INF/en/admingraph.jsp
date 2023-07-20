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

        <link rel="apple-touch-icon" sizes="57x57" href="../src/img/favicon/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="../src/img/favicon/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="../src/img/favicon/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../src/img/favicon/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="../src/img/favicon/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../src/img/favicon/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="../src/img/favicon/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../src/img/favicon/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="../src/img/favicon/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192"  href="../src/img/favicon/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="../src/img/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="../src/img/favicon/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="../src/img/favicon/favicon-16x16.png">
        <link rel="manifest" href="../src/img/favicon/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/admin.css">

        <!--google fonts -->

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

        <!--google material icon-->
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons"rel="stylesheet">

        <style>

            #modalOverlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black background */
                display: none;
                z-index: 9999; /* Make sure it's above other elements */
            }


            .popup {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width:55%; 
                max-height: 60%; 
                background-color: white;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                overflow-y: auto;
                z-index: 9999;
            }


            .close-button {
                float: right;
                margin-top: 20px;
                background-color: #0B486B;
                color: #fff;
                border: none;
                padding: 5px 8px;
                border-radius: 4px;
                cursor: pointer;
                font-weight: light;
                transition: background-color 0.3s ease;
                font-size: 13px;
            }

            h2 {
                font-size: 20px; 
                font-weight: 900;

            }


            .popup table {
                width: 800px;
                border-collapse: collapse;
                margin-top: 20px;
            }


            .popup tr {
                border-bottom: 1px solid #f1f1f1;
            }

            .popup th, .popup td {
                padding: 4px; 
                font-size: 12px;
            }


            .popup th {
                background-color: #f2f2f2;
                font-weight: bold;
            }


            .popup tr:nth-child(odd) {
                background-color: #f9f9f9;
            }


            .popup::-webkit-scrollbar {
                width: 6px;
            }

            .popup::-webkit-scrollbar-thumb {
                background-color: rgba(0, 0, 0, 0.2);
                border-radius: 3px;
            }

            .popup::-webkit-scrollbar-track {
                background-color: rgba(0, 0, 0, 0.1);
                border-radius: 3px;
            }


            .container {
                display: flex;
            }

            .month-link {
                display: inline-block;
                margin-bottom: 10px;
                color: #337ab7;
                text-decoration: none;
                font-weight: bold;
                font-size: 15px;
            }


            .analytics-table {
                margin-bottom: 20px;
                border-collapse: collapse;
                width: 100%;
            }

            .analytics-table td {
                padding: 10px;
                border: 1px solid #e2e2e2;
                font-size: 12px;
                color: #212529;
            }

            .analytics-table tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            .analytics-table th {
                padding: 10px;
                border: 1px solid #e2e2e2;
                background-color: #f2f2f2;
                font-weight: bold;
                text-align: left;
                color: #212529;
            }

            .service-table-container {
                flex: 1;
            }

            .service-table {
                margin-top: 20px;
                margin-bottom: 20px;
                border-collapse: collapse;
                width: 100%;
                font-size: 12px;
                margin-right:20px;
                flex:1;

            }

            .service-table td {
                padding: 10px;
                border: 1px solid #e2e2e2;
                color: #212529;
            }

            .service-table tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            .service-table th {
                padding: 10px;
                border: 1px solid #e2e2e2;
                background-color: #f2f2f2;
                font-weight: bold;
                text-align: left;
                font-size: 13px;
                color: #212529;
            }

            .time-table {
                margin-top: 20px;
                margin-bottom: 20px;
                border-collapse: collapse;
                width: 100%;
                font-size: 12px;
                color: #212529;
                flex: 1;
            }

            .time-table td {
                padding: 10px;
                border: 1px solid #e2e2e2;
                color: #212529;
            }

            .time-table tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            .time-table th {
                padding: 10px;
                border: 1px solid #e2e2e2;
                background-color: #f2f2f2;
                font-weight: bold;
                text-align: left;
                font-size: 13px;
                color: #212529;
            }


            body,html{
                line-height:1.8;
                font-family:'Poppins',sans-serif;
                color:#555e58;
                text-transform:capitalize;
                font-weight:400;
                margin:0px;
                padding:0px;
            }


            /*==========================================================
              material-icon font-style
              ================================*/


            h1,h2,h3,h4,h5,h6,.h1 {
                font-weight:400;

            }


            /*-------footer design end------*/
            #sidebar.show-nav, .body-overlay.show-nav{
                transform:translatex(0%);
                opacity:1;
                display:block;
                visibility:visible;
                z-index:15;
            }






        </style>

    </head>
    <body> 

        <div class="wrapper">

            <div class="body-overlay"></div>

            <!-- Sidebar  -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3><img src="src/img/ClinicLogo.png" class="img-fluid"/><span>Tai Yang Clinic</span></h3>
                </div>
                <ul class="list-unstyled components">
                    <li  class="active">
                        <a href="/admin" class="dashboard"><i class="material-icons">dashboard</i>
                            <span>Today</span></a>
                    </li>


                    <li class="dropdown">
                        <a href="/ausers" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">aspect_ratio</i>Users</a>
                    </li>

                    <li class="dropdown">
                        <a href="/aavailability" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">library_books</i><span>Availability</span></a>
                    </li>

                    <li class="dropdown">
                        <a href="/aform" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">border_color</i><span>Add Form</span></a>
                    </li>

                    <li class="dropdown">
                        <a href="/vform" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">extension</i><span>View Form</span></a>
                    </li>

                    <li class="dropdown">
                        <a href="/viewappointment" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">apps</i><span>View Appointments</span></a>
                    </li>

                    <li class="dropdown">
                        <a href="/analytics" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">grid_on</i><span>Reports</span></a>
                        <ul class="collapse list-unstyled menu" id="pageSubmenu6">
                    </li>
                </ul>    
            </nav>

            <div id="content">

                <!--top--navbar--->

                <div class="top-navbar">
                    <div class="xp-topbar">
                        <div class="row"> 
                            <div class="col-2 col-md-1 col-lg-1 order-2 order-md-1 align-self-center">
                                <div class="xp-menubar">
                                    <span class="material-icons text-white">signal_cellular_alt
                                    </span>
                                </div>
                            </div> 
                            <div class="col-10 col-md-11 col-lg-11 order-1 order-md-2 text-end">
                                <a href="/en/home" class="btn me-2" style="color:#fff; border-bottom-color: #f9f9f5 ">Home</a>
                                <a href="home?logout" class="btn  me-2" style="color:#fff; border-bottom-color: #f9f9f5">Logout</a>
                            </div>
                        </div> 
                    </div>
                    <div class="xp-breadcrumbbar text-center">
                        <h4 class="page-title">Dashboard</h4>               
                    </div>
                </div>

                <!--main content-->

                <div class="my-4"></div>
                <div class="main-content">
                    <div class="row">

                        <div class="col-md-12">
                            <div class="table-wrapper">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-sm-6 p-0 d-flex justify-content-lg-start justify-content-center">
                                            <h2 class="ml-lg-2">Currently Showing For ${month}, ${year}</h2>
                                        </div>
                                    </div>
                                </div>
                                <br>



<!--                                <h1>Currently Showing For ${month}, ${year}</h1>-->


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
                                <a href="<%= link%>" class="month-link"><%= monthName%> <%= year%></a>
                                <%
                                        }
                                        startMonth = 1; // Reset start month for subsequent years
                                    }
                                %>  


                                <canvas id="lineChart"></canvas>


                                <table class="analytics-table">
                                    <tr><td>In ${month} ${year} You Had: </td> <td>${TotalMade} Appointments</td></tr>
                                    <tr><td> You Had: </td> <td>${TotalGoneThrough} Complete Appointments</td></tr>
                                    <tr><td> You Had: </td> <td>${TotalCanceled} Canceled Appointments</td></tr>
                                    <tr><td> You Had: </td> <td> ~ ${AvgDaily} Appointments Created Per Day</td></tr>
                                </table>

                                <div class="container">

                                    <table class="service-table">
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

                                    <table class="time-table">

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
                                </div>
                                <div id="popup">

                                </div>
                                <div id="modalOverlay"></div>

                            </div>
                        </div>
                    </div>
                </div>

                <!--start footer-->
                <div class="my-5"></div>
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="footer-in">
                            <p class="mb-0">&copy Tai Yang Clinic. All Rights Reserved.</p>
                        </div>
                    </div>
                </footer>
            </div>
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
//                            borderColor: 'blue',
                            borderColor: '#1693A5',
                            tension: 0.1
                        },
                        {
                            label: 'Canceled Appointments',
                            data: yValuesCanceled,
                            fill: false,
//                            borderColor: 'red',
                            borderColor: '#E8182E',
                            tension: 0.1
                        },
                        {
                            label: 'Complete Appointments',
                            data: yValuesComplete,
                            fill: false,
//                            borderColor: 'green',
                            borderColor: '#78B653',
                            tension: 0.1
                        },
                        {
                            label: 'Daily Appointments',
                            data: yValuesApptMadeDaily,
                            fill: false,
//                            borderColor: 'black',
                            borderColor: '#915322',
                            tension: 0.1
                        }
                    ]
                },
                options: {
                    onHover: (event, chartElement) => {
                        event.native.target.style.cursor = chartElement[0] ? 'pointer' : 'default';
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
                    popup.textContent = ""; // Remove the popup when the close button is clicked
                    var modalOverlay = document.getElementById('modalOverlay');
                    modalOverlay.style.display = 'none';
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
                var modalOverlay = document.getElementById('modalOverlay');
                modalOverlay.style.display = 'block';

            }


            document.getElementById('modalOverlay').addEventListener('click', function (event) {
                var popup = document.getElementById("popup");
                if (event.target === this) {
                    popup.textContent = "";
                    this.style.display = 'none'; // Hide the modal overlay
                }
            });

        </script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


        <script type="text/javascript">

            $(document).ready(function () {
                $(".xp-menubar").on('click', function () {
                    $('#sidebar').toggleClass('active');
                    $('#content').toggleClass('active');
                });

                $(".xp-menubar,.body-overlay").on('click', function () {
                    $('#sidebar,.body-overlay').toggleClass('show-nav');
                });

            });

        </script>
    </body>
</html>
