<%-- 
    Document   : home
    Created on : 1-Jun-2023, 11:58:01 PM
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
        <c:import url="../components/headers.jsp" />
        
            <style>
            .section1{
            
                font-family: 'Open Sans', sans-serif;
            }


            
          
        </style>



    </head>
    <body>

        <!--        //get email-->
        <section class="min-vh-100 section1" style="background-color: #f6f6f6;">
            <div class="container py-5 h-100 text-center">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="container h-100">
                        <div class="row d-flex justify-content-center align-items-center h-100">
                            <div class="col-12 col-md-7 col-lg-6 col-xl-5">
                                <div class="card" style="border-radius: 13px;">
                                    
                                    <div class="card-header h3 text-white text-center" style="background-color: #094676">Forgot my password</div>
                                    <div class="card-body p-5">
                                        <p class="card-text py-2" style="font-size: 1.2rem;">
                                            Change your password
                                        </p>
                                        <h4> Hello, ${user.getFirstname()} </h4>

                                        <form method="post" action="reset">
                                            <div class="form-group d-flex align-items-center mb-1">
                                                <label class="mr-2 text-left" >Password:</label>
                                            </div>
                                            <div class="form-group mb-4">
                                                <input type="password" class="form-control form-control-lg" style="width: 100%;" name="password" value="" required/>
                                            </div>
                                            <div class="form-group d-flex align-items-center mb-1">
                                                <label class="mr-2 text-left" >Confirm Password:</label>
                                            </div>
                                            <div class="form-group mb-4">
                                                <input type="password" class="form-control form-control-lg" style="width: 100%;" name="confirmPassword" value="" required/>
                                            </div>
                                            <div class="d-flex justify-content-center">
                                                <input type="hidden" name="action" value="reset" />
                                                <input type ="submit" value ="Reset password" class="btn btn-sm btn-lg radient-custom-4" style="width: 50%; background-color: #0B486B; color:white; font-size:1.0rem;">
                                            </div>
                                        </form>
                                        <br>
                                            <c:choose>
                                        <c:when test="${message ne 'Password Updated.'}">
                                            <p id="resetMessage" style="color: #ff3333; font-size: 15px;">${message}</p>
                                        </c:when>
                                        <c:otherwise>
                                            <p id="resetMessage" style="color:blue; font-size: 15px;">${message}</p>                   
                                        </c:otherwise>
                                    </c:choose>
                                            <script>
                                                var resetMessage = localStorage.getItem('resetMessage');
                                                var messageElement = document.getElementById('resetMessage');
                                                if (resetMessage) {
                                                    localStorage.removeItem('resetMessage');
                                                    messageElement.textContent = resetMessage;
                                                }

                                            </script>
                                        <div class="d-flex justify-content-between mt-4">
                                            <a class ="" href="/${language}/login">Login</a>
                                            <a class ="" href="/${language}/register">Register</a>
                                        </div>
                                        <%--<c:if test="${status ne 'reset'}">--%>
                                        <!--<h3>Invalid link</h3>-->
                                        <!--<a href="/forgotpassword">Verify the email</a> <a href="/home">Home page</a>-->
                                        <%--</c:if>--%>

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
        <jsp:include page="../components/footer.jsp" />
    </footer>

</body>
</html>