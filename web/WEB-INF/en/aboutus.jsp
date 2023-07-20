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
        <link href="https://www.flaticon.com/kr/free-icons/" title="스마일 아이콘"></a>


    <!--        Libraries Stylesheet -->  
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/aboutus.css">
    <c:import url="../components/headers.jsp" />

    <style>

    </style>


</head>
<body>
    <!--    About us-->
    <div class ="sections">
        <div class ="containers">
            <div class="title">
                <h2><strong>About Us</strong></h2>
            </div>
            <div class ="contents">
                <div class ="article">
                    <h4>
                      Sunny is a registered acupuncturist with 1000 hours of observation and clinical case experiences. She trained at Alberta College of Acupuncture and Traditional Chinese Medicine and received her acupuncture practitioner license after a successful first attempt at the The Alberta Acupuncture Registration Examinations (AARE) test. Her specialties are: gynecology acupuncture, Korean beauty acupuncture techniques, Facial Rejuvenation Acupuncture (FRA), Tui Na and moxibustion. Sunny actively attends educational conferences to keep up to date with the advances in acupuncture research and treatment. Being a fluent speaker of Korean, English and Japanese, she also offers her consultations and lifestyle/diet advice services to the Korean and Japanese community in Calgary.

                    </h4>
                   <p>​Sunny meets her patients where they are at, both physically and emotionally, bringing an attentive presence and problem-solving mentality into each of her treatments. She specializes in treating complex and chronic cases, including chronic and acute pain, complex illness and disease, dermatological disorders, emotional and hormonal dysregulation, and gynecological disorders. Using a combination of acupuncture and Chinese herbal medicine, she has seen patients through the worst of their chronic symptoms into manageable, hopeful and harmonious states of being.

                    </p>
                </div>
            </div>
            <div class="image-sections">
                <img src ="../src/img/aboutus.png">
            </div>
            <div class ="social">
            </div>
        </div>
    </div>



    <!--<script src="js/bootstrap.bundle.min.js"></script>-->
    <footer>
        <jsp:include page="../components/footer.jsp" />
    </footer>

</body>
</html>