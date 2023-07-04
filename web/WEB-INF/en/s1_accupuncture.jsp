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
        <!--<p style ="background-image:url('../src/img/main.png');">-->


        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://www.flaticon.com/kr/free-icons/" title="스마일 아이콘"></a>


    <!--        Libraries Stylesheet -->  
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/services.css">
    <link rel="stylesheet" type="text/css" href="../css/global.css">


    <c:import url="../components/headers.jsp" />


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
                <h1>Acupuncture</h1>
                <button onclick="window.location.href = '/${language}/book'">Book Now</button>
            </div>
        </div>
        <div class="services_main_section">
            <div class ="services_main_top">
                <div class ="services_main_top_text">
                    <h2>
                        What is <strong>Acupuncture</strong>?    
                    </h2>
                    <p>
                        Acupuncture is a procedure that uses tiny needles inserted into the skin to help balance a person’s energy.
                        The needles are inserted at specific locations along the patient’s body that align with energy points. 
                        This triggers the body’s natural healing capabilities, helping restore balance to both the mind and body.
                    </p>
                </div>
            </div>
            <div class ="services_main_Info">
                <div class ="services_main_img">
                    <img src="../src/img/acupuncture1.jpg" alt="" />
                </div>
                <div class ="services_main_text">
                    <h3>Health Benefits of Acupuncture</h3>
                    <ul>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>Reduced Stress</span>
                        </li>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>Reduced Back and Joint Pain</span>
                        </li>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>Headache Relief</span>
                        </li>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>Enhanced Mental Clarty</span>
                        </li>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>Reduced Symptoms of Neurological Disorders</span>
                        </li>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>Fewer Digestive Problems </span>
                        </li>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>Increased Energy</span>
                        </li>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>Controlling Blood Presesure</span>
                        </li>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>Improved Healing After Medical Procesures</span>
                        </li>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>Better Sleep</span>
                        </li>                       

                    </ul>
                </div>

            </div>
        </div>
        <!-- Services Start -->
        <%@include file="../components/servicesList.jsp"%>
        <!-- Services End -->
        <!--            </div>-->
        <!--</div>-->
    </div>
    <!-- Footer Start -->
    <footer>
        <jsp:include page="../components/footer.jsp" />
    </footer>

    <!--<script src="js/bootstrap.bundle.min.js"></script>-->

</body>
</html>