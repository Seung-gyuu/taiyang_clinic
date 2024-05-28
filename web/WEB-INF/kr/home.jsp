<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>
        <meta property="og:title" content="Tai Yang Clinic" />
        <meta property="og:description" content="Tai Yang can help you achieve health, balance, and the life you striving to live." />
        <meta property="og:image" content="../src/img/ClinicLogo.png" />
        <meta property="og:type" content="website" />
        <meta property="og:url" content="http://www.taiyangyyc.ca" />

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
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="../css/home.css">
        <c:import url="../components/headersKR.jsp" />


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
                        <h1 class="display-10 text-white mb-md-4 hero-header2_2">우리의 전통<br>중의학 센터를 방문하세요</h1>
                        <h5 class="text-white mb-md-4 ">건강, 균형 및 살려고 노력하는 삶을 달성하는 데 도움이 될 수 있습니다.</h5>
                        <div class="pt-2"> 
                            <a href="/${language}/book" class="btn btn-outline-light rounded-pill py-md-10 px-md-5 mx-2 font-weight-bold header_button">예약 페이지로 가기</a>
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
                            <img class="position-absolute w-100 h-100 rounded" src="../src/img/aboutus1.png" style="object-fit: cover;">
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="mb-4">
                            <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5 fw-bold mb-4 header1">About Us</h5>
                            <h2 class="mb-4 first_title">Best Medical Care For Yourself and Your Family</h2>
                        </div>
                        <p>Sunny는 1000시간의 관찰과 임상 사례 경험을 가진 등록 침술사입니다. 그녀는 알버타 침술과 중국 전통 의학 대학에서 훈련했고 알버타 침술 등록 시험 (AARE) 시험에서 성공적인 첫 번째 시도 후에 침술사 자격증을 받았습니다. 그녀의 전공은 부인과 침술, 한국 미용 침술, 얼굴 회춘 침술, 투이나 그리고 뜸입니다. Sunny는 침술 연구 및 치료의 발전에 대한 최신 정보를 얻기 위해 교육 컨퍼런스에 적극적으로 참석합니다. 한국어, 영어, 일본어를 유창하게 구사하는 그녀는 또한 캘거리에 있는 한국인과 일본인 사회에 상담과 생활 방식/다이어트 조언 서비스를 제공합니다.</p>

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
                            <h5 class="mb-3 fw-bold h4_1">침술</h5>
                            <p class="m-0">침술은 가늘고 긴 바늘 형태를 한 침을 정해진 혈자리에 일정한 굵기와 깊이로 찔러넣어 신체 내 기의 부조합 혹은 기의 침체를..</p>
                            <a class="btn btn-lg rounded-pill mb-2" href="/${language}/service1" style="background-color: #0B486B;color: white;">
                                <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="service-item bg-light rounded-circle d-flex flex-column align-items-center justify-content-center text-center">
                            <div class="service-icon mb-4 mt-2">
                                <i class="fa fa-2x fa-procedures text-black"></i>
                            </div>
                            <h5 class="mb-3 fw-bold h4_1">뜸</h5>
                            <p class="m-0">뜸은 약쑥을 비벼서 쌀알 크기로 빚은 다음 살 위의 혈에 놓고 불을 붙여 열기가 살 속으로 퍼지게 하는 한의학 요법입니다.</p>
                            <a class="btn btn-lg rounded-pill mb-2" href="/${language}/service2" style="background-color: #0B486B; color: white;">
                                <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="service-item bg-light rounded-circle d-flex flex-column align-items-center justify-content-center text-center">
                            <div class="service-icon mb-4 mt-2">
                                <i class="fa fa-2x fa-soli fa-spa text-black"></i>
                            </div>
                            <h5 class="mb-3 fw-bold h4_1">추나요법</h5>
                            <p class="m-0">추나요법은 한의사가 환자의 비틀어진 척추·관절을 밀고 당겨 신체의 틀어진 부분을 바로 잡고 통증을 개선하는 한방 치료법입니다.</p>
                            <a class="btn btn-lg rounded-pill mb-2" href="/${language}/service3" style="background-color: #0B486B; color: white;">
                                <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="service-item bg-light rounded-circle d-flex flex-column align-items-center justify-content-center text-center">
                            <div class="service-icon mb-4 mt-2">
                                <i class="fa fa-2x fa-soli fa-spa text-black"></i>
                            </div>
                            <h5 class="mb-3 fw-bold h4_1">괄사</h5>
                            <p class="m-0">괄사는 치료 부위에 괄사 기구를 반복적으로 긁어서 치료하는 요법으로써, 우리 나라 사람들이 뜸이나 부항에 익숙한 만큼이나 중국에..</p>
                            <a class="btn btn-lg rounded-pill mb-2" href="/${language}/service7" style="background-color: #0B486B; color: white;">
                                <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="service-item bg-light rounded-circle d-flex flex-column align-items-center justify-content-center text-center">
                            <div class="service-icon mb-4 mt-2">
                                <i class="fa fa-2x fa-solid fa-solid fa-hands text-black"></i>
                            </div>
                            <h5 class="mb-3 fw-bold h4_1">부항</h5>
                            <p class="m-0">부항은 흡입을 만들기 위해 환자의 피부에 몇 분간 특수 컵을 놓는 것을 포함하는 심층 조직 마사지의 일종입니다.</p>
                            <a class="btn btn-lg rounded-pill mb-2" href="/${language}/service4" style="background-color: #0B486B; color: white;">
                                <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 ">
                        <div class="service-item bg-light rounded-circle d-flex flex-column align-items-center justify-content-center text-center">
                            <div class="service-icon mb-4 mt-2">
                                <i class="fa fa-2x fa-ambulance text-black"></i>
                            </div>
                            <h5 class="mb-3 fw-bold h4_1">안면침</h5>
                            <p class="m-0"> 동안침이라 부르기도 하는 안면침은 치료와 미용을 목적으로 얼굴의 혈자리 및 근육 부위에 침을 시술하는 것입니다.</p>
                            <a class="btn btn-lg rounded-pill mb-2" href="/${language}/service6" style="background-color: #0B486B; color: white;">
                                <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 mx-auto">
                        <div class="service-item bg-light rounded-circle d-flex flex-column align-items-center justify-content-center text-center">
                            <div class="service-icon mb-4 mt-2">
                                <i class="fa fa-2x fa-solid fa-heart text-black"></i>
                            </div>
                            <h5 class="mb-3 fw-bold h4_1">한약 제조 및 처방</h5>
                            <p class="m-0"> 타이양 클리닉은 환자들이 전체적인 의료 여행을 할 수 있도록 처방전을 제공하고 약초 처방전을 판매합니다.</p>
                            <a class="btn btn-lg rounded-pill mb-2" href="/${language}/service5" style="background-color: #0B486B; color: white;">
                                <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mx-auto">
                        <div class="service-item bg-light rounded-circle d-flex flex-column align-items-center justify-content-center text-center">
                            <div class="service-icon mb-4 mt-2">
                                <i class="fa fa-2x fa-microscope text-black"></i>
                            </div>
                            <h5 class="mb-3 fw-bold h4_1">라이프스타일/식이요법 컨설팅</h5>
                            <p class="m-0">Tai Yang Clinic 은 영어, 한국어, 일본어로 생활습관 및 식이요법 컨설팅 서비스를 제공 하고 있습니다. </p>
                            <!--                        <a class="btn btn-lg btn-primary rounded-pill" href="/service6">
                                                        <i class="bi bi-arrow-right"></i>
                                                    </a>-->
                            <a class="btn btn-lg rounded-pill mb-2" href="/${language}/service8" style="background-color: #0B486B; color: white;">
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
                                    <img src="../src/img/patient2.png"
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
                                    <i class="fas fa-quote-left pe-2"></i>She has relieved all of my neck pain from labour and nursing as well as helped to balance my hormones + relieve stress as I was not getting much sleep! Her sessions are extremely relaxing, therapeutic and I feel like a million bucks when I leave. The effects of her treatments are also long lasting and she has custom designed my treatments to meet my specific needs.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4 mb-md-0">
                        <div class="card">
                            <div class="card-body py-4 mt-2">
                                <div class="d-flex justify-content-center mb-4">
                                    <img src="../src/img/patient1.png"
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
                                    <img src="../src/img/patient3.png"
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
                                    <i class="fas fa-quote-left pe-2"></i>I have suffered from a weak bladder ever since my son was born. After only 2 treatments with acupuncture, I have had no 'whoopsies', sneezed 3 times in a row without ramifications, and then jumped for joy (and was still dry)! I’m scared to get overexcited as I assumed that I would have this issue for the rest of my life, but I sure am hopeful!
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
            <jsp:include page="../components/footerKR.jsp" />
        </footer>

    </body>
</html>