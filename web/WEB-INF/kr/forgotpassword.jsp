
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>

        <link rel="stylesheet" href="../fonts/material-icon/css/material-design-iconic-font.min.css">

        <link rel="stylesheet" href="../fonts/material-icon/css/material-design-iconic-font.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">



        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="../fonts/material-icon/css/material-design-iconic-font.min.css">


        <!--        Libraries Stylesheet -->  
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <c:import url="../components/headersKR.jsp" />   

        <style>
            .body1{
                font-family: 'Open Sans', sans-serif;


            }

        </style>


    </head>

    <body>

        <!--        //get email-->
        <section class="min-vh-80 body1" style="background-color: #f6f6f6;">
            <div class="container py-5 h-100 text-center pb-5">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="container h-100">
                        <div class="row d-flex justify-content-center align-items-center h-100">
                            <div class="col-12 col-md-7 col-lg-6 col-xl-5">
                                <div class="card" style="border-radius: 13px;">
                                    <div class="card-header h3 text-white text-center" style="background-color: #094676">Forgot my password</div>
                                    <div class="card-body p-5">

                                        <p class="card-text py-2" style="font-size: 1.2rem;">
<!--                                            Enter your email address to verify your email. KOREAN SIDE -->
                                                이메일 주소를 입력하십시오.
                                        </p>
                                        <div class ="form-outline">
                                            <form method="post" action="forgotpassword">
                                                <div class="form-group d-flex align-items-center mb-5">
                                                    <label class="mr-2">Email:</label>
                                                    <input type="text" class="form-control form-control-lg" style="width: 87%;" name="email" value="" required/>
                                                </div>
<!--                                                <div class="form-group d-flex align-items-center mb-1">
                                                    <label class="mr-2 text-left">Email:</label>
                                                </div>
                                                <div class="form-group mb-4">
                                                    <input type="password" class="form-control form-control-lg" style="width: 100%;" name="confirmPassword" value="" required/>
                                                </div>-->
                                                <div class="d-flex justify-content-center">
                                                    <input type="hidden" name="action" value="forgot" />
                                                    <input type ="submit" value ="Send the email" class="btn btn-primary btn-sm btn-lg radient-custom-4" style="width: 50%; background-color: #0B486B; border-color:#0B486B; color: white; font-size:1.0rem;">
                                                </div>

<br>
                                                <div class ="" style="color:blue;">
                                                    <p>${message}</p>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="../js/bootstrap.bundle.min.js"></script>
        <footer>
            <jsp:include page="../components/footerKR.jsp" />
        </footer>
    </body>
</html>