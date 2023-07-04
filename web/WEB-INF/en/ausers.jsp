<%@page import="java.util.List"%>
<%@page import="models.User"%>
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
        <link rel="stylesheet" href="css/ausers.css">
        <script src="js/ausers.js"></script>

        <!--google fonts -->

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

        <!--google material icon-->
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons"rel="stylesheet">

        <style>
            form {
                /*                display: flex;*/
                flex-direction: column;
                /*                align-items: center;*/
                margin-top: 20px;
                max-width: 500px;
                /*                margin-left: auto;
                                margin-right: auto;*/

            }

            label {
                display: block;
                margin-bottom: 5px;
                font-size: 14px;

            }

            .form-control {
                width: 100%;
                border-radius: 4px;
                border: 1px solid #ccc;
                box-sizing: border-box;
                margin-bottom: 10px;
            }

            .form-control:focus {
                border-color: #80bdff;
                outline: none;
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            }

            .radio-group {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
            }

            .radio-group label {
                margin-right: 10px;
            }

            .button-group {
                /*                display: flex;
                                justify-content: center;
                                margin-top: 8px;*/
                margin-bottom: 5px;
            }


            #savebutton {
                background-color: #0B486B;
                color: #0B486B;
                color: white;
                border: none;
                padding: 5px 10px;
                border-radius: 4px;
                cursor: pointer;
                font-weight: light;
                margin-left: 5px;
                font-size: 15px;
            }


            .cancelBtn {
                background-color: #979797;
                color: #fff;
                border: none;
                padding: 5px 10px;
                border-radius: 4px;
                cursor: pointer;
                font-weight: light;
                transition: background-color 0.3s ease;
                font-size: 15px;

            }

            .cancelBtn:hover {
                background-color: #c62828;
            }

            .pageNumbers {
                margin-top: 10px;
                text-align: center;
            }
            .pageNumbers button{

                margin-bottom: 10px;
                font-size:13px;
                border:none;
                color: #666;
                padding: 0 6px;
                text-align:center;
                border-radius: 2px;
                transition: background-color 0.3s ease-in;
            }

            #message{
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #496f53;
                /*                padding: 11px;*/
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
                border-radius: 3px;   
                text-align:center;
                color: white;

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
            input[type="search"]{
                /*                background-color:#f9f9f5;*/
                background-color: #f3f3f3;
                color:#fff;
                padding-left:20px;
                border:none;
                border-radius:50px 0px 0px 50px;
            }


            .xp-searchbar .btn{
                /*                background-color:#496f53;*/
                background-color:#4a5263;
                color:#fff;
                font-weight:600;
                font-size:18px;
                border-radius:0 50px 50px 0;
                padding:4px  15px;
            }


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
                color:#fff;
                float:right;
                font-size:13px;
                border:none;
                min-width:50px;
                border-radius:2px;
                border:none;
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
                border-color:#e9e9e9;
                padding:8px 15px;
                font-size:14px;
                font-weight: 400;
                vertical-align:middle;
            }

            /*                        table.table tr th:first-child{
                                        width:200px;
                                    }*/

            /*            table.table tr th:last-child{
                            width:200px;
                        }*/

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
            /*
            .pagination{
                float:right;
                margin:0 0 5px;
            }
            
            .pagination  li a{
                border:none;
                font-size:13px;
                min-width:30px;
                min-height:30px;
                color:#999;
                margin:0 2px;
                line-height:30px;
                border-radius:2px!important;
                text-align:center;
                padding:0 6px;
            }
            
            .pagination  li a:hover{
                color:#666;
            }
            
            
            .pagination li.disabled i{
                color:#ccc;
            
            }
            
            .pagination li i{
                font-size:16px;
                padding-top:6px;
            }*/



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


                <!--------main-content------------->
                <div class="my-4"></div>
                <div class="col-md-5 col-lg-3 mx-auto order-3 order-md-2">
                    <div class="xp-searchbar">
                        <form>
                            <div class="input-group">
                                <input type="search" class="form-control" id="searchterm" placeholder="Search By First Name" oninput="handleSearch(this.value)" />
                                <div class="input-group-append">
                                    <button class="btn" type="submit" 
                                            id="button-addon2">GO</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="main-content">
                    <div class="row">

                        <div class="col-md-12">
                            <div class="table-wrapper">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-sm-6 p-0 d-flex justify-content-lg-start justify-content-center">
                                            <h2 class="ml-lg-2">Manage Users</h2>
                                        </div>

                                        <div class="col-sm-6 p-0 d-flex justify-content-lg-end justify-content-center">
                                            <a class="btn" data-bs-toggle="modal" data-bs-target="#newUsersModal" style="background-color: #496f53; font-size: 12px;" >
                                                <i class="material-icons">&#xE147;</i> <span>Add New User</span></a>
                                            <!--                                            <a class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deactivateUsersModal" >
                                                                                            <i class="material-icons">&#xE15C;</i> <span>Deactivate</span></a>-->
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${viewUser eq null}">
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <!--                                            <th>
                                                                                                <span class="custom-checkbox">
                                                                                                    <input type="checkbox" id="selectAll">
                                                                                                    <label for="selectAll"></label>
                                                                                                </span>
                                                                                            </th>-->
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Edit</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% int usersPerPage = 10; %>
                                            <% List<User> userList = (List<User>) request.getAttribute("userList"); %>
                                            <% int totalUsers = userList.size(); %>
                                            <% int totalPages = (int) Math.ceil((double) totalUsers / usersPerPage); %>
                                            <% int currentPage = 1; %>
                                            <% String pageParam = request.getParameter("page"); %>
                                            <% if (pageParam != null && !pageParam.isEmpty()) { %>
                                            <% currentPage = Integer.parseInt(pageParam); %>
                                            <% } %>
                                            <% int startIndex = (currentPage - 1) * usersPerPage; %>
                                            <% int endIndex = Math.min(startIndex + usersPerPage, totalUsers);%>
                                            <% int loopIndex = 0;%>
                                            <c:forEach var="user" items="${userList}">
                                                <tr>
                                                    <!--                                            <td>
                                                                                                    <span class="custom-checkbox">
                                                                                                        <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                                                                                        <label for="checkbox1"></label>
                                                                                                    </span>
                                                                                                </td>-->
                                                <tr class="userRow <% if (loopIndex >= startIndex && loopIndex < endIndex) { %>active<% }%>">
                                                    <td>${user.getFirstname()}</td>
                                                    <td>${user.getLastname()}</td>
                                                    <td>${user.getEmailAddress()}</td>
                                                    <td>${user.getPhoneNumber()}</td>
                                                    <td>
                                                        <a href="/ausers?userId=${user.getUserid()}">Edit</a>
        <!--                                                <a href="/ausers?userId=${user.getUserid()}" class="" data-bs-toggle="modal" data-bs-target="#editUsersModal">
                                                            <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                                        <a href="" class="" data-bs-toggle="modal" data-bs-target="#deactivateUsersModal" >
                                                            <i class="material-icons" data-toggle="tooltip" title="Deactivate">&#xE872;</i></a>-->
                                                    </td>
                                                </tr>
                                                <% loopIndex++;%>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="pageNumbers">
                                        <% for (int pageNumber = 1; pageNumber <= totalPages; pageNumber++) {%>
                                        <button id="page<%=pageNumber%>" onclick="showPage(<%= pageNumber%>)">Page <%= pageNumber%></button>
                                        <% }%>
                                    </div>
                                    <script>
                                        const userRows = document.querySelectorAll('.userRow');
                                        const rowsPerPage = 10;
                                        let currentPage = 1;

                                        function showPage(pageNumber) {
                                            document.getElementById('searchterm').value = "";
                                            const startIndex = (pageNumber - 1) * rowsPerPage;
                                            const endIndex = startIndex + rowsPerPage;

                                            userRows.forEach(function (row, index) {
                                                if (index >= startIndex && index < endIndex) {
                                                    row.style.display = 'table-row';
                                                } else {
                                                    row.style.display = 'none';
                                                }
                                            });

                                            currentPage = pageNumber;

                                            // Reset styles for all buttons
                                            const pageButtons = document.querySelectorAll('.pageNumbers button');
                                            pageButtons.forEach(function (button) {
                                                button.style.backgroundColor = '';
                                                button.style.color = '';
                                            });

                                            // Apply styles to the clicked button
                                            const clickedButton = document.getElementById('page' + pageNumber);
                                            clickedButton.style.backgroundColor = 'grey';
                                            clickedButton.style.color = 'white';
                                        }

                                        function handleSearch(searchTerm) {
                                            searchTerm = searchTerm.toLowerCase();

                                            if (searchTerm === '') {
                                                showPage(1); // Display the first page with all users
                                                return; // Exit the function
                                            }

                                            userRows.forEach(function (row) {
                                                const firstName = row.querySelector('td:first-child').textContent.toLowerCase();
                                                if (firstName.includes(searchTerm)) {
                                                    row.style.display = 'table-row';
                                                } else {
                                                    row.style.display = 'none';
                                                }
                                            });

                                            // Hide all rows on other pages
                                            const currentPageRows = Array.from(document.querySelectorAll('.userRow.active'));
                                            currentPageRows.forEach(function (row) {
                                                if (!row.style.display) {
                                                    row.style.display = 'none';
                                                }
                                            });
                                        }

                                        // Show the first page on initial load
                                        showPage(1);
                                    </script>
                                </c:if>
                                <form action="update" method="post">
                                    <c:if test="${viewUser ne null}">
                                        <thead>
                                            <tr>
                                                <td><label for="firstname">First Name:</label>
                                                    <input type="text" id="firstname" class="form-control" value="${viewUser.getFirstname()}">
                                                </td>
                                                <td><label for="lastname">Last Name:</label>
                                                    <input type="text" id="lastname" class="form-control" value="${viewUser.getLastname()}">
                                                </td>
                                                <td><label for="email">Email address:</label>
                                                    <input type="text" id="email" class="form-control" value="${viewUser.getEmailAddress()}">
                                                </td>
                                                <td><label for="phone">Phone number:</label>
                                                    <input type="text" id="phone" class="form-control" value="${viewUser.getPhoneNumber()}">
                                                </td>
                                                <td>
                                                    <div class="radio-group">
                                                        <label for="deactivate">Activation</label>
                                                        <input type="radio" id="activate" name="isactive" value="${viewUser.isactive}">${viewUser.isactive}

                                                        <input type="hidden" id="dynamicHtml" value="<c:forEach items='${isadtive}' var='v'>
                                                               <input type='radio' name='activation' value='${v.iscative}' onClick='activation()'>${v.isactive}</c:forEach>"> </div>
                                                    </td>
                                                    <td>
                                                        <div class="radio-group">
                                                            <label for="role">Role</label>
                                                            <input type="hidden" id="dynamicHtml" value="<c:forEach items='${roleName}' var='r'>
                                                               <input type='radio' name='role' value='${r.roleid}' onClick='role()'>${r.roleName}</c:forEach>">  
                                                            <input type="radio" id="admin" name="isadmin" value="admin">Admin&nbsp; &nbsp; &nbsp;
                                                            <input type="radio" id="patient" name="isadmin" value="patient">Patient
                                                        </div>
                                                    </td>
                                                </tr>
                                            </thead><br>
                                            <div class="button-group">
                                                <!--<button type="button" class="btn btn-success" onclick="saveUsers()">Save</button>-->
                                                <input type="hidden" name="action" value="update">
                                                <a href="/ausers"><input type="button" value="Cancel"  class ="cancelBtn">
                                                    <input type="submit" name="submit" value="  Save  " class= "saveBtn" onclick="saveData()" id="savebutton">
                                                    <!--                                            <a href="/ausers"><input type="button" value="Cancel">-->
                                                    </div>
                                            </c:if>
                                            </form>

                                            </div>
                                            </div>

                                            <!--                         Edit Modal HTML 
                                                                    <div id="addEmployeeModal" class="modal fade">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <form>
                                                                                    <div class="modal-header">
                                                                                        <h4 class="modal-title">Add Employee</h4>
                                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <div class="form-group">
                                                                                            <label>Name</label>
                                                                                            <input type="text" class="form-control" required>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label>Email</label>
                                                                                            <input type="email" class="form-control" required>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label>Address</label>
                                                                                            <textarea class="form-control" required></textarea>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label>Phone</label>
                                                                                            <input type="text" class="form-control" required>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                                                        <input type="submit" class="btn btn-success" value="Add">
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                     Edit Modal HTML 
                                                                    <div id="editEmployeeModal" class="modal fade">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <form>
                                                                                    <div class="modal-header">
                                                                                        <h4 class="modal-title">Edit Employee</h4>
                                                                                        <button type="button" class="close" data-dismiss="modal" 
                                                                                                aria-hidden="true">&times;</button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <div class="form-group">
                                                                                            <label>Name</label>
                                                                                            <input type="text" class="form-control" required>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label>Email</label>
                                                                                            <input type="email" class="form-control" required>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label>Address</label>
                                                                                            <textarea class="form-control" required></textarea>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <label>Phone</label>
                                                                                            <input type="text" class="form-control" required>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                                                        <input type="submit" class="btn btn-info" value="Save">
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                            
                                            
                                            
                                                                     Delete Modal HTML 
                                                                    <div id="deactivateEmployeeModal" class="modal fade">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <form>
                                                                                    <div class="modal-header">
                                                                                        <h4 class="modal-title">Delete Employee</h4>
                                                                                        <button type="button" class="close" data-dismiss="modal" 
                                                                                                aria-hidden="true">&times;</button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <p>Are you sure you want to deactivate these Records?</p>
                                                                                        <p class="text-warning"><small>This action cannot be undone.</small></p>
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                                                        <input type="submit" class="btn btn-danger" value="Delete" onclick="showMessage()">
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>-->

                                            <div class="modal fade" id="newUsersModal" tabindex="-1" aria-labelledby="addNewUsersModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="addNewUsersModalLabel">Add New Users</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <label for="description">First Name:</label>
                                                            <input type="text" id="description" class="form-control">
                                                            <label for="description">Last Name:</label>
                                                            <input type="text" id="description" class="form-control">
                                                            <label for="description">Email:</label>
                                                            <input type="text" id="description" class="form-control">
                                                            <label for="description">Phone Number:</label>
                                                            <input type="text" id="description" class="form-control">
                                                            <label for="description">Password:</label>
                                                            <input type="text" id="description" class="form-control">
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                            <button type="button" class="btn btn-success" onclick="saveUsers()">Save</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="modal fade" id="deactivateUsersModal" tabindex="-1" aria-labelledby="deactivateUsersModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="deactivateUsersModalLabel">Add New Users</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <!--                                                    <div class="modal-body">
                                                                                                                <p>Are you sure you want to deactivate this user?</p>
                                                        
                                                                                                            </div>
                                                                                                            <div class="modal-footer">
                                                                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                                                                <button type="button" class="btn btn-success" onclick="deactivateUsers()">Deactivate</button>
                                                                                                            </div>-->
                                                    </div>
                                                </div>
                                            </div>
                                    </div>
                            </div>

                            <!--                                        <div class="modal fade" id="editUsersModal" tabindex="-1" aria-labelledby="editUsersModalLabel" aria-hidden="true">
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                    <h5 class="modal-title" id="editUsersModalLabel">Edit User Information</h5>
                                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    <label for="description">First Name:</label>
                                                                                    <input type="text" id="description" class="form-control" ${user.getFirstname()}/>
                                                                                    <label for="description">Last Name:</label>
                                                                                    <input type="text" id="description" class="form-control" ${user.getLastname()}/>
                                                                                    <label for="description">Email:</label>
                                                                                    <input type="text" id="description" class="form-control" ${user.getEmailAddress()}/>
                                                                                    <label for="description">Phone Number:</label>
                                                                                    <input type="text" id="description" class="form-control" ${user.getPhonenumber()}/>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                                    <button type="button" class="btn btn-success" onclick="editUsers()">Save</button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>-->



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
                                                                function saveData() {
                                                                    var button = document.getElementById("savebutton");
                                                                }
                                                                function saveUsers() {
                                                                    alert("User saved successfully!");
                                                                    $('#newUsersModal').modal('hide'); // Close the modal
                                                                }
//                                            function deactivateUsers() {
//                                                $('#deactivateUsersModal').modal('hide'); // Close the modal
//                                            }
//                                            function editUsers() {
//                                                alert("User saved successfully!");
//                                                $('#editUsersModal').modal('hide'); // Close the modal
//                                            }
                    </script>


                    <script>
                        $(document).ready(function () {
                            $(".xp-menubar").on('click', function () {
                                $('#sidebar').toggleClass('active');
                                $('#content').toggleClass('active');
                            });

                            $(".xp-menubar, .body-overlay").on('click', function () {
                                $('#sidebar, .body-overlay').toggleClass('show-nav');
                            });
                        });
                    </script>




                    </body>
                    </html>