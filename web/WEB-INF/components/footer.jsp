<%-- 
    Document   : footer
    Created on : 2023. 6. 6, 오전 1:26:42
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>


        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">



        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!--        Libraries Stylesheet -->  
        <link href="../css/bootstrap.min.css" rel="stylesheet">

        <style>
            body{
                 font-family: 'Open Sans', sans-serif;
                 font-size: 13px;
            }
        </style>
    </head>
    <body>
        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light py-5">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-4 col-md-6">
                        <h4 class="d-inline-block text-uppercase border-bottom border-5 border-secondary mb-4" style="color: #03A9F4;">Get In Touch</h4>
                        <p class="mb-4">Please feel free to contact us if you need any information.</p>
                        <p class="mb-2"><i class="fa fa-map-marker-alt  me-3" style="color: #03A9F4;"></i>1310 16Ave NW, Calgary</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3" style="color: #03A9F4;"></i>sunnyacupuncturist@gmail.com</p>
                        <p class="mb-0"><i class="fa fa-phone-alt  me-3" style="color: #03A9F4;"></i>+012 345 6789</p>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <h4 class="d-inline-block text-uppercase border-bottom border-5 border-secondary mb-4" style="color: #03A9F4;">Quick Links</h4>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-light mb-2" href="/${language}/home" ><i class="fa fa-angle-right me-2"></i>Home</a>
                            <a class="text-light mb-2" href="/${language}/aboutus"><i class="fa fa-angle-right me-2"></i>About Us</a>
                            <a class="text-light mb-2" href="/${language}/service1"><i class="fa fa-angle-right me-2"></i>Our Services</a>
                            <a class="text-light mb-2" href="/${language}/book"><i class="fa fa-angle-right me-2"></i>Book an appointment</a>
                            <a class="text-light" href="/${language}/contact"><i class="fa fa-angle-right me-2"></i>Contact Us</a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <h4 class="d-inline-block text-uppercase border-bottom border-5 border-secondary mb-4" style="color: #03A9F4;">Popular Links</h4>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-light mb-2" href="/${language}/home"><i class="fa fa-angle-right me-2"></i>Home</a>
                            <a class="text-light mb-2" href="/${language}/aboutus"><i class="fa fa-angle-right me-2"></i>About Us</a>
                            <a class="text-light mb-2" href="/${language}/service1"><i class="fa fa-angle-right me-2"></i>Our Services</a>
                            <a class="text-light mb-2" href="/${language}/book"><i class="fa fa-angle-right me-2"></i>Book an appointment</a>
                            <a class="text-light mb-2" href="/${language}/contact"><i class="fa fa-angle-right me-2"></i>Contact Us</a>
                            <a class="text-light mb-2" href="/downloadForm?formId=1&form=1&referer=${pageContext.request.requestURI}"><i class="fa fa-angle-right me-2"></i>Medical Form</a>
                            <a class="text-light" href="/downloadForm?formId=1&form=2&referer=${pageContext.request.requestURI}"><i class="fa fa-angle-right me-2"></i>Consent Form</a>
                        </div>
                    </div>
<!--                    <div class="col-lg-3 col-md-6">

                        <h6 class="text-uppercase mt-4 mb-3" style="color: #03A9F4;">Follow Us</h6>
                        <div class="d-flex">
                            <a class="btn btn-lg btn-lg-square rounded-circle me-2" href="" style="background-color: #03A9F4; color: white;"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-lg btn-lg-square rounded-circle me-2" href="" style="background-color: #03A9F4; color: white;"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-lg btn-lg-square rounded-circle me-2" href="" style="background-color: #03A9F4; color: white;"><i class="fab fa-linkedin-in"></i></a>
                            <a class="btn btn-lg btn-lg-square rounded-circle" href="" style="background-color: #03A9F4; color: white;"><i class="fab fa-youtube"></i></a>
                        </div>
                    </div>-->
                </div>
            </div>
        </div>
        <div class="container-fluid bg-dark text-light border-top border-secondary py-4">
            <div class="container">
                <div class="row g-5">
                    <div class="col-md-6 text-center text-md-start">
                        <p class="mb-md-0">&copy; <a class="" href="#" style="color: #03A9F4;">Tai Yang Clinic</a>. All Rights Reserved.</p>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>