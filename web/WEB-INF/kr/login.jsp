<%-- 
    Document   : login
    Created on : 3-Jun-2023, 10:58:52 PM
    Author     : rladm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>

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
        <link rel="stylesheet" type="text/css" href="../css/login.css">

        <style>
            .starter, .starter2 {
                font-family: 'Open Sans', sans-serif;

            } 

            .header1{
                font-family: 'Cinzel', serif;
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

            /*            .header1 h2{
                            font-weight: bold;
                        }*/

            .header1 h2{
                text-align: center;
            }
            
            form h5{
                font-size: 15px;
            }

        </style>
        <c:import url="../components/headersKR.jsp" />

    </head>
    <body>

        <!--login form-->
        <section class="min-vh-100 starter" style="background-color: #f6f6f6;">
            <div class="container py-5 h-100 ">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-xl-9 ">
                        <div class="card" style="border-radius: 20px 70px;">
                            <div class="row g-0">
                                <div class="col-md-6 col-lg-5 d-none d-md-block ">
                                    <img src="../src/img/beach.jpg" alt ="signin image" class="img-fluid" style="border-radius: 1rem 0 0 4rem; height:620px;" />
                                </div>
                                <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                    <div class="card-body p-4 p-lg-5 text-black">

                                        <form action="login" method="post">

                                            <div class="header1">
                                                <h2 class="text-uppercase mb-4 ">환영합니다!</h2>
                                            </div>

                                            <!--style="letter-spacing: 1px;"-->
                                            <h5 class="fw-normal mb-3 pb-3 text-center" >LOGIN TO YOUR ACCOUNT</h5>

                                            <!--                                                                                 <div class ="form-group">
                                                                                        <label for ="password">
                                                                                            <i class ="fa fa-lock"></i>
                                                                                        </label>
                                                                                        <input type ="password" name ="password" id ="password" placeholder ="Password" />
                                                                                    </div>-->

                                            <div class="form-outline mb-4">
                                                <input type="email" name ="email" value="${email}" class="form-control form-control-lg" style="width:100%;"  />
                                                <label class="form-label" >Your Email</label>
                                                <!--                                                <label class="form-label" ><i class ="fa fa-envelope"></i>Email</label>-->
                                            </div>

                                            <div class="form-outline mb-2">
                                                <input type="password" name="password" class="form-control form-control-lg " style="width:100%;" />
                                                <label class="form-label">Password</label>
                                                <!--                                                <label class="form-label"><i class ="fa fa-lock"></i>Password</label>-->
                                            </div>

                                            <div class="form-check d-flex justify-content-end mb-4 ">
                                                <label class="form-check-label"> <a href="/${language}/forgotpassword" > Forgot your password? </a></label>
                                            </div>
                                            <p class="mb-3 pb-lg-2 text-center" id="loginMessage" style="color: #ff3333; font-size: medium;">${message}</p>
                                            <script>
                                                var loginMessage = localStorage.getItem('loginMessage');
                                                var messageElement = document.getElementById('loginMessage');
                                                if (loginMessage) {
                                                    localStorage.removeItem('loginMessage');
                                                    messageElement.textContent = loginMessage;
                                                }

                                            </script>
                                            <div class="pt-1 mb-4 text-center">
                                                <!--<a href="main" class="btn btn-primary btn-lg btn-block" type="button" style="width:50%">Login</a>-->
                                                <input type="hidden" name="action" value="login" />
                                                <input type ="submit" name ="submit" id="signin" 
                                                       class="btn btn-lg btn-block" style="width:50%; background-color: #0B486B; color:white;" value ="Login" />  
                                            </div>
                                        </form>


                                        <p class="mb-5 pb-lg-2 text-center" style="color: #393f81;">Don't have an account? <a href="/${language}/register"  class="fw-bold"
                                                                                                                              style="color: #393f81;">Create new account</a></p>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>




        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="./js/bootstrap.bundle.min.js"></script>
        <script src="../js/showMessage.js"></script>
        <script>
                                                $(document).ready(function () {
            <% if (session.getAttribute("passwordReset") != null && (boolean) session.getAttribute("passwordReset")) { %>
                                                    // Call the showMessage function to display the pop-up message
                                                    showMessage("Password successfully changed.");
            <% session.removeAttribute("passwordReset"); %> // Remove the flag from the session
            <% }%>
                                                });
        </script>
        <footer>
            <jsp:include page="../components/footerKR.jsp" />
        </footer>

    </body>
</html>