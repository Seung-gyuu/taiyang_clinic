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

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/admin.css">

        <!--google fonts -->

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

        <!--google material icon-->
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons"rel="stylesheet">

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
                            <span>Todays</span></a>
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
                                <a href="/home" class="btn btn-primary me-2">Home</a>
                                <a href="" class="btn btn-danger me-2">Logout</a>
                            </div>
                        </div> 
                    </div>
                    <div class="xp-breadcrumbbar text-center">
                        <h4 class="page-title">Dashboard</h4>               
                    </div>
                </div>


                <!--------main-content------------->
                <div class="my-4"></div>



                <div class="main-content">
                    <div class="row">

                        <div class="col-md-12">
                            <div class="table-wrapper">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-sm-6 p-0 d-flex justify-content-lg-start justify-content-center">
                                            <h2 class="ml-lg-2">Upcoming Booking</h2>
                                        </div>
                                    </div>
                                </div>
                                <h4 class="text-center mb-2" style="font-size: 1.2em;">June 14, 2023</h4>

                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Start Time</th>
                                            <th>End Time</th>
                                            <th>Name</th>
                                            <th>Service</th>
                                            <th>Describe</th>
                                            <th>Form</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>9:00 AM</td>
                                            <td>10:00 AM</td>
                                            <td>Euna Kim</td>
                                            <td>herbal Medicine</td>
                                            <td>Regular Checkup</td>
                                            <td>
                                                <a href="" class="" data-toggle="modal">
                                                    <i class="material-icons" data-toggle="tooltip" title="">&#xf1c4;</i></a>
                                                <a href="" class="" data-toggle="modal">
                                                    <i class="material-icons" data-toggle="tooltip" title="">&#xf1c3;</i></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>10:00 AM</td>
                                            <td>11:00 AM</td>
                                            <td>John Doe</td>
                                            <td>Accupuncture</td>
                                            <td>Regular Checkup</td>
                                            <td>
                                                <a href="" class="" data-toggle="modal">
                                                    <i class="material-icons" data-toggle="tooltip" title="">&#xf1c4;</i></a>
                                                <a href="" class="" data-toggle="modal">
                                                    <i class="material-icons" data-toggle="tooltip" title="">&#xf1c3;</i></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>11:00 AM</td>
                                            <td>12:00 PM</td>
                                            <td>Jane Smith</td>
                                            <td>Message/luiNa</td>
                                            <td>Skin Allergy</td>
                                            <td>
                                                <a href="" class="" data-toggle="modal">
                                                    <i class="material-icons" data-toggle="tooltip" title="">&#xf1c4;</i></a>
                                                <a href="" class="" data-toggle="modal">
                                                    <i class="material-icons" data-toggle="tooltip" title="">&#xf1c3;</i></a>
                                            </td>
                                        </tr> 
                                    </tbody>
                                </table>
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
    </body>
</html>
