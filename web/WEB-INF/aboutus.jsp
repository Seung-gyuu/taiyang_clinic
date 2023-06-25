<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>

        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600&display=swap" rel="stylesheet"> 
    <p style ="background-image:url('src/img/main.png');">



        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://www.flaticon.com/kr/free-icons/" title="스마일 아이콘"></a>


    <!--        Libraries Stylesheet -->  
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/aboutus.css">
    <c:import url="./components/headers.jsp" />

<style>
    .sections h1{
        font-family: 'Belanosima', sans-serif;

    }

</style>


</head>
<body>
    <!--    About us-->
    <div class ="sections">
        <div class ="containers">
            <div class="title">
                <h1>About Us</h1>
            </div>
            <div class ="contents">
                <div class ="article">
                    <h3>
                        Sunny Gym holds a Diploma in Chinese Medicine and Acupuncture from the Calgary University of Traditional Chinese Medicine and Acupuncture. Her undergraduate studies were done, where she studied Business Administration in the Bissett School of Business.

                        A strong passion for improving the health of others through the use of Traditional Chinese Medicine (TCM) and acupuncture, motivates her to apply her vast knowledge of TCM to the health and wellness community.

                        She is a Board Licensed Acupuncturist across Canada, and registered with the College of Acupuncturists of Alberta (CAA). Certified in Acutonics and NADA protocol, as well as a Certified Yoga Instructor.[I just copy from other website, should change it]

                    </h3>
                    <p>Sunny Gym holds a Diploma in Chinese Medicine and Acupuncture from the Calgary University of Traditional Chinese Medicine and Acupuncture. Her undergraduate studies were done, where she studied Business Administration in the Bissett School of Business.

                        A strong passion for improving the health of others through the use of Traditional Chinese Medicine (TCM) and acupuncture, motivates her to apply her vast knowledge of TCM to the health and wellness community.

                        She is a Board Licensed Acupuncturist across Canada, and registered with the College of Acupuncturists of Alberta (CAA). Certified in Acutonics and NADA protocol, as well as a Certified Yoga Instructor.[I just copy from other website, should change it]

                    </p>
                </div>
            </div>
            <div class="image-sections">
                <img src ="src/img/aboutus.png">
            </div>
            <div class ="social">
            </div>
        </div>
    </div>



    <!--<script src="js/bootstrap.bundle.min.js"></script>-->
    <footer>
        <jsp:include page="./components/footer.jsp" />
    </footer>

</body>
</html>