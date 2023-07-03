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

        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/viewappointment.css">
        <script src="../js/availability.js"></script>

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
                            <span>Dashboard</span></a>
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
                            <a href="" data-toggle="collapse" aria-expanded="false" 
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
                                                <div class="d-flex">
                                                    <a href="" class="btn btn-primary mr-2" id="prevBtn">
                                                        <i class="material-icons">&#xE5C4;</i> 
                                                    </a>
                                                    <a href="" class="btn btn-primary" id="nextBtn">
                                                        <i class="material-icons">&#xE5C8;</i> 
                                                    </a>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                    <h4 class="text-center mb-2" style="font-size: 1.2em;">June 12, 2023 - June 16, 2023</h4>

                                    <table class="table table-striped table-hover text-center">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>MONDAY, 12th</th>
                                                <th>TUESDAY, 13th</th>
                                                <th>WEDNESDAY, 14th</th>
                                                <th>THURSDAY, 15th</th>
                                                <th>FRIDAY, 16th</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>9:00AM</td>
                                                <td><a href="#" class="unbooked">Unbooked</a></td>
                                                <td><a href="#" class="booked" data-bs-toggle="modal" data-bs-target="#viewAppointmentModal">Booked</a></td>
                                                <td><a href="#" class="booked" data-bs-toggle="modal" data-bs-target="#viewAppointmentModal">Booked</a></td>
                                                <td><a href="#" class="booked" data-bs-toggle="modal" data-bs-target="#viewAppointmentModal">Booked</a></td>
                                                <td><a href="#" class="unbooked">Unbooked</a></td>

                                            </tr>
                                            <tr>
                                                <td>10:00AM</td>
                                                <td><a href="#" class="unbooked">Unbooked</a></td>
                                                <td><a href="#" class="booked">Booked</a></td>
                                                <td><a href="#" class="unbooked">Unbooked</a></td>
                                                <td><a href="#" class="booked">Booked</a></td>
                                                <td><a href="#" class="booked">Booked</a></td>

                                            </tr>
                                            <tr>
                                                <td>11:00AM</td>
                                                <td><a href="#" class="unbooked">Unbooked</a></td>
                                                <td><a href="#" class="unbooked">Unbooked</a></td>
                                                <td><a href="#" class="booked">Booked</a></td>
                                                <td><a href="#" class="booked">Booked</a></td>
                                                <td><a href="#" class="unbooked">Unbooked</a></td>
                                            </tr>
                                            <tr>
                                                <td>12:00PM</td>
                                                <td><a href="#" class="booked">Booked</a></td>
                                                <td><a href="#" class="booked">Booked</a></td>
                                                <td><a href="#" class="booked">Booked</a></td>
                                                <td><a href="#" class="unbooked">Unbooked</a></td>
                                                <td><a href="#" class="unbooked">Unbooked</a></td>
                                            </tr>
                                            <tr>
                                                <td>1:00PM</td>
                                                <td><a href="aform" class="unbooked">Unbooked</a></td>
                                                <td><a href="aform" class="booked">Booked</a></td>
                                                <td><a href="#" class="booked">Booked</a></td>
                                                <td><a href="#" class="unbooked">Unbooked</a></td>
                                                <td><a href="#" class="booked">Booked</a></td>
                                            </tr>
                                            <tr>
                                                <td>2:00PM</td>
                                                <td><a href="#" class="unbooked">Unbooked</a></td>
                                                <td><a href="#" class="booked">Booked</a></td>
                                                <td><a href="#" class="unbooked">Unbooked</a></td>
                                                <td><a href="#" class="booked">Booked</a></td>
                                                <td><a href="#" class="booked">Booked</a></td>
                                            </tr>
                                            <tr>
                                                <td>3:00PM</td>
                                                <td><a href="#" class="booked">Booked</a></td>
                                                <td><a href="#" class="booked">Booked</a></td>
                                                <td><a href="#" class="unbooked">Unbooked</a></td>
                                                <td><a href="#" class="unbooked">Unbooked</a></td>
                                                <td><a href="#" class="unbooked">Unbooked</a></td>
                                            </tr>
                                            <tr>
                                                <td>4:00PM</td>
                                                <td><a href="#" class="booked">Booked</a></td>
                                                <td><a href="#" class="booked">Booked</a></td>
                                                <td><a href="#" class="booked">Booked</a></td>
                                                <td><a href="#" class="booked">Booked</a></td>
                                                <td><a href="#" class="unbooked">Unbooked</a></td>
                                            </tr>

                                        </tbody>
                                    </table>



                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="viewAppointmentModal" tabindex="-1" aria-labelledby="viewAppointmentmodalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="viewAppointmentmodalLabel">Patient Info</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">

                                    <label for="description">Start Time: 9:00 AM</label><br>
                                    <label for="description">End Time: 10:00 AM</label><br>
                                    <label for="description">Name: Euna Kim</label><br>
                                    <label for="description">Service: herbal Medicine</label><br>
                                    <label for="description">Describe: Regular Checkup</label><br>
                                    <label for="description"> Form: <a href="" class="" data-toggle="modal">
                                            <i class="material-icons" data-toggle="tooltip" title="">&#xf1c4;</i></a>
                                        <a href="" class="" data-toggle="modal">
                                            <i class="material-icons" data-toggle="tooltip" title="">&#xf1c3;</i></a></label>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

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




            <script src="../js/bootstrap.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    </body>
</html>