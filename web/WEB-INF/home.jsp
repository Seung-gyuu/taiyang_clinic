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
        <link href="https://www.flaticon.com/kr/free-icons/" title="스마일 아이콘"></a>


    <!--        Libraries Stylesheet -->  
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/home.css">
    <c:import url="./components/headers.jsp" />


</head>
<body>
    <!-- Hero Start -->

    <div class="container-fluid bg-dark py-5 mb-5 hero-header">
        <div class="container py-5">
            <div class="row justify-content-start">

                <div class="col-lg-8 text-center text-lg-start">

                    <h5 class="d-inline-block text-white text-uppercase border-bottom border-5 " style="border-color: rgba(256, 256, 256, .3) !important;">THE HOME OF HEALTH</h5>
                    <h1 class="display-10 text-white mb-md-4">Visit our centre and we will show you how traditional Chinese Medicine can help you achieve health, balance, and the life you striving to live.</h1>
                    <div class="pt-2"> 
                        <a href="/book" class="btn btn-outline-light rounded-pill py-md-10 px-md-5 mx-2">Book an appointment</a>
                    </div>
                </div>
            </div>
        </div>
    </div>




    <!-- About Start -->
    <div class="container-fluid py-5">
        <div class="container">
            <div class="row gx-5">
                <div class="col-lg-5 mb-5 mb-lg-0" style="min-height: 500px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute w-100 h-100 rounded" src="src/img/aboutus1.png" style="object-fit: cover;">
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="mb-4">
                        <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5 fw-bold mb-4">About Us</h5>
                        <h1 class="mb-4">Best Medical Care For Yourself and Your Family</h1>
                    </div>
                    <p>Sunny Gym holds a Diploma in Chinese Medicine and Acupuncture from the Calgary University of Traditional Chinese Medicine and Acupuncture. Her undergraduate studies were done, where she studied Business Administration in the Bissett School of Business.

                        A strong passion for improving the health of others through the use of Traditional Chinese Medicine (TCM) and acupuncture, motivates her to apply her vast knowledge of TCM to the health and wellness community.

                        She is a Board Licensed Acupuncturist across Canada, and registered with the College of Acupuncturists of Alberta (CAA). Certified in Acutonics and NADA protocol, as well as a Certified Yoga Instructor.[I just copy from other website, should change it]</p>

                </div>
            </div>
        </div>
    </div>
    <!-- About End -->

    <!-- Services Start -->
    <div class="container-fluid py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5" style="max-width: 500px;">
                <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5 fw-bold mb-4">Services</h5>
                <h1 class="mb-4">Best Clinic Services</h1>
            </div>
            <div class="row g-5">
                <div class="col-lg-4 col-md-6">
                    <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
                        <div class="service-icon mb-4">
                            <i class="fa fa-2x fa-user-md text-black"></i>
                        </div>
                        <h4 class="mb-3 fw-bold ">Acupuncture</h4>
                        <p class="m-0">Text still needs to be filled. Not too long, but just one line.</p>
                        <a class="btn btn-lg rounded-pill" href="/service1" style="background-color: #03A9F4; color: white;">
                            <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
                        <div class="service-icon mb-4">
                            <i class="fa fa-2x fa-procedures text-black"></i>
                        </div>
                        <h4 class="mb-3 fw-bold">Moxibustion</h4>
                        <p class="m-0">Text still needs to be filled. Not too long, but just one line.</p>
                        <a class="btn btn-lg rounded-pill" href="/service2" style="background-color: #03A9F4; color: white;">
                            <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
                        <div class="service-icon mb-4">
                            <i class="fa fa-2x fa-soli fa-spa text-black"></i>
                        </div>
                        <h4 class="mb-3 fw-bold">TuiNa Massage</h4>
                        <p class="m-0">Text still needs to be filled. Not too long, but just one line.</p>
                        <a class="btn btn-lg rounded-pill" href="/service3" style="background-color: #03A9F4; color: white;">
                            <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
                        <div class="service-icon mb-4">
                            <i class="fa fa-2x fa-ambulance text-black"></i>
                        </div>
                        <h4 class="mb-3 fw-bold">Korean beauty</h4>
                        <p class="m-0">Text still needs to be filled. Not too long, but just one line.</p>
                        <a class="btn btn-lg rounded-pill" href="/service4" style="background-color: #03A9F4; color: white;">
                            <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
                        <div class="service-icon mb-4">
                            <i class="fa fa-2x fa-solid fa-heart text-black"></i>
                        </div>
                        <h4 class="mb-3 fw-bold">Herbal Formula Prescription </h4>
                        <p class="m-0">Text still needs to be filled. Not too long, but just one line.</p>
                        <a class="btn btn-lg rounded-pill" href="/service5" style="background-color: #03A9F4; color: white;">
                            <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="service-item bg-light rounded d-flex flex-column align-items-center justify-content-center text-center">
                        <div class="service-icon mb-4">
                            <i class="fa fa-2x fa-microscope text-black"></i>
                        </div>
                        <h4 class="mb-2 fw-bold">Lifestyle and Diet therapy</h4>
                        <p class="m-0">Text still needs to be filled. Not too long, but just one line.</p>
                        <!--                        <a class="btn btn-lg btn-primary rounded-pill" href="/service6">
                                                    <i class="bi bi-arrow-right"></i>
                                                </a>-->
                        <a class="btn btn-lg rounded-pill" href="/service6" style="background-color: #03A9F4; color: white;">
                            <i class="bi bi-arrow-right"></i>
                        </a>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Services End -->
    <!-- Testimonial Start -->
    <section style="color: #000; background-color: #f3f2f2;">
        <div class="container py-5">
            <div class="row d-flex justify-content-center">
                <div class="col-md-10 col-xl-8fw-bold mb-4 text-center">
                    <h3 class="fw-bold mb-4">Testimonials</h3>
                    <p class="mb-4 pb-2 mb-md-5 pb-md-0">
                        Check out the reviews and find out why many people choose our clinic.
                    </p>
                </div>
            </div>

            <div class="row text-center">
                <div class="col-md-4 mb-4 mb-md-0">
                    <div class="card">
                        <div class="card-body py-4 mt-2">
                            <div class="d-flex justify-content-center mb-4">
                                <img src="src/img/patient2.png"
                                     class="rounded-circle shadow-1-strong" width="100" height="100" />
                            </div>

                            <h5 class="font-weight-bold">Patient1</h5>
                            <ul class="list-unstyled d-flex justify-content-center">
                                <li>
                                    <i class="fas fa-star fa-sm text-info"></i>
                                </li>
                                <li>
                                    <i class="fas fa-star fa-sm text-info"></i>
                                </li>
                                <li>
                                    <i class="fas fa-star fa-sm text-info"></i>
                                </li>
                                <li>
                                    <i class="fas fa-star fa-sm text-info"></i>
                                </li>
                                <li>
                                    <i class="fas fa-star-half-alt fa-sm text-info"></i>
                                </li>
                            </ul>
                            <p class="mb-2">
                                <i class="fas fa-quote-left pe-2"></i>Both my wife and I have been using Sunny's services for a couple of years now. Acupuncture has been the only thing that gives either of us any long term relief from on going back pain. In one session she is able to accomplish what would take weeks of physical therapy and medication. I highly recommend that anyone with back pain give her a call. 
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4 mb-md-0">
                    <div class="card">
                        <div class="card-body py-4 mt-2">
                            <div class="d-flex justify-content-center mb-4">
                                <img src="src/img/patient1.png"
                                     class="rounded-circle shadow-1-strong" width="100" height="100" />
                            </div>
                            <h5 class="font-weight-bold">Patient2</h5>
                            <ul class="list-unstyled d-flex justify-content-center">
                                <li>
                                    <i class="fas fa-star fa-sm text-info"></i>
                                </li>
                                <li>
                                    <i class="fas fa-star fa-sm text-info"></i>
                                </li>
                                <li>
                                    <i class="fas fa-star fa-sm text-info"></i>
                                </li>
                                <li>
                                    <i class="fas fa-star fa-sm text-info"></i>
                                </li>
                                <li>
                                    <i class="fas fa-star fa-sm text-info"></i>
                                </li>
                            </ul>
                            <p class="mb-2">
                                <i class="fas fa-quote-left pe-2"></i>Both my wife and I have been using Sunny's services for a couple of years now. Acupuncture has been the only thing that gives either of us any long term relief from on going back pain. In one session she is able to accomplish what would take weeks of physical therapy and medication. I highly recommend that anyone with back pain give her a call. 
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-0">
                    <div class="card">
                        <div class="card-body py-4 mt-2">
                            <div class="d-flex justify-content-center mb-4">
                                <img src="src/img/patient3.png"
                                     class="rounded-circle shadow-1-strong" width="100" height="100" />
                            </div>
                            <h5 class="font-weight-bold">Patient3</h5>
                            <ul class="list-unstyled d-flex justify-content-center">
                                <li>
                                    <i class="fas fa-star fa-sm text-info"></i>
                                </li>
                                <li>
                                    <i class="fas fa-star fa-sm text-info"></i>
                                </li>
                                <li>
                                    <i class="fas fa-star fa-sm text-info"></i>
                                </li>
                                <li>
                                    <i class="fas fa-star fa-sm text-info"></i>
                                </li>
                                <li>
                                    <i class="far fa-star fa-sm text-info"></i>
                                </li>
                            </ul>
                            <p class="mb-2">
                                <i class="fas fa-quote-left pe-2"></i>Both my wife and I have been using Sunny's services for a couple of years now. Acupuncture has been the only thing that gives either of us any long term relief from on going back pain. In one session she is able to accomplish what would take weeks of physical therapy and medication. I highly recommend that anyone with back pain give her a call. 
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonial End -->

    <!-- Footer Start -->
    <!--    <div class="container-fluid bg-dark text-light mt-5 py-5">
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
                            <a class="text-light mb-2" href="AboutUs"><i class="fa fa-angle-right me-2"></i>About Us</a>
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
        </div>-->



    <!--<script src="js/bootstrap.bundle.min.js"></script>-->
    <footer>
        <jsp:include page="./components/footer.jsp" />
    </footer>

</body>
</html>