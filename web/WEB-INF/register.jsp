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

        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">



        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <!--        Libraries Stylesheet -->  
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/registerJS.js"></script>



        <style>
            .starter, .starter2.main{
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


        </style>
    </head>
    <body>



        <!-- Topbar Start -->
        <div class="container-fluid py-2 border-bottom d-none d-lg-block mt-2 starter">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 text-center text-lg-start mb-2 mb-lg-0">
                        <div class="d-inline-flex align-items-center">
                            <a class="text-decoration-none text-body px-2" href=""><i class="bi bi-telephone me-2"></i>+012 345 6789</a>
                            <span class="text-body">|</span>
                            <a class="text-decoration-none text-body px-2" href=""><i class="bi bi-envelope me-2"></i>sunnyacupuncturist@gmail.com </a>       

                        </div>
                    </div>

                    <div class="col-md-6 text-right text-lg-end">
                        <div class="d-inline-flex align-items-center">
                            <c:if test="${loggedUser eq null}">
                                <a class="text-decoration-none text-body px-3" href="/login">
                                    <i class="bi bi-person-fill"></i>
                                    Login <span class="text-body"> </a> |  
                                <a class="text-decoration-none text-body px-3" href="/register"></span>Register </a>
                            </c:if>
                            <c:if test="${loggedUser ne null}">
                                <c:if test="${upcomingAppointments ne null}">
                                    You have ${upcomingAppointments.size()} upcoming appointments! <br>
                                </c:if>
                                <a class="text-decoration-none text-body px-3" href="/profile">
                                    Hello,  ${loggedUser.getFirstname()} ${loggedUser.getLastname()} 
                                </a>
                            </c:if>
                            <a class="text-body px-2" href="">
                                <i class="fab fa-facebook-f"></i></a>
                            <a class="text-body px-2" href="">
                                <i class="fab fa-twitter"></i></a>
                            <a class="text-body px-2" href="">
                                <i class="fab fa-linkedin-in"></i></a>
                            <a class="text-body px-2" href="">
                                <i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--Navbar Start -->
        <div class="container-fluid sticky-top bg-white shadow-sm starter2">
            <div class ="container">
                <nav class="navbar navbar-expand-lg bg-white navbar-light py-3 py-lg-0">
                    <a href ="/home" class ="navbar-brand">
                        <h1 class="m-0 text-uppercase text-primary"><i class ="fa fa-clinic-medical me-2"></i>

                            Tai Yang Clinic</h1>
                    </a>
                    <button class ="navbar-toggler" type ="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class ="collapse navbar-collapse" id ="navbarCollapse">
                        <div class="navbar-nav text-right ms-auto py-0">
                            <a href="/home" class="nav-item nav-link active">Home</a>
                            <a href="/aboutus" class="nav-item nav-link">About us</a>
                            <div class ="nav-item dropdown">
                                <a href ="#" class ="nav-link dropdown-toggle" data-bs-toggle="dropdown">Services</a>
                                <div class="dropdown-menu m-0">
                                    <a href="/service1" class="dropdown-item">Accupuncture</a>
                                    <a href="/service2" class="dropdown-item">Moxibustion</a>
                                    <a href="/service3" class="dropdown-item">Massage/luiNa</a>
                                    <a href="/service4" class="dropdown-item">Cupping</a>
                                    <a href="/service5" class="dropdown-item">Herbal Medicine</a>
                                    <a href="/service6" class="dropdown-item">Korean beauty</a>
                                </div>
                            </div>
                            <a href="/book" class="nav-item nav-link">Book</a> 
                            <a href="/contact" class="nav-item nav-link">Contact</a>
                            <c:if test="${loggedUser ne null}">
                                <a href="/profile" class="nav-item nav-link">My Account</a> 
                            </c:if>

                            <c:if test="${loggedUser eq null}">
                                <a href="/login" class="nav-item nav-link">Login</a>
                            </c:if>
                            <c:if test="${loggedUser ne null}">
                                <a href="home?logout" class="nav-item nav-link">Log out</a> 
                            </c:if>
                        </div>
                    </div>
                </nav>
            </div>
        </div>

        <div class="main">
            <!--#ececec;-->
            <!-- Create an account form -->
            <section class="min-vh-100" style="background-color: #f6f6f6">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="container h-100">
                            <div class="row d-flex justify-content-center align-items-center h-100">
                                <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                                    <div class="card" style="border-radius: 15px;">
                                        <div class="card-body p-5">
                                            <h2 class="text-uppercase text-center mb-5">Create an account</h2>

                                            <form class="mb-8" action="register" method="post">

                                                <div class="row">
                                                    <div class="col-md-6 mb-4">

                                                        <div class="form-outline">

                                                            <input  type="text" id="first-name" class="form-control form-control-lg" name="first name" required="true" value="${firstname}" onchange="validateFirstName()" />
                                                            <label class="form-label" for="first-name">First Name</label>
                                                            <br>
                                                            <span id="first-name-span"></span>
                                                        </div>

                                                    </div>
                                                    <div class="col-md-6 mb-4">

                                                        <div class="form-outline">
                                                            <input type="text" id="last-name" class="form-control form-control-lg" name="last name" required="true" value="${lastname}" onchange="validateLastName()"/>
                                                            <label class="form-label" for="last-name">Last Name</label>
                                                            <br>
                                                            <span id="last-name-span"></span>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="form-outline mb-4">
                                                    <input id="email" type="text" class="form-control form-control-lg" name="email"required="true" value="${email}" onchange="validateEmail()"/>
                                                    <label class="form-label">Your Email</label>
                                                    <br>
                                                    <span id="email-span"></span>
                                                </div>

                                                <div class="row">



                                                    <div class="col-md-6 mb-4 pb-2">

                                                        <div class="form-outline">
                                                            <input type="text" id="phone" name="phone" class="form-control form-control-lg" placeholder="4031235678" required="true" value="${phone}" onchange="validatePhone()"/>
                                                            <label class="form-label" for="phone">Phone Number</label>
                                                            <br>
                                                            <span id="phone-span"></span>
                                                        </div>

                                                    </div>
                                                </div>



                                                <div class="form-outline mb-4">
                                                    <input type="password" id="password" name="password" class="form-control form-control-lg" required="true" onchange="validatePassword()" />
                                                    <label class="form-label" >Password</label>
                                                    <br>
                                                    <span id="password-span"></span>
                                                </div>


                                                <div class="d-flex justify-content-center" >
                                                    <input type="hidden" name="action" value="register" >
                                                    <input type="submit" id="submitbutton" name="submit" value="Register" class="btn btn-lg btn-block gradient-custom-4" style="width: 50%; background-color: #0B486B; color:white; border-color:#0B486B">
                                                </div>
                                                <p class="mb-1 pb-lg-2 text-center" style="color: #ff3333; margin-top: 10px;">${message} <br></p>
                                                <p class="mb-1 pb-lg-2 text-center" style="color: #0D6EFD;"> ${validation} <br></p>

                                                <p class="text-center mb-0" style="color: #393f81;" >Already have an account? <a href="/login" 
                                                                                                                                            class="fw-bold" style="color: #393f81;"><u>Login here</u></a></p>

                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </section>

            <script src="js/bootstrap.bundle.min.js"></script>
            <footer>
                <jsp:include page="./components/footer.jsp" />
            </footer>
    </body>
</html>