<%-- 
    Document   : servicesList
    Created on : 2023. 7. 3, 오후 10:06:28
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Tai Yang Clinic</title>

        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/b0274adb94.js" crossorigin="anonymous"></script>
    <!--<p style ="background-image:url('src/img/main.png');">-->
        
                <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">



        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://www.flaticon.com/kr/free-icons/" title="스마일 아이콘">
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
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
    </body>
</html>