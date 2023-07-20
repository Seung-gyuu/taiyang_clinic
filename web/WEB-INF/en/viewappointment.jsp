<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
        <title>Tai Yang Clinic</title>

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
        <!--        <link rel="stylesheet" href="../css/viewappointmenttable.css">-->

        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="../css/availability.css">
        <script src="../js/availability.js"></script>


        <!--google fonts -->

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

        <!--google material icon-->
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons"rel="stylesheet">
        <%
            LocalDate today = LocalDate.now();
            String formattedDate = today.getMonth() + " " + today.getDayOfMonth() + ", " + today.getYear();
        %>
        <script>
            var formattedDate = '<%= formattedDate%>';
            // Use the formattedDate variable in your JavaScript code
        </script>

        <style>

            .modal-header {
                background-color: #f8f9fa;
                border-bottom: none;
            }


            .modal-title {
                color: #333; 
            }


            .modal-body {
                padding: 20px;
            }


            .modal-content {
                border-radius: 10px;
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            }


            .modal-content .btn-close {
                color: #999;
            }


            .modal-content .btn-close:hover {
                color: #333;
            }

            .link-style {
                color: #0B486B;
                text-decoration: underline;
                font-weight: bold;
                cursor: pointer;

            }


            .link-style:hover {
                color: #08316D;
            }



            .time-divider {
                border-top: 1px solid gray;
                margin-top: 5px;
                margin-bottom: 5px;
            }
            .time-entry {
                position: relative;
                padding-bottom: 10px;
                margin-bottom: 10px;
                border-bottom: 1px solid #ccc;
            }

            .time-entry:first-child {
                border-top: none;
            }

            .time-entry .time {
                font-size: 12px;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .time-entry .status {
                font-size: 10px;
                color: #555;
            }


            .book_container {
                margin: 0;
                padding: 0;

                display: flex;
                align-items: center;
            }
            .book_container h1 {
                font-weight: 600;
                font-family: 'Cinzel', serif;
                font-size: 35px;
                margin: 0;

            }

            .bookValue {
                margin-left: 45px;
                font-size: 16px;
            }

            .fullCalendar{
                width: 100%;
                display: flex;
                overflow: hidden;
                margin: auto ;
                margin-bottom: 20px;

            }

            .TimesLeft {
            }

            .global_top_section {
                white-space: nowrap;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .leftArrow, .rightArrow {
                display: inline-block;
            }
            .leftArrow{
                padding-right: 10%;
            }
            .rightArrow{
                padding-left: 10%;
            }

            .global_top_section button {
                background-color: #0B486B;
                border: none;
                color: white;
                padding: 10px 20px;
                font-size: 16px;

                border-radius: 50%;
            }

            .table_header {
                background-color: #fff;
                color:#000;
                height: 70px;
                padding: 15px;
                font-size: 15px;
                margin-top: -25px;
                padding-top: 10px;
            }


            .table_header p {
                margin: 0;
            }


            .table_time_data {
                background-color: #f5f5f5;
                border-radius: 5px;

            }
            .days {
                display: flex;
                overflow-x: hidden;
                position: relative;
                border:none;
                white-space: nowrap;
            }

            .days .days-content {
                width: 100%;
                display: flex;
                position: relative;
                transition: transform 0.6s ease;
                background-color: #fbfbfb;
            }
            .days-content{
                width: 100%;
            }

            .table_header{
                text-align: center;
                display: flex;
                align-items: center;
                justify-content: center;
                font-family: sans-serif;
                font-size: 13px;
            }

            .days .availableDay {
                flex: 0 0 auto;
                flex-basis: calc(100% / 7);
                max-width: calc(100% / 7);
                min-width: calc(100% / 7);
                padding-top: 10px;
                background:#f5f5f5;
                border: 2px solid #fff;
            }
            .days .unavailableDay {
                flex: 0 0 auto;
                flex-basis: calc(100% / 7);
                max-width: calc(100% / 7);
                min-width: calc(100% / 7);
                padding-top: 10px;
                border: 2px solid #fff;
            }


            .availableDay, .unavailableDay {
                flex-basis: calc(100% / 7);
                max-width: calc(100% / 7);
                min-width: calc(100% / 7);
                padding-top: 10px;
            }

            .unavailableDay{
                background: repeating-linear-gradient(
                    135deg,
                    #f5f5f5,
                    #f5f5f5 5px,
                    #c4c4c4 5px,
                    #c4c4c4 10px
                    );
                opacity: 0.4;
                border: 2px solid #fff;
            }
            .table_data {
                border-radius: 5px;
                font-size: 13px;
                display: flex;
                align-items: center;
                justify-content: center;
                background:#f5f5f5;
                margin-top: 5px;
                margin-bottom: 10px;
                margin-left: auto;
                margin-right: auto;
                text-align: center;


            }
         
            .data_available {
                background-color: #5492d9;
                color:#fff;
                cursor: pointer;
                height: 30px;
                width: 70px;
                font-size: 12px;
                justify-content: center;
                margin-bottom: 15px;


            }

            .data_available:hover {
                background-color: #0B486B;
            }

            .data_unavailable {
                background-color: lightgray;
                color: gray;
                cursor: not-allowed;
                font-size: 12px;
                height: 30px;
                width: 80px;
                margin-bottom: 15px;
            }

            .book_main_right {
                flex: 1;
                margin-top: 75px;
                padding-left: 20px;

            }

            .book_right_icon {
                display: flex;
                justify-content: space-between;
                margin: 10px;
                font-size: 11px;
            }

            .able {
                background-color: #0d6efd;
                color:#fff;
                padding: 2px 5px;
                border-radius: 10px
            }

            .unable {
                background-color: lightgray;
                color: gray;
                padding: 2px 5px;
                border-radius: 10px
            }

            .book_right_selected {
                display: flex;
                justify-content: space-between;
                background-color: #f5f5f5;
                border-radius: 5px;
                padding: 20px 10px;
                margin: 10px;
                font-size: 14px;
            }

            .book_right_btn {
                margin: 20px 10px;
            }

            .book_btn {
                padding: 10px 20px;
                border-radius: 5px;
                border: none;
                cursor: pointer;
                width: 100%;
                background-color: lightgray;
                color: gray;
                font-weight: 300;

            }

            .book_btn:hover {
                background: #212529;
                color: #fff;
            }

            @media screen and (max-width: 1400px) {
                .book_container {
                    max-width: 1140px;
                }

                .days {
                    max-width: 1040px;
                }

            }

            @media screen and (max-width: 768px) {
                .book_container {
                    max-width: 720px;  
                }

                .table_header {
                    display: block
                }

                .table_header span {
                    margin-right: 0;
                }

            }

            @media screen and (max-width: 576px) {
                .book_container {
                    max-width: 540px;  
                }
            }

            .popup-box {
                display: none; 
                position: fixed;
                z-index: 1021;
                padding-top: 100px;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%; 
                overflow: auto; 
                background-color: rgb(0,0,0); 
                background-color: rgba(0,0,0,0.4); 

            }

            .popup-content {
                width: 570px;
                background-color: #fefefe;
                padding: 30px;
                border: 1px solid #888;
                position: absolute;
                float: left;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                border-radius: 5px;
                display: flex;
                flex-direction: column;
                justify-content: center;
            }

            .book_close {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
                text-align: right;
            }

            .book_close:hover,
            .book_close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

            .popupBtns {
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .popupBtns button {
                border: none;
                padding: 5px 0;
                width: 70px;
                border-radius: 10px;
                margin-left: 20px;
            }

            .popupBtns input[type=button],
            .popupBtns input[type=submit]{
                border: none;
                padding: 5px 0;
                width: 70px;
                border-radius: 10px;
                margin-left: 15px;

                margin-top: 15px;
            }


            .confirmBtn {
                background: #0b486b;
                color:#fff;
                font-size: 14px;
            }

            .confirmBtn:hover {
                box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.2);
            }

            .cancelBtn:hover {
                box-shadow: 2px 2px 5px 2px rgba(0, 0, 0, 0.1);
            }

            #confirmBox form {
                margin-top: 15px;
            }

   

            .confirmService {
                font-size: 18px;
                font-weight: 600;
                margin-bottom: 15px;
            }

            table.table tr th,
            table.table tr td {
                border-color: #A8AAAF;
                border-width: 0 1px;  
                padding: 6px 15px;
                font-size: 14px;
                font-weight: 400;
                vertical-align: middle;
            }


            table.table tr th:first-child,
            table.table tr td:first-child {
                border-left-width: 0; 
            }


            table.table tr th:last-child,
            table.table tr td:last-child {
                border-right-width: 0; 
            }


        </style>
    </head>
    <body>
        <c:if test="${weekCounter eq null}">
            <input type="hidden" value="0" id="weekCounter" name="weekCounter"> 
        </c:if>
        <c:if test="${weekCounter ne null}">
            <input type="hidden" value="${weekCounter}" id="weekCounter" name="weekCounter"> 
        </c:if>
        <div class="wrapper">

            <div class="body-overlay"></div>

            <!-- Sidebar  -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3><img src="src/img/ClinicLogo.png" class="img-fluid"/><span>Tai Yang Clinic</span></h3>
                </div>
                <ul class="list-unstyled components">
                    <li  class="active">
                        <a href="admin" class="dashboard"><i class="material-icons">dashboard</i>
                            <span>Today</span></a>
                    </li>


                    <li class="dropdown">
                        <a href="ausers" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">aspect_ratio</i>Users</a>
                    </li>

                    <li class="dropdown">
                        <a href="aavailability" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">library_books</i><span>Availability</span></a>
                    </li>

                    <li class="dropdown">
                        <a href="aform" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">border_color</i><span>Add Form</span></a>
                    </li>

                    <li class="dropdown">
                        <a href="vform" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">extension</i><span>View Form</span></a>
                    </li>

                    <li class="dropdown">
                        <a href="viewappointment" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">apps</i><span>View Appointments</span></a>
                    </li>

                    <li class="dropdown">
                        <a href="analytics" data-toggle="collapse" aria-expanded="false" 
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
                                <a href="/home" class="btn me-2" style="color:#fff; border-bottom-color: #f9f9f5 ">Home</a>
                                <a href="home?logout" class="btn  me-2" style="color:#fff; border-bottom-color: #f9f9f5">Logout</a>
                            </div>
                        </div> 
                    </div>
                    <div class="xp-breadcrumbbar text-center">
                        <h4 class="page-title">Dashboard</h4>               
                    </div>
                </div>

                <!--main contents-->

                <div class="main-content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-wrapper">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-sm-6 p-0 d-flex justify-content-start align-items-center">
                                            <h2 class="ml-2">View Appointment</h2>
                                        </div>
                                        <div>
                                            <h2>Search Time Frame: </h2>
                                            <br>
                                            <form method="post" action="viewappointment">
                                                <label for="start">Start Date:</label>
                                                <input type="date" id="start" name="start" min="2023-05-13">
                                                <label for="end">End Date:</label>
                                                <input type="date" id="start" name="end" min="2023-05-13">
                                                <input type="submit" value="Submit">
                                                <input type="hidden" name="action" value="range">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between align-items-center" >
                                    <a class="btn mr-2" id="prevBtn" style="font-size: 1px; border: 2px solid rgb(0, 0, 0);">
                                        <i onclick="goLeft()" class="material-icons">&#xE5C4;</i> 
                                    </a>
                                    <h4 class="text-center mt-3 mb-3" style="font-size: 1.1em;">
                                        <script>document.write(formattedDate);</script>
                                    </h4>
                                    <a class="btn mr-2" id="nextBtn" style="font-size: 1px; border: 2px solid rgb(0, 0, 0);">
                                        <i onclick="goRight()" class="material-icons">&#xE5C8;</i> 
                                    </a>
                                </div>
                                <br>
                                    <div class="fullCalendar" style="width:1100px;">
                                        <div class="days">
                                            <div class="days-content">
                                                <c:forEach items="${unbooked}" var="day">
                                                    <div class="unavailableDay">
                                                        <div class="table_header">${day.getDayname()}<br>
                                                            ${day.getMonthName()} ${day.getDaynumber()}</div>
                                                        <div class="unavailable_time_data">
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                                <c:forEach items="${booked}" var="day">
                                                    <c:choose>
                                                        <c:when test="${day.getDayname() eq 'Saturday ' || day.getDayname() eq 'Sunday '} ">
                                                            <div class="unavailableDay">
                                                                <div class="table_header">${day.getDayname()}
                                                                    ${day.getMonthName()} ${day.getDaynumber()}</div>
                                                                <div class="unavailable_time_data"></div>
                                                            </div>                
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="availableDay" >
                                                                <div class="table_header">${day.getDayname()}<br>
                                                                    ${day.getMonthName()} ${day.getDaynumber()}</div>
                                                                <div class="table_time_data" style="font-size: 13px; text-align: center; font-weight: bold;">
                                                                    <div class="table_data" ></div>

                                                                    <c:forEach items="${day.getAvailabletimeList()}" var="time">
                                                                        <c:if test="${time.getIsAvailable()==2}">
                                                                            <c:if test="${time.getIsBooked()==2}">
                                                                                ${time.getTruncatedStartTime()}<br><div class="table_data data_available" style="font-weight: normal; text-align: center; cursor: pointer;" id="${time.getTimeid()}" onClick="getAppointmentDetails('${time.getTimeid()}')">Booked</div>
                                                                            </c:if>

                                                                            <c:if test="${time.getIsBooked()==1}">
                                                                                ${time.getTruncatedStartTime()}<br><div class="table_data data_unavailable" style="font-weight: normal; align-items: center; text-align: center; " >Unavailable</div>
                                                                            </c:if>
                                                                            <hr class="time-divider">
                                                                        </c:if>    
                                                                        <c:if test="${time.getIsAvailable()==1}">

                                                                            <td style="font-size: 12px;">${time.getTruncatedStartTime()}<br></td>
                                                                            <div style="margin-top: 6px; margin-bottom: 20.5px;">
                                                                                <td>
                                                                                    <a style="color:#0B486B; font-weight:bold; font-size: 13px; cursor: not-allowed; ">Unbooked</a><br>

                                                                                </td>
                                                                            </div>
                                                                            <hr class="time-divider">
                                                                        </c:if>
                                                                    </c:forEach>

                                                                </div>     
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                <c:if test="${range ne null}">
                                    <form action="viewappointment" method="get">
                                        <input type="submit" value="Go Back">
                                    </form>
                                </c:if>

                                <div class="modal fade" id="popupModal" tabindex="-1" aria-labelledby="popupModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="popupModalLabel">Appointment Details</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div id="popupContent"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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

        <script src="js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.min.js"></script>


        <script src="../js/viewappointment.js"></script>
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

                                                                            function getAppointmentDetails(timeID) {
                                                                                fetch('/getApptDetails?timeId=' + timeID) //make the new server endpoint, get appointment details.  Add popup with details and href to view forms for that userID
                                                                                        .then(response => response.json())
                                                                                        .then(data => {
                                                                                            var firstName = data.firstName;
                                                                                            var lastName = data.lastName;
                                                                                            var serviceName = data.serviceName;
                                                                                            var apptDesc = data.apptDesc;
                                                                                            var userId = data.userId;

                                                                                            var output = "";

//                            output = "<div class='popupText'>Appointment Details";
                                                                                            output += "Name: " + firstName + " " + lastName;
                                                                                            output += "<br> Service Name: " + serviceName;
                                                                                            output += "<br> Desc: " + apptDesc;
                                                                                            output += "<br><a href='/vform?userId=" + userId + "' class='link-style'>View forms</a>";
//                            output += "<button onClick='closePopup()'>Close</button>";
                                                                                            output += "<br><button type='button' class='btn btn-secondary' data-bs-dismiss='modal'>Close</button>";
                                                                                            output += "</div>";

                                                                                            document.getElementById('popupContent').innerHTML = output;

                                                                                            $('#popupModal').modal('show');
                                                                                        })
                                                                                        .catch(error => {
                                                                                            // Handle any error that occurs during the request
                                                                                            console.error('Error:', error);
                                                                                        });
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

        </script>


    </body>
</html>