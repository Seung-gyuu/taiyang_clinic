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

        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../css/availability.css">
        <script src="js/availability.js"></script>

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

            p{
                font-size:15px;
                margin:12px 0 0;
                line-height:24px;
            }

            a{
                color:#333;
                font-weight:400;

            }


            button:focus{
                box-shadow:none;
                outline:none;
                border:none;
            }


            button{
                cursor:pointer;
            }

            ul,ol{
                padding:0px;
                margin:0px;
                list-style:none;
            }

            a,a:hover,a:focus{
                color:#333;
                text-decoration:none;
                transition:all 0.3s;
            }


            .wrapper{
                position:relative;
                width:100%;
                overflow:auto;	
            }

            /*=========sidebar---design------*/

            #sidebar{
                position:fixed;
                height:100%!important;
                top:0;
                left:0;
                bottom:0;
                z-index:11;
                width:260px;
                overflow:auto;
                transition:all 0.3s;
                background-color:#fff;
                box-shadow:0 0 30px 0 rgba(200 200 200 / 20%);
            }


            @media only screen and (min-width:992px){
                #sidebar.active{
                    left:-260px;
                    height:100%!important;
                    position:absolute!important;
                    overflow:visible!important;
                    top:0;
                    z-index:666;
                    float:left!important;
                    bottom:0!important;
                }

                #content{
                    width:calc(100% - 260px);
                    position:relative;
                    float:right;
                    transition:all 0.3s;
                }

                #content.active{
                    width:100%;
                }

            }


            #sidebar::-webkit-scrollbar{
                width:5px;
                border-radius:10px;
                background-color:#eee;
                display:none;
            }

            #sidebar::-webkit-scrollbar-thumbs{
                width:5px;
                border-radius:10px;
                background-color:#333;
                display:none;
            }

            #sidebar:hover::-webkit-scrollbar-thumbs{
                display:block;
            }

            #sidebar:hover::-webkit-scrollbar{
                display:block;
            }

            #sidebar .sidebar-header{
                padding:20px;
                background-color:#fff;
                border-bottom:1px solid #eee;
            }

            .sidebar-header h3{
                color:#333;
                font-size:17px;
                margin:0px;
                text-transform:uppercase;
                transition:all 0.5s ease;
                font-weight:600;
            }

            .sidebar-header h3 img{
                width:45px;
                margin-right:10px;
            }

            #sidebar ul li{
                padding:2px 0px;
            }

            #sidebar ul li.active> a{
                color:#4c7cf3;
                background-color:#DBE5FD;
            }


            #sidebar ul li.active> a i{
                color:#4c7cf3;
            }



            #sidebar ul li a:hover{
                color:#4c7cf3;
                background-color:#DBE5FD;
            }


            .dropdown-toggle::after{
                position:absolute;
                right:22px;
                top:18px;
                color:#777777;
            }

            #sidebar ul li.dropdown{
                position:sticky;
            }


            #sidebar ul.component{
                padding:20px 0px;  
            }

            #sidebar ul li a{
                padding:5px 10px 5px 20px;
                line-height:30px;
                font-size:15px;
                position:relative;
                font-weight:400;
                display:block;
                color:#777777;
                text-transform:capitalize;
            }

            #sidebar ul li a i{
                position:relative;
                margin-right:10px;
                top:6px;
            }


            /*=========sidebar---design- end-----*/


            /*========main-content- navbardesign -start-----*/

            #content{
                position:relative;
                transition:all 0.5s;
                background-attachment:#f9fafc;
            }


            .top-navbar{
                width:100%;
                z-index:9;
                position:relative;
                padding:15px 30px;
                background-color:#353b48;
            }

            .xd-topbar{
                width:100%;
                position:relative;
            }


            .input-group-append{
                margin-left:-1px;
            }


            .xp-searchbar .btn{
                background-color:#4a5263;
                color:#fff;
                font-weight:600;
                font-size:16px;
                border-radius:0 50px 50px 0;
                padding:4px  15px;
            }


            .xp-breadcrumbbar .page-title{
                font-size:20px;
                color:#fff;
                margin-bottom:0;
                margin-top:0;
            }

            .breadcrumb{
                display:inline-flex;
                background-color:transparent;
                margin:0;
                padding:10px 0 0;
            }

            .breadcrumb .breadcrumb-item a{
                color:#777777;
            }

            .breadcrumb-item.active{
                color:#6c757d;
            }


            .breadcrumb-item+.breadcrumb-item{
                padding-left:.5rem;
            }

            .main-content{
                padding:30px 30px 0px 30px;
            }

            .navbar{
                background-color:#353B48;
                color:#fff;
            }

            .navbar-brand{
                color:#fff;
            }

            .navbar button{
                background-color:transparent;
                border:none;		   
            }

            .navbar button span{
                color:#fff;
            }

            .xp-menubar{
                border-radius:50%;
                width:45px;
                height:45px;
                line-height:45px;
                text-align:center;
                margin-right:20px;
                border:none;
                color:#fff;
                cursor:pointer;
                background-color:rgba(0,0,0,0.09);	   
            }


            .xp-menubar span{
                margin:9px;
                padding:0px;
                transform:rotate(90deg);
            }

            .navbar-nav > li.active{
                color:#fff;
                border-radius:4px;
                background-color:rgba(0,0,0,0.08);
            }
            .navbar-nav > li > a{
                color:#fff;
            }

            .navbar .notification{
                position:absolute;
                top:2px;
                right:3px;
                display:block;
                font-size:9px;
                border:0;
                background-color:#2bcd72;
                min-width:15px;
                text-align:center;
                padding:1px 5px;
                height:15px;
                border-radius:2px;
                line-height:14px;
            }

            @media (max-width:768px){
                .xp-searchbar{
                    margin-top:20px;
                }
            }

            .navbar-nav > li.show .dropdown-menu{
                transform:translate3d(0,0,0);
                opacity:1;
                display:block;
                visibility:visible;
            }

            .dropdown-menu{
                border:0;
                box-shadow:0 2px 5px 0 rgba(0 0 0 / 26%);
                transform:translate3d(0, -20px ,0);
                visibility:hidden;
                position:absolute!important;
                transition:all 150ms linear;
                display:block;
                min-width:15rem;
                right:0;
                left:auto;
                opacity:0;
            }

            .small-menu{
                min-width:10rem;
            }


            .dropdown-menu li > a{
                font-size:13px;
                padding:10px 20px;
                margin:0 5px;
                border-radius:2px;
                font-weight:400;
                transition:all 150ms linear;
            }


            .dropdown-menu li > a .material-icons{
                position:relative;
                top:3px;
                color:#777;
                margin-right:6px;
                font-size:16px;

            }

            .navbar-nav > .active > a:focus{
                color:#fff;
                background-color:rgba(0,0,0,0.08);
            }
            .navbar-nav li a{
                position:relative;
                display:block;
                padding:4px 10px!important;
            }

            .nav-item .nav-link .material-icons{
                position:relative;
                top:10px;
                font-size:19px;
            }

            .xp-user-live{
                position:absolute;
                bottom:5px;
                right:9px;
                width:12px;
                height:12px;
                border-radius:50%;
                border:2px solid #353b48;
                background-color:#4c7cf3;
            }

            /*---navbardesign -end-----*/



            /*--table design start----*/ 

            .table-wrapper {
                background-color: #fff;
                /* padding: 20px 25px; */
                margin:6px 0px 40px 0px;
                width: 100%;
                overflow: auto;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgb(0 0 0 / 5%);
            }

            .table-title{
                background:#353b48;
                color:#fff;
                position:sticky;
                top:0;
                width:100%;
                left:0;
                padding:10px 30px;
                border-radius:0px 0px 0 0;
            }

            .table-title h2{
                margin:5px 0  0;
                font-size:17px;
            }

            .table-title .btn-group{
                float:right;
            }
            .table-title .btn{
                float:right;
                font-size:13px;
                border:none;
                min-width:50px;
                border-radius:2px;
                outline:none!important;
                margin-left:10px;
            }
            .table-title .btn i{
                float:left;
                font-size:21px;
                margin-right:5px;
            }

            .table-title .btn span{
                float:left;
                margin-top:2px;
            }

            table.table tr th, table.table tr td{
                font-weight: 400;

            }

            table.table tr th:first-child{
                width:200px;
            }

            table.table tr th:last-child{
                width:200px;
            }

            table.table-stripped tbody tr:nth-of-type(odd){
                background-color:#fcfcfc;
            }

            table.table-stripped.table-hover tbody tr:hover{
                background-color:#f5f5f5;
            }

            table.table th i{
                font-size:17px;
                margin: 6px 5px;
                cursor:pointer;
            }

            table.table td a{
                font-weight:bold;
                color:#566787;
                display:inline-block;
                text-decoration:none;
                outline:none!important;
            }
            table.table td a:hover{
                color:#2196F3;
            }



            table.table td  i{
                font-size:19px;
            }

            table.table .avatar{
                border-radius:50%;
                vertical-align:middle;
                margin-right:10px;
            }



            .hint-text{
                float:left;
                margin-top:10px;
                font-size:13px;
            }


            /*--table design end----*/ 




            /*-------footer design start------*/
            footer{
                background-color:#353b48;
                color:#fff;
                text-align:center;
                padding:10px 30px;
                position:relative;
                width:100%;
            }

            /*-------footer design end------*/
            #sidebar.show-nav, .body-overlay.show-nav{
                transform:translatex(0%);
                opacity:1;
                display:block;
                visibility:visible;
                z-index:15;
            }


            /*========main-content- navbardesign -end-----*/


            @media only screen and (max-width:992px){
                #sidebar{
                    position:fixed;
                    top:0;
                    bottom:0;
                    z-index:10;
                    width:260px;
                    transform:translatex(-100%);
                    transition:all 150ms linear;
                    box-shadow:none!important;
                }

                .body-overlay{
                    position:fixed;
                    top:0;
                    left:0;
                    width:100%;
                    height:100%;
                    display:none;
                    visibility:hidden;
                    opacity:0;
                    z-index:3;
                    transition:all 150ms linear;
                    background-color:rgba(0,0,0,0.5);
                }
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
                    <h3><img src="logo" class="img-fluid"/><span>Tai Yang Clinic</span></h3>
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
                        <a href="areport" data-toggle="collapse" aria-expanded="false" 
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
                                        <div class="col-sm-6 p-0 d-flex justify-content-end">


                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="d-flex justify-content-between align-items-center">
                                    <a class="btn mr-2" id="prevBtn" style="font-size: 1px; border: 2px solid rgb(0, 0, 0);">
                                        <button onclick="goLeft()" class="material-icons">&#xE5C4;</button> 
                                    </a>
                                    <h4 class="text-center mt-3 mb-3" style="font-size: 1.1em;">Today is 
                                        <script>document.write(formattedDate);</script>
                                    </h4>
                                    <a class="btn mr-2" id="nextBtn" style="font-size: 1px; border: 2px solid rgb(0, 0, 0);">
                                        <button onclick="goRight()" class="material-icons">&#xE5C8;</button> 
                                    </a>
                                </div>
                                <br>
                                <div class="fullCalendar">
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
                                                        <div class="availableDay">
                                                            <div class="table_header">${day.getDayname()}<br>
                                                                ${day.getMonthName()} ${day.getDaynumber()}</div>
                                                            <div class="table_time_data">
                                                                <div class="table_data"></div>
                                                                <c:forEach items="${day.getAvailabletimeList()}" var="time">
                                                                    <c:if test="${time.getIsAvailable()==2}">
                                                                        <td style="font-size: 12px;">${time.getTruncatedStartTime()}<br></td>
                                                                            <c:forEach items="${apptInfo}" var="apptInfo">
                                                                                <c:if test="${apptInfo.timeid.timeid == time.timeid}">
                                                                                <a style="color:gray; font-size: 12px;">Name: 
                                                                                    <c:out value="${apptInfo.userid.getFirstname()}" />
                                                                                    <c:out value="${apptInfo.userid.getLastname()}"  />
                                                                                    <br>Service: 
                                                                                    <c:out value="${apptInfo.serviceid.serviceName}"  />
                                                                                    <br>
                                                                                    <c:choose>
                                                                                        <c:when test="${empty apptInfo.description}">
                                                                                            No description
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <c:out value="${apptInfo.description}" />
                                                                                        </c:otherwise>
                                                                                    </c:choose></a><br>
                                                                                <td>
                                                                                    <a href="/vform?userId=${apptInfo.userid.getUserid()}" style="font-size: 12px;">View Forms</a><br>
                                                                                </td>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </c:if>    
                                                                    <c:if test="${time.getIsAvailable()==1}">
                                                                        <td style="font-size: 12px;">${time.getTruncatedStartTime()}<br></td>
                                                                        <td>
                                                                            <a style="color:gray; font-size: 12px;">Unbooked</a><br>

                                                                        </td>
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
                                <div id="popupBox" style="display: none;"> 
                                    <div id="popupContent"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--                                <div class="modal fade" id="viewAppointmentModal" tabindex="-1" aria-labelledby="viewAppointmentmodalLabel" aria-hidden="true">
                                                     Modal content 
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="viewAppointmentmodalLabel">Patient Info</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                <c:out value="${apptInfo.userid.getFirstname()}" />
                <c:out value="${apptInfo.userid.getLastname()}"  />
                <br>Service: 
                <c:out value="${apptInfo.serviceid.serviceName}"  />
                <br>Description:
                <c:choose>
                    <c:when test="${empty apptInfo.description}">
                        No description
                    </c:when>
                    <c:otherwise>
                        <c:out value="${apptInfo.description}" />
                    </c:otherwise>
                </c:choose>
                -->                                            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>-->

<!--<script>
    $('#viewAppointmentModal').on('show.bs.modal', function (event) {
        // Get the button that triggered the modal
        var button = $(event.relatedTarget);

        // Extract data attributes from the clicked button
        var startTime = button.data('start-time');
        var endTime = button.data('end-time');
        var firstName = button.data('first-name');
        var lastName = button.data('last-name');
        var serviceName = button.data('service-name');
        var description = button.data('description');

        // Update the modal's elements with the retrieved values
        var modal = $(this);
        modal.find('#startTime').text(startTime);
        modal.find('#endTime').text(endTime);
        modal.find('#patientName').text(firstName + ' ' + lastName);
        modal.find('#serviceName').text(serviceName);
        modal.find('#description').text(description);
    });
</script>-->


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
    //                var unbookedLinks = document.querySelectorAll('.unbooked');
    //                for (var i = 0; i < unbookedLinks.length; i++) {
    //                    unbookedLinks[i].addEventListener('click', function (event) {
    //                        event.preventDefault();
    //                    });
    //                }


</script>



<script src="js/bootstrap.min.js"></script>
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