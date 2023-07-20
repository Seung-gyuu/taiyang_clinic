<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.Instant"%>
<%@page import="models.Availabletime"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.util.Date"%>
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
        <link rel="stylesheet" type="text/css" href="../css/availability.css">
        <link rel="apple-touch-icon" sizes="57x57" href="src/img/favicon/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="src/img/favicon/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="src/img/favicon/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="src/img/favicon/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="src/img/favicon/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="src/img/favicon/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="src/img/favicon/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="src/img/favicon/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="src/img/favicon/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192"  href="src/img/favicon/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="src/img/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="src/img/favicon/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="src/img/favicon/favicon-16x16.png">
        <link rel="manifest" href="src/img/favicon/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/availability.css">
        <!--                <link rel="stylesheet" href="../css/booktest.css">-->
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


            .test {
                border-radius: 5px;
                padding-bottom: 5px;
                border-bottom:  1px solid black;


            }

            .fullCalendar{
                width: 100%;
                display: flex;
                overflow: hidden;
                margin: 20px auto;
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
                font-size: 13px;
                margin-top: -25px;
                padding-top: 10px;

            }

            .table_header span {
                margin-right: 5px;
            }

            .table_header p {
                margin: 0;
            }

            .header_time {
                height: 100%;
                background-color: white;
                margin-top: -50px;
            }

            .table_time {
                height: 15px;
                padding-top: 30px;
                font-size: 11px;
                margin-top: 70%;
            }

            .book_table_date {
                margin-left: 3px;
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
                padding-top: 20px;
                text-align: center;
                display: flex;
                align-items: center;
                justify-content: center;
                font-family: sans-serif;
            }

            .table_data.data_unavailable {
                font-size: 14px;
                font-weight: bold;
                padding: 15px;
                text-align: center;
                justify-content: center;
                align-items: center;

            }

            .days .availableDay {
                flex: 0 0 auto;
                flex-basis: calc(100% / 7);
                max-width: calc(100% / 7);
                min-width: calc(100% / 7);
                padding-top: 10px;
                background:#f5f5f5;
                border: 2px solid #fff;
                text-align: center;
            }
            .days .unavailableDay {
                flex: 0 0 auto;
                flex-basis: calc(100% / 7);
                max-width: calc(100% / 7);
                min-width: calc(100% / 7);
                padding-top: 10px;
                border: 2px solid #fff;
                text-align: center;
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
                padding-top: 15px;
                border-radius: 5px;
                font-size: 13px;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .days{
                display: flex;
                overflow: hidden;
            }
            .data_available {
                background-color: #5ea1ff;
                color:#fff;
                border: 1px solid #fff;
                cursor: pointer;
                height: 50px;
                max-height: 50px;
                min-height: 50px;

            }

            .data_available:hover {
                background-color: #0d6efd;
            }

            .data_unavailable {
                color: #0B486B;
                height: 5px;
                cursor: not-allowed;
            }

            .book_main_right {
                flex: 1;
                margin-top: 75px;
                padding-left: 20px;

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


            @media screen and (max-width: 1400px) {
                .book_container {
                    max-width: 1140px;
                }

            }

            table.table tr th,
            table.table tr td {
                border-color: #A8AAAF;
                border-width: 0 1px;  
                padding: 8px 15px;
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




            <div id="content" >

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

                <style>

                </style>

                <!--main contents-->
                <div class="main-content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-wrapper" >
                                <div class="table-title" >
                                    <div class="row"   >
                                        <div class="col-sm-6 p-0 d-flex justify-content-start align-items-center">
                                            <h2 class="ml-2">Schedule Availability</h2>
                                        </div>
                                    </div>
                                </div>
                                <!--                                <div class="d-flex justify-content-between align-items-center" >
                                                                    <a class="btn mr-2" id="prevBtn" >
                                                                        <button onclick="goLeft()" class="material-icons" style="font-size: 20px; padding: 5px 10px;  border-radius: 3px;">&#xE5C4;</button> 
                                                                    </a>
                                                                    <h4 class="text-center mt-3 mb-3" style="font-size: 1.1em;">Today is 
                                                                        <script>document.write(formattedDate);</script>
                                                                    </h4>
                                                                    <a class="btn mr-2" id="nextBtn" style="font-size: 1px; ">
                                                                        <button onclick="goRight()" class="material-icons" style="font-size: 20px; padding: 5px 10px;  border-radius: 3px;">&#xE5C8;</button> 
                                                                    </a>
                                                                </div>
                                -->
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


                                <div class="fullCalendar" style="width:1100px;">
                                    <div class="days">
                                        <div class="days-content">
                                            <c:forEach items="${unbooked}" var="day">
                                                <div class="unavailableDay">
                                                    <div class="table_header">${day.getDayname()}<br>
                                                        ${day.getMonthName()} ${day.getDaynumber()}
                                                    </div>
                                                    <div class="unavailable_time_data"></div>
                                                </div>
                                            </c:forEach>
                                            <c:forEach items="${booked}" var="day">
                                                <c:choose>
                                                    <c:when test="${day.getDayname() eq 'Saturday ' || day.getDayname() eq 'Sunday '}">
                                                        <div class="unavailableDay">
                                                            <div class="table_header">${day.getDayname()}
                                                                ${day.getMonthName()} ${day.getDaynumber()}
                                                            </div>
                                                            <div class="unavailable_time_data"></div>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="availableDay">
                                                            <div class="table_header">${day.getDayname()}<br>
                                                                ${day.getMonthName()} ${day.getDaynumber()}
                                                            </div>
                                                            <div class="table_time_data">
                                                                <div class="table_data"></div>
                                                                <c:forEach items="${day.getAvailabletimeList()}" var="time">
                                                                    <div class="time-entry">
                                                                        <div class="time">${time.getTruncatedStartTime()}</div>
                                                                        <div class="status" style="font-size: 15px;  color: #0B486B; font-weight: bold; cursor: not-allowed; ">
                                                                            <div class="status2" style="margin-bottom: 3px;">
                                                                                <c:if test="${time.getIsBooked()==2}">
                                                                                    Booked
                                                                                </c:if>
                                                                            </div>
                                                                            <c:if test="${time.getIsBooked()==1}">
                                                                                <c:choose>
                                                                                    <c:when test="${time.getIsAvailable() == 1}">
                                                                                        <button class="btn btn-available" style="background-color:#5492d9; font-size: 11px; color: white;" onclick="changeStatus(this, ${time.getTimeid()})">Available</button>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <% //get the current date time.  If time.getFullDate.getFullDate and time.getStartTime is before  the current date and time, make it unclickable%>
                                                                                        <% // Get the current date and time
                                                                                            Date currentDate = new Date();
                                                                                            LocalTime currentTime = LocalTime.now();
                                                                                            Availabletime avt = (Availabletime) pageContext.getAttribute("time");

                                                                                            // Convert avt's start time to LocalTime
                                                                                            Date avtStartTime = avt.getStartTime();
                                                                                            Instant instant = avtStartTime.toInstant();
                                                                                            ZoneId zoneId = ZoneId.systemDefault();
                                                                                            LocalTime avtLocalTime = LocalDateTime.ofInstant(instant, zoneId).toLocalTime();
                                                                                        %>

                                                                                        <% // Check if time.getFullDate and time.getStartTime are before the current date and time
                                                                                            if (avt.getFulldate().getFulldate().before(currentDate) && avtLocalTime.isBefore(currentTime)) {
                                                                                        %>
                                                                                        <button class="btn btn-unavailable" disabled="true" style="background-color:#d75353; font-size: 11px; color: white; cursor:not-allowed">Unavailable</button>
                                                                                        <% } else { %>
                                                                                        <button class="btn btn-unavailable" style="background-color:#d75353; font-size: 11px; color: white;" onclick="changeStatus(this, ${time.getTimeid()})">Unavailable</button>
                                                                                        <% }%>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </c:if>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                            <c:forEach items="${passed}" var="passed">
                                                <div class="unavailableDay">
                                                    <div class="unavailable_time_data">
                                                        <span>${time.getTruncatedStartTime()}</span>
                                                    </div>
                                                </div>
                                            </c:forEach>
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

        <script>
                                                                                            function changeStatus(button, timeId) {
                                                                                                var currentStatus = button.innerHTML.toLowerCase();
                                                                                                var newStatus = currentStatus === "available" ? "unavailable" : "available";
                                                                                                var data = "action=" + newStatus + "&timeid=" + timeId + "&status=" + currentStatus;
                                                                                                var blue = "#5492d9";
                                                                                                var red = "#d75353";

                                                                                                var xhr = new XMLHttpRequest();
                                                                                                xhr.onreadystatechange = function () {
                                                                                                    if (xhr.readyState === 4 && xhr.status === 200) {
                                                                                                        var message = xhr.responseText.trim();
                                                                                                        if (message === "Time slot is now unavailable") {
                                                                                                            button.innerHTML = newStatus.charAt(0).toUpperCase() + newStatus.slice(1);
                                                                                                            button.style.backgroundColor = newStatus === "available" ? blue : red;
                                                                                                            button.classList.toggle("btn-unavailable");
                                                                                                            button.classList.toggle("btn-available");
                                                                                                        } else if (message === "Time slot is now available") {
                                                                                                            button.innerHTML = newStatus.charAt(0).toUpperCase() + newStatus.slice(1);
                                                                                                            button.style.backgroundColor = newStatus === "unavailable" ? red : blue;
                                                                                                            button.classList.toggle("btn-unavailable");
                                                                                                            button.classList.toggle("btn-available");
                                                                                                        }
                                                                                                    }
                                                                                                };

                                                                                                xhr.open("POST", "aavailability", true);
                                                                                                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                                                                                xhr.send(data);
                                                                                            }

        </script>








        <script type="text/javascript">

            $(document).ready(function () {
                $(".xp-menubar").on('click', function () {
                    $('#sidebar').toggleClass('active');
                    $('#content').toggleClass('active');
                });
                $(".xp-menubar,.body-overlay").on('click', function () {
                    $('#sidebar,.body-overlay').toggleClass('show-nav');
                });
            }
            );
        </script>
    </body>
</html>