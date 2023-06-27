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
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/aboutus.css">
    <c:import url="./components/headers.jsp" />

    <style>
        *{
            margin:0px;
            padding:0px;
            box-sizing: border-box;

        }
        .sections h2{
            font-family: 'Cinzel', serif;
            font-size: 12px;

        }

        .sections{
            width: 100%;
        }
        .sections .containers{
            width:80%;
            display : block;
            margin: 0px auto;
            padding: 50px 0px;
        }

        .containers .title{
            width:100%;
            text-align: center;
            margin-bottom: 50px;
        }
        .containers .title h2{
            text-transform:uppercase;
            font-size: 35px;
            color: black;

        }
        .containers .title h2::after{
            content:"";
            height: 5px;
            width: 100px;
            background-color: #ebe4d6;
            border-radius: 25px;
            display: block;
            margin:auto;
            
        }
        .contents{
            float:left;
            width:55%;
            margin-top: 15px;
            
        }
        .image-sections{
            float:right;
            width:40%;
            margin-top: 5px;
        }
        .image-sections img{
            width:100%;
            height:auto;
            animation :fadeInRight 2s ease;
        }

        .contents .article h4{
            color: #a3a3a3;
            font-size: 15px;
            animation :fadeInUp 2s ease;
        }

        .contents .article p{
            margin-top:20px;
            font-size: 15px;
            line-height: 1.5;
            color: #333;
            animation :fadeInUp 2s ease;
        }

        .containers .social{
            width: 100%;
            clear: both;
            margin-top: 50px;
            text-align: center;
            display: inline-block;

        }
        
        .article h4, p{
                font-family: 'Open Sans', sans-serif;
            }



        @media screen and (max-width: 768px){
            .containers{
                width: 80%;
                display: block;
                margin: auto;
            }
            .contents{
                float: none;
                width: 100%;
                display: block;
                margin:auto;
            }
            .image-sections{
                float:none;
                width: 100%;
                margin-top: 50px;
            }
            .image-section img{
                width: 100%;
                height: auto;
                display: block;
                margin: auto;
            }
            .containers .title h2{
                text-align: center;
                font-size: 30px;
            }


        }


        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(50px);
            }
            100% {
                opacity: 1;
                transform: translateY(0px);
            }
        }

        @keyframes fadeInRight {
            0% {
                opacity: 0;
                transform: translateY(-50px);
            }
            100% {
                opacity: 1;
                transform: translateY(0px);
            }
        }

    </style>


</head>
<body>
    <!--    About us-->
    <div class ="sections">
        <div class ="containers">
            <div class="title">
                <h2>About Us</h2>
            </div>
            <div class ="contents">
                <div class ="article">
                    <h4>
                        Sunny Gym holds a Diploma in Chinese Medicine and Acupuncture from the Calgary University of Traditional Chinese Medicine and Acupuncture. Her undergraduate studies were done, where she studied Business Administration in the Bissett School of Business.

                        A strong passion for improving the health of others through the use of Traditional Chinese Medicine (TCM) and acupuncture, motivates her to apply her vast knowledge of TCM to the health and wellness community.

                        She is a Board Licensed Acupuncturist across Canada, and registered with the College of Acupuncturists of Alberta (CAA). Certified in Acutonics and NADA protocol, as well as a Certified Yoga Instructor.[I just copy from other website, should change it]

                    </h4>
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