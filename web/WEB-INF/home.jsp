<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>

        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">
        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">



        <!--        Libraries Stylesheet -->  
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!--        <link rel="stylesheet" type="text/css" href="css/home.css">-->
        <c:import url="./components/headers.jsp" />

        <style>


            .hero-header{
                background-image: url('../src/img/massage1.jpg');
                position: relative;
                background-size: cover;
                background-position: center;

            }

            .hero-header:before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: linear-gradient(
                    180deg,
                    rgba(0, 0, 0, 0.2) 0%,
                    rgba(0, 0, 0, 0.6) 100%
                    ),
                    linear-gradient(180deg, rgba(0, 0, 0, 0.2) 0%, transparent 100%);
                z-index: 1;
            }

            .hero-header img {
                height: 550px;
                width: 100vw;
                object-fit: cover;
                margin-top: -100px;
                position: relative;     
            }

            .header1{
                font-family: 'Open Sans', sans-serif;
            }

            .hero-header2{
                z-index: 50;    
            }

            p {
                font-family: 'Open Sans', sans-serif;
                font-weight: lighter;
            }

            .first_title, .second_title, .third_title, .hero-header2_2, .h4_1 {
                font-family: 'Cinzel', serif;
            }

            .service-item .btn {
                padding: 0.4rem 1rem;
                font-size: 14px;
                margin-top: 20px;
            }
/*#6dbced*/
/*            .service-icon .fa-user-md {
                color: #0B486B;
            }*/


        </style>
    </head>
    <body>
        <!-- Hero Start -->

        <div class="container-fluid py-5 mb-5 hero-header"  >
            <div class="container py-5">
                <div class="row justify-content-start">

                    <div class="col-lg-8 text-center text-lg-start hero-header2">

                        <h5 class="d-inline-block text-white text-uppercase border-bottom border-5" style="border-color: rgba(256, 256, 256, .3) !important;">THE HOME OF HEALTH</h5>
                        <h1 class="display-10 text-white mb-md-4 hero-header2_2">VISIT OUR TRADITIONAL<br>CHINESE MEDICINE CENTER</h1>
                        <h5 class="text-white mb-md-4 ">Can help you achieve health, balance, and the life you striving to live.</h5>
                        <div class="pt-2"> 
                            <a href="/book" class="btn btn-outline-light rounded-pill py-md-10 px-md-5 mx-2 font-weight-bold header_button">Book an appointment</a>
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
                            <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5 fw-bold mb-4 header1">About Us</h5>
                            <h2 class="mb-4 first_title">Best Medical Care For Yourself and Your Family</h2>
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
                    <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5 fw-bold mb-4 header1">Services</h5>
                    <h2 class="mb-4 second_title">Best Clinic Services</h2>
                </div>
                <div class="row g-5">
                    <div class="col-lg-4 col-md-6">
                        <div class="service-item bg-light rounded-circle d-flex flex-column align-items-center justify-content-center text-center">
                            <div class="service-icon mb-4 mt-2">
                                <i class="fa fa-2x fa-user-md"></i>
                            </div>
                            <h5 class="mb-3 fw-bold h4_1">Acupuncture</h5>
                            <p class="m-0">Acupuncture is a procedure that uses tiny needles inserted into the skin to help balance a person’s energy.</p>
                            <a class="btn btn-lg rounded-pill mb-2" href="/service1" style="background-color: #0B486B;color: white;">
                                <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="service-item bg-light rounded-circle d-flex flex-column align-items-center justify-content-center text-center">
                            <div class="service-icon mb-4 mt-2">
                                <i class="fa fa-2x fa-procedures text-black"></i>
                            </div>
                            <h5 class="mb-3 fw-bold h4_1">Moxibustion</h5>
                            <p class="m-0">Moxibustion is a form of therapy that entails the burning of mugwort leaves.  This is a small, spongy herb.. </p>
                            <a class="btn btn-lg rounded-pill mb-2" href="/service2" style="background-color: #0B486B; color: white;">
                                <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="service-item bg-light rounded-circle d-flex flex-column align-items-center justify-content-center text-center">
                            <div class="service-icon mb-4 mt-2">
                                <i class="fa fa-2x fa-soli fa-spa text-black"></i>
                            </div>
                            <h5 class="mb-3 fw-bold h4_1">TuiNa Massage</h5>
                            <p class="m-0">Tuina practitioners use a combination of hand and arm techniques to massage and realign the recipient's muscles..</p>
                            <a class="btn btn-lg rounded-pill mb-2" href="/service3" style="background-color: #0B486B; color: white;">
                                <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 ">
                        <div class="service-item bg-light rounded-circle d-flex flex-column align-items-center justify-content-center text-center">
                            <div class="service-icon mb-4 mt-2">
                                <i class="fa fa-2x fa-ambulance text-black"></i>
                            </div>
                            <h5 class="mb-3 fw-bold h4_1">Korean beauty</h5>
                            <p class="m-0"> Korean beauty treatments are a booming market, globally. Consumers who switch to Korean beauty products tend..</p>
                            <a class="btn btn-lg rounded-pill mb-2" href="/service4" style="background-color: #0B486B; color: white;">
                                <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="service-item bg-light rounded-circle d-flex flex-column align-items-center justify-content-center text-center">
                            <div class="service-icon mb-4 mt-2">
                                <i class="fa fa-2x fa-solid fa-heart text-black"></i>
                            </div>
                            <h5 class="mb-3 fw-bold h4_1">Herbal Formula Prescription </h5>
                            <p class="m-0"> Herbal formulations means a dosage form consisting of one or more herbs or processed herbs in specified quantities to..</p>
                            <a class="btn btn-lg rounded-pill mb-2" href="/service5" style="background-color: #0B486B; color: white;">
                                <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="service-item bg-light rounded-circle d-flex flex-column align-items-center justify-content-center text-center">
                            <div class="service-icon mb-4 mt-2">
                                <i class="fa fa-2x fa-microscope text-black"></i>
                            </div>
                            <h5 class="mb-2 fw-bold h4_1">Lifestyle and Diet therapy</h5>
                            <p class="m-0">A therapeutic diet is a meal plan that controls the intake of certain foods or nutrients. It is part of the treatment of..</p>
                            <!--                        <a class="btn btn-lg btn-primary rounded-pill" href="/service6">
                                                        <i class="bi bi-arrow-right"></i>
                                                    </a>-->
                            <a class="btn btn-lg rounded-pill mb-2" href="/service6" style="background-color: #0B486B; color: white;">
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
                        <h3 class="fw-bold mb-4 third_title">Testimonials</h3>
                        <p class="mb-4 pb-2 mb-md-5 pb-md-0 header1">
                            Check out the reviews and find out why many people choose our clinic.
                        </p>
                    </div>
                </div>

                <div class="row text-center header1">
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



        <!--<script src="js/bootstrap.bundle.min.js"></script>-->
        <footer>
            <jsp:include page="./components/footer.jsp" />
        </footer>

    </body>
</html>