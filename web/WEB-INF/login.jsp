<%-- 
    Document   : login
    Created on : 3-Jun-2023, 10:58:52 PM
    Author     : rladm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>

        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">



        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <!--        Libraries Stylesheet -->  
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/login.css">

    </head>
    <body>

        <!-- Topbar Start -->
        <div class ="container-fluid py-2 border-bottom d-none d-lg-block">
            <div class ="container">
                <div class ="row">

                    <div class="col-md-6 text-center text-lg-start mb-2 mb-lg-0">
                        <div class="d-inline-flex align-items-center">
                            <a class="text-decoration-none text-body px-2" href=""><i class="bi bi-telephone me-2"></i>+012 345 6789</a>
                            <span class="text-body">|</span>
                            <a class="text-decoration-none text-body px-2" href=""><i class="bi bi-envelope me-2"></i>Sunny@example.com</a>       
                            <span class="text-body">|</span>
                            <a class ="text-decoration-none text-body px-2" href=""><i class ="bi bi-house-door me-2"></i>1310 16Ave NW, Calgary, AB</a>       
                        </div>
                    </div>




                    <div class ="col-md-6 text-right text-lg-end">
                        <div class ="d-inline-flex align-items-center">
                            <a class ="text-decoration-none text-body px-3" href ="">
                                <i class ="bi bi-person-fill"></i>
                                Login<span class="text-body"> | </span>Register 
                            </a>
                            <a class ="text-body px-2" href ="">
                                <i class ="fab fa-facebook-f"></i></a>
                            <a class="text-body px-2" href="">
                                <i class="fab fa-twitter"></i></a>
                            <a class="text-body px-2" href="">
                                <i class="fab fa-linkedin-in"></i></a>
                            <a class="text-body px-2" href="">
                                <i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


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
                            <a href="" class="nav-item nav-link">About us</a>
                            <div class ="nav-item dropdown">
                                <a href ="#" class ="nav-link dropdown-toggle" data-bs-toggle="dropdown">Services</a>
                                <div class="dropdown-menu m-0">
                                    <a href="" class="dropdown-item">Accupuncture</a>
                                    <a href="" class="dropdown-item">Moxibustion</a>
                                    <a href="" class="dropdown-item">Massage/luiNa</a>
                                    <a href="" class="dropdown-item">Cupping</a>
                                    <a href="" class="dropdown-item">Herbal Medicine</a>
                                    <a href="" class="dropdown-item">Korean beauty</a>
                                </div>
                            </div>
                            <a href="/book" class="nav-item nav-link">Book</a>
                            <a href="" class="nav-item nav-link">Contact</a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>


        <div class ="main">
            <section class ="sign-in">
                <div class ="container1">
                    <div class ="signin-content">
                        <div class ="signin-image">
                            <figure>
                                <img src ="src/img/signin-image1.jpg" alt ="signin image">
                            </figure>
                            <h4>Don't have an account?</h4>
                            <a href ="/signIn"> Create an account</a>
                        </div>

                        <div class ="signin-form">
                            <h1>Welcome Back!</h1>
                            <form method ="post" class ="register-form" id="login-form">
                                <h2 class ="form-title">Login to your account</h2>
                                <div class ="form-group">
                                    <label for="email">
                                        <i class ="fa fa-envelope"></i>
                                    </label>
                                    <input type ="text" name="email" id="email" placeholder ="Email" required/>
                                </div>

                                <div class ="form-group">
                                    <label for ="password">
                                        <i class ="fa fa-lock"></i>
                                    </label>
                                    <input type ="password" name ="password" id ="password" placeholder ="Password" required/>
                                </div>

                                <!--                                <div class ="form-group">
                                                                    <input type ="checkbox" name ="remember-me" id="remember-me" class ="agree-term" />
                                                                    <label for ="remember-me" class="label-agree-term">
                                                                        <span><span>Remember me</span></span>
                                                                    </label>
                                                                </div>-->
                                <div class ="form-group">
                                    <a href="/forgotpassword" > Forgot password? </a>
                                </div>
                                <div class ="form-group form-button">
                                    <input type="hidden" name="action" value="login" />
                                    <input type ="submit" name ="submit" id="signin" 
                                           class ="form-submit" value ="Login" />              
                                </div>
                            </form>
                            <p>${message}</p>
                            </section>
                        </div>


                        <!-- Footer Start -->
                        <div class="container-fluid bg-dark text-light py-5">
                            <div class="container py-5">
                                <div class="row g-5">
                                    <div class="col-lg-3 col-md-6">
                                        <h4 class="d-inline-block text-primary text-uppercase border-bottom border-5 border-secondary mb-4">Get In Touch</h4>
                                        <p class="mb-4">Please feel free to contact us if you have any information.</p>
                                        <p class="mb-2"><i class="fa fa-map-marker-alt text-primary me-3"></i>1310 16Ave NW, Calgary</p>
                                        <p class="mb-2"><i class="fa fa-envelope text-primary me-3"></i>Sunny@example.com</p>
                                        <p class="mb-0"><i class="fa fa-phone-alt text-primary me-3"></i>+012 345 6789</p>
                                    </div>
                                    <div class="col-lg-3 col-md-6">
                                        <h4 class="d-inline-block text-primary text-uppercase border-bottom border-5 border-secondary mb-4">Quick Links</h4>
                                        <div class="d-flex flex-column justify-content-start">
                                            <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>Home</a>
                                            <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>About Us</a>
                                            <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>Our Services</a>
                                            <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>Book an appointment</a>
                                            <a class="text-light" href="#"><i class="fa fa-angle-right me-2"></i>Contact Us</a>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6">
                                        <h4 class="d-inline-block text-primary text-uppercase border-bottom border-5 border-secondary mb-4">Popular Links</h4>
                                        <div class="d-flex flex-column justify-content-start">
                                            <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>Home</a>
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


                        <script src="js/main.js"></script>
                         <script src="js/showMessage.js"></script>
        <script>
            $(document).ready(function () {
            <% if (session.getAttribute("passwordReset") != null && (boolean) session.getAttribute("passwordReset")) { %>
                // Call the showMessage function to display the pop-up message
                showMessage("Password successfully changed.");
            <% session.removeAttribute("passwordReset"); %> // Remove the flag from the session
            <% }%>
            });
        </script>

                        </body>
                        </html>