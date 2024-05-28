<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>

        <link rel="apple-touch-icon" sizes="57x57" href="../src/img/favicon/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="../src/img/favicon/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="../src/img/favicon/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../src/img/favicon/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="../src/img/favicon/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../src/img/favicon/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="../src/img/favicon/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../src/img/favicon/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="../src/img/favicon/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192"  href="../src/img/favicon/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="../src/img/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="../src/img/favicon/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="../src/img/favicon/favicon-16x16.png">
        <link rel="manifest" href=../src/img/favicon/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">

        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <!--        <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">-->
        <link href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">


        <!--        Libraries Stylesheet -->  
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <!--        <link rel="stylesheet" type="text/css" href="../css/main.css">-->


        <style>
            .starter, .starter2{
                font-family: 'Open Sans', sans-serif;
            } 

            .starter{
                font-size: 13px;
            }

            .starter2, .dropdown-item{
                font-size: 14px;
            }

            .starter2 h1{
                font-size: 30px;
            }


            .dropdown-item.language-link-en {
                font-size: 0.8rem; 
            }

            .dropdown-item.language-link-kr {
                font-size: 0.8rem; 
            }

            .nav-item.dropdown .dropdown-menu .flag-icon {
                margin-right: 0.5rem; 
            }


        </style>

    </head>
    <body>
        <!-- Topbar Start -->
        <div class ="container-fluid py-2 border-bottom d-none d-lg-block mt-2 starter">
            <div class ="container">
                <div class ="row">

                    <div class="col-md-6 text-center text-lg-start mb-2 mb-lg-0">
                        <div class="d-inline-flex align-items-center">
                            <a class="text-decoration-none text-body px-2" href=""><i class="bi bi-telephone me-2"></i>+012 345 6789</a>
                            <span class="text-body">|</span>
                            <a class="text-decoration-none text-body px-2" href=""><i class="bi bi-envelope me-2"></i>sunnyacupuncturist@gmail.com </a>       
                            <!--                            <span class="text-body">|</span>
                                                        <a class ="text-decoration-none text-body px-2" href=""><i class ="bi bi-house-door me-2"></i>1310 16Ave NW</a>       -->
                        </div>
                    </div>


                    <% if (session.getAttribute("language") != null && !session.getAttribute("language").equals("kr") && !session.getAttribute("language").equals("en")) {
                            session.setAttribute("language", "en");
                        }
                    %>


                    <div class ="col-md-6 text-right text-lg-end">
                        <div class ="d-inline-flex align-items-center">
                            <c:if test="${loggedUser eq null}">
                                <a class ="text-decoration-none text-body px-3" href ="/${language}/login">
                                    <i class ="bi bi-person-fill"></i>
                                    로그인<span class="text-body"></a>|  
                                <a class ="text-decoration-none text-body px-3" href ="/${language}/register"></span>회원가입</a>

                            </c:if>
                            <c:if test="${loggedUser ne null}">
                                <c:if test="${upcomingAppointments ne null}">
                                    You have ${upcomingAppointments.size()} upcoming appointments! <br>
                                </c:if>
                                <a class ="text-decoration-none text-body px-3" href ="/${language}/profile">
                                    Hello  ,  ${loggedUser.getFirstname()} ${loggedUser.getLastname()} 
                                </a>
                            </c:if>
                     
                        </div>
                    </div>
                </div>
            </div>
        </div>




        <!--Navbar Start -->
        <div class="container-fluid sticky-top bg-white shadow-sm starter2">
            <div class ="container">
                <nav class="navbar navbar-expand-lg bg-white navbar-light py-3 py-lg-0">
                    <a href ="/${language}/home" class ="navbar-brand">
                        <img src="../src/img/ClinicLogo.png" alt="Logo" style="height:57px; width: 150px;" >
                    </a>
                    <button class ="navbar-toggler" type ="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class ="collapse navbar-collapse" id ="navbarCollapse">
                        <div class="navbar-nav text-right ms-auto py-0">
                            <c:url var="currentURL" value="${pageContext.request.requestURL}"></c:url>
                            <c:set var="cleanURL" value="${fn:substringBefore(currentURL, ';')}" />
                            <c:set var="contextPath" value="${pageContext.request.contextPath}" />
                            <c:set var="cleanURL" value="${fn:substringAfter(cleanURL, contextPath)}" />
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">Language</a>
                                <div class="dropdown-menu custom-dropdown-menu m-0">
                                    <c:if test="${language eq 'kr'}"><a href="${cleanURL}?translate=en" class="dropdown-item language-link-en">
                                            <span class="flag-icon">🇨🇦</span>English</a></c:if>
                                    <c:if test="${language eq 'en'}"><a href="${cleanURL}?translate=kr" class="dropdown-item language-link-kr">
                                            <span class="flag-icon">🇰🇷</span> 한국어</a></c:if>
                                    </div>
                                </div>
                                <a href="/${language}/home" class="nav-item nav-link active">홈</a>
                            <a href="/${language}/aboutus" class="nav-item nav-link active">소개</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">서비스</a>
                                <div class="dropdown-menu m-0">

                                    <a href="/${language}/service1" class="dropdown-item">침술</a>
                                    <a href="/${language}/service2" class="dropdown-item">뜸</a>
                                    <a href="/${language}/service3" class="dropdown-item">추나요법</a>
                                    <a href="/${language}/service7" class="dropdown-item">괄사</a>
                                    <a href="/${language}/service4" class="dropdown-item">부황</a>
                                    <a href="/${language}/service5" class="dropdown-item">한약 제조 및 처방</a>
                                    <a href="/${language}/service6" class="dropdown-item">안면침</a>
                                    <a href="/${language}/service8" class="dropdown-item">라이프스타일/식이요법 컨설팅</a>
                                </div>
                            </div>
                            <a href="/${language}/book" class="nav-item nav-link active">예약</a> 
                            <a href="/${language}/contact" class="nav-item nav-link active">오시는 길</a>
                            <c:if test="${loggedUser ne null}">
                                <a href="/${language}/history" class="nav-item nav-link active">내 계정</a> 
                            </c:if>

                            <c:if test="${loggedUser eq null}">
                                <a href="/${language}/login" class="nav-item nav-link active">로그인</a>
                            </c:if>
                            <c:if test="${loggedUser ne null}">
                                <a href="/${language}/home?logout" class="nav-item nav-link active">로그아웃</a> 
                            </c:if>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!--<script src="./js/bootstrap.bundle.min.js"></script>-->
    </body>
</html>