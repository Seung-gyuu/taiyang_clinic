<%-- 
    Document   : accupuncture
    Created on : 2023. 6. 20, 오전 12:13:19
    Author     : User
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
        <script src="https://kit.fontawesome.com/b0274adb94.js" crossorigin="anonymous"></script>
    <p style ="background-image:url('../src/img/main.png');">



        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://www.flaticon.com/kr/free-icons/" title="스마일 아이콘"></a>


    <!--        Libraries Stylesheet -->  
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/services.css">
    <link rel="stylesheet" type="text/css" href="../css/global.css">


    <c:import url="../components/headersKR.jsp" />


</head>
<body>
    <!--<div class="gloabal_container">-->
    <!-- Services -->
    <div class="services_container">
        <div class="services_top_section">   
            <div class="servicesBg">
                <img src="../src/img/acupunctureBg.jpg" alt="" />
            </div>           
            <div class ="services_top_wrap">
                <p>Services</p>
                <h1>침술</h1>
                <button onclick="window.location.href='/${language}/book'">예약하기</button>
            </div>
        </div>
        <div class="services_main_section">
            <div class ="services_main_top">
                <div class ="services_main_top_text">
                    <h2>
                         <strong>침술</strong>은 무엇일까요?    
                    </h2>
                    <p>
                       침술은 가늘고 긴 바늘 형태를 한 침을 정해진 혈자리에 일정한 굵기와 깊이로 찔러넣어 신체 내 기의 부조합 혹은 기의 침체를 해결하여 허리·목 디스크, 척추관협착증, 각종 관절질환, 안면마비 등 다양한 척추관절 질환의 통증을 치료하고 신체 기능을 회복하게 돕는 의술입니다. 
                    </p>
                </div>
            </div>
            <div class ="services_main_Info">
                <div class ="services_main_img">
                    <img src="../src/img/acupuncture1.jpg" alt="" />
                </div>
                <div class ="services_main_text">
                    <h3>침술의 장점</h3>
                    <ul>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>스트레스 감소</span>
                        </li>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>허리 및 관절 통증 감소</span>
                        </li>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>두통 완화</span>
                        </li>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>강화된 정신적 클래티</span>
                        </li>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>신경 질환의 감소된 증상</span>
                        </li>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>소화기 질환 감소</span>
                        </li>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>에너지 증가</span>
                        </li>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>혈압 조절</span>
                        </li>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>의료 시술 후 개선된 치유법</span>
                        </li>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>더 나은 수면</span>
                        </li>                       

                    </ul>
                </div>

            </div>
        </div>
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
                    <div class="col-lg-4 col-md-6 ">
                        <div class="service-item bg-light rounded-circle d-flex flex-column align-items-center justify-content-center text-center">
                            <div class="service-icon mb-4 mt-2">
                                <i class="fa fa-2x fa-ambulance text-black"></i>
                            </div>
                            <h5 class="mb-3 fw-bold h4_1">안면침</h5>
                            <p class="m-0"> 동안침이라 부르기도 하는 안면침은 치료와 미용을 목적으로 얼굴의 혈자리 및 근육 부위에 침을 시술하는 것입니다.</p>
                            <a class="btn btn-lg rounded-pill mb-2" href="/${language}/service4" style="background-color: #0B486B; color: white;">
                                <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="service-item bg-light rounded-circle d-flex flex-column align-items-center justify-content-center text-center">
                            <div class="service-icon mb-4 mt-2">
                                <i class="fa fa-2x fa-solid fa-heart text-black"></i>
                            </div>
                            <h5 class="mb-3 fw-bold h4_1">괄사</h5>
                            <p class="m-0"> 괄사는 치료 부위에 괄사 기구를 반복적으로 긁어서 치료하는 요법으로써, 우리 나라 사람들이 뜸이나 부항에 익숙한 만큼이나..</p>
                            <a class="btn btn-lg rounded-pill mb-2" href="/${language}/service5" style="background-color: #0B486B; color: white;">
                                <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="service-item bg-light rounded-circle d-flex flex-column align-items-center justify-content-center text-center">
                            <div class="service-icon mb-4 mt-2">
                                <i class="fa fa-2x fa-microscope text-black"></i>
                            </div>
                            <h5 class="mb-3 fw-bold h4_1">라이프스타일/식이요법 컨설팅</h5>
                            <p class="m-0">Tai Yang Clinic 은 영어, 한국어, 일본어로 생활습관 및 식이요법 컨설팅 서비스를 제공 하고 있습니다. </p>
                            <!--                        <a class="btn btn-lg btn-primary rounded-pill" href="/service6">
                                                        <i class="bi bi-arrow-right"></i>
                                                    </a>-->
                            <a class="btn btn-lg rounded-pill mb-2" href="/${language}/service6" style="background-color: #0B486B; color: white;">
                                <i class="bi bi-arrow-right"></i>
                            </a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Services End -->
        <!--            </div>-->
        <!--</div>-->
    </div>


    <!-- Footer Start -->
    <footer>
        <jsp:include page="../components/footerKR.jsp" />
    </footer>

    <!--<script src="js/bootstrap.bundle.min.js"></script>-->

</body>
</html>