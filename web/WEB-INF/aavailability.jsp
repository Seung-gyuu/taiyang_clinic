<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>

        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">
    <p style ="background-image:url('src/img/main.png');">



        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!--        Libraries Stylesheet -->  
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/admin1.css">
        <script src="js/availability.js"></script>


    </head>
<body>



    <!--Navbar Start -->
    <div class="container-fluid sticky-top bg-white shadow-sm">
        <div class ="container">
            <nav class="navbar navbar-expand-lg bg-white navbar-light py-3 py-lg-0">
                <a href ="/home" class ="navbar-brand">
                    <h1 class="m-0 text-uppercase text-primary"><i class ="fa fa-clinic-medical me-2"></i>

                        Tai Yang Clinic</h1>
                </a>
                <button class ="navbar-toggler" type ="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class ="collapse navbar-collapse" id ="navbarCollapse">
                    <div class="navbar-nav text-right ms-auto py-0">
                        <a href="/home" class="nav-item nav-link active">Home</a>
                        <a href="" class="nav-item nav-link">Logout</a>
                    </div>
                </div>
            </nav>
        </div>
    </div>

    <!--sidevar-->
    <div class="container-fluid">
        <div class="row">

            <div class="col-md-3 text-dark py-5" style="background-color: #f3f2f2;">
                <h3 class="text-center mt-3 mb-4">Admin Menu</h3>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="#">Users</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="#">Availability</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="#">Add Consent or Medical Form</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="#">View Forms</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="#">View Appointments</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="#">Reports</a>
                    </li>
                </ul>
            </div>
            <!--end sidevar-->

            <div class="col-md-9">

                <div class="container py-5">
                    <div class="row mb-3">
                        <div class="col-md-10">
                            <h2>Admin Panel - Availability Time</h2>
                            <div class="container">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Month/Date/Year</th>
                                            <th>View Times</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>January 1, 2023</td>
                                            <td><a href="#" onclick="showTimes('January', 1, 2023)">View Times</a></td>
                                        </tr>
                                        <tr>
                                            <td>January 2, 2023</td>
                                            <td><a href="#" onclick="showTimes('January', 2, 2023)">View Times</a></td>
                                        </tr>
                                        <tr>
                                            <td>January 3, 2023</td>
                                            <td><a href="#" onclick="showTimes('January', 3, 2023)">View Times</a></td>
                                        </tr>
                                        <tr>
                                            <td>January 4, 2023</td>
                                            <td><a href="#" onclick="showTimes('January', 4, 2023)">View Times</a></td>
                                        </tr>
                                        <tr>
                                            <td>January 5, 2023</td>
                                            <td><a href="#" onclick="showTimes('January', 5, 2023)">View Times</a></td>
                                        </tr>
                                        <tr>
                                            <td>January 6, 2023</td>
                                            <td><a href="#" onclick="showTimes('January', 6, 2023)">View Times</a></td>
                                        </tr>
                                        <tr>
                                            <td>January 7, 2023</td>
                                            <td><a href="#" onclick="showTimes('January', 7, 2023)">View Times</a></td>
                                        </tr>
                                        <tr>
                                            <td>January 8, 2023</td>
                                            <td><a href="#" onclick="showTimes('January', 8, 2023)">View Times</a></td>
                                        </tr>
                                        <tr>
                                            <td>January 9, 2023</td>
                                            <td><a href="#" onclick="showTimes('January', 9, 2023)">View Times</a></td>
                                        </tr>
                                        <tr>
                                            <td>January 10, 2023</td>
                                            <td><a href="#" onclick="showTimes('January', 10, 2023)">View Times</a></td>
                                        </tr>
                                    </tbody>
                                </table>

                                <div id="timeSlots" style="display: none;">
                                    <h3>Available Time Slots</h3>
                                    <h4><span id="selectedDate"></h4></span>
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Time</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="timeSlotsBody">
                                            <tr>
                                                <td>9:00 AM - 10:00 AM</td>
                                                <td>Unbooked</td>
                                                <td><button class="btn btn-danger" onclick="deleteTime('9:00 AM')">Delete</button></td>
                                            </tr>
                                            <tr>
                                                <td>10:00 AM - 11:00 AM</td>
                                                <td>Booked</td>
                                                <td><button class="btn btn-danger" onclick="deleteTime('10:00 AM')">Delete</button></td>
                                            </tr>
                                            <tr>
                                                <td>11:00 AM - 12:00 PM</td>
                                                <td>Booked</td>
                                                <td><button class="btn btn-danger" onclick="deleteTime('11:00 AM')">Delete</button></td>
                                            </tr>
                                            <tr>
                                                <td>12:00 PM - 1:00 PM</td>
                                                <td>Booked</td>
                                                <td><button class="btn btn-danger" onclick="deleteTime('12:00 PM')">Delete</button></td>
                                            </tr>
                                            <tr>
                                                <td>1:00 PM - 2:00 PM</td>
                                                <td>Booked</td>
                                                <td><button class="btn btn-danger" onclick="deleteTime('1:00 PM')">Delete</button></td>
                                            </tr>
                                            <tr>
                                                <td>2:00 PM - 3:00 PM</td>
                                                <td>Booked</td>
                                                <td><button class="btn btn-danger" onclick="deleteTime('2:00 PM')">Delete</button></td>
                                            </tr>
                                            <tr>
                                                <td>3:00 PM - 4:00 PM</td>
                                                <td>Booked</td>
                                                <td><button class="btn btn-danger" onclick="deleteTime('3:00 PM')">Delete</button></td>
                                            </tr>
                                            <tr>
                                                <td>4:00 PM - 5:00 PM</td>
                                                <td>Booked</td>
                                                <td><button class="btn btn-danger" onclick="deleteTime('4:00 PM')">Delete</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <button class="btn btn-primary" onclick="addTime()">Add Time</button>
                                </div>

                                <div id="addTimeForm" style="display: none;">
                                    <h3>Add New Time Slot</h3>
                                    <form id="timeForm" onsubmit="submitTimeForm(event)">
                                        <div class="mb-3">
                                            <label for="startTimeInput" class="form-label">Start Time</label>
                                            <input type="text" class="form-control" id="startTimeInput" placeholder="Enter start time" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="endTimeInput" class="form-label">End Time</label>
                                            <input type="text" class="form-control" id="endTimeInput" placeholder="Enter end time" required>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Add</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Footer Start -->
            <div class="container-fluid bg-dark text-light  py-5">
                <div class="container py-5">
                    <div class="row g-5">
                        <div class="col-lg-3 col-md-6">
                            <h4 class="d-inline-block text-primary text-uppercase border-bottom border-5 border-secondary mb-4">Get In Touch</h4>
                            <p class="mb-4">Please feel free to contact us if you need any information.</p>
                            <p class="mb-2"><i class="fa fa-map-marker-alt text-primary me-3"></i>1310 16Ave NW, Calgary</p>
                            <p class="mb-2"><i class="fa fa-envelope text-primary me-3"></i>Sunny@example.com</p>
                            <p class="mb-0"><i class="fa fa-phone-alt text-primary me-3"></i>+012 345 6789</p>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <h4 class="d-inline-block text-primary text-uppercase border-bottom border-5 border-secondary mb-4">Quick Links</h4>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-light mb-2" href="/home"><i class="fa fa-angle-right me-2"></i>Home</a>
                                <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>About Us</a>
                                <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>Our Services</a>
                                <a class="text-light mb-2" href="/book"><i class="fa fa-angle-right me-2"></i>Book an appointment</a>
                                <a class="text-light" href="#"><i class="fa fa-angle-right me-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <h4 class="d-inline-block text-primary text-uppercase border-bottom border-5 border-secondary mb-4">Popular Links</h4>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-light mb-2" href="/home"><i class="fa fa-angle-right me-2"></i>Home</a>
                                <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>About Us</a>
                                <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>Our Services</a>
                                <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>Book an appointment</a>
                                <a class="text-light" href="#"><i class="fa fa-angle-right me-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">

                            <h6 class="text-primary text-uppercase mt-4 mb-3">Follow Us</h6>
                            <div class="d-flex">
                                <a class="btn btn-lg btn-primary btn-lg-square rounded-circle me-2" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-lg btn-primary btn-lg-square rounded-circle me-2" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-lg btn-primary btn-lg-square rounded-circle me-2" href=""><i class="fab fa-linkedin-in"></i></a>
                                <a class="btn btn-lg btn-primary btn-lg-square rounded-circle" href=""><i class="fab fa-youtube"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid bg-dark text-light border-top border-secondary py-4">
                <div class="container">
                    <div class="row g-5">
                        <div class="col-md-6 text-center text-md-start">
                            <p class="mb-md-0">&copy; <a class="text-primary" href="#">Tai Yang Clinic</a>. All Rights Reserved.</p>

                        </div>
                    </div>
                </div>
            </div>



            <script src="js/bootstrap.bundle.min.js"></script>
            </body>
            </html>