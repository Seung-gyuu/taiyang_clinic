<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>

        <link rel="stylesheet" href="../fonts/material-icon/css/material-design-iconic-font.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">



        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="../fonts/material-icon/css/material-design-iconic-font.min.css">

        <!--        Libraries Stylesheet -->  
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="../css/send.css">
    </head>
    <body>

            <section class="p-0 mb-0" style="background-color: #ececec;">
                <div class="container-fluid d-flex flex-column">
                    <div class="row align-items-center justify-content-center min-vh-100">
                        <div class="col-md-9 col-lg-6 my-5">
                            <div class="text-center validate-page">
                                <h3 class="mb-3 text-secondary">Validate Page</h3>
                                <p> ${message} </p>
                                <div>
                                    <a href="/login?fromValidation=true" class="btn btn-info btn-lg me-sm-2 mb-2 mb-sm-0">Go To Login</a>
                                    <a href="/home?fromValidation=true" class="btn btn-info btn-lg me-sm-2 mb-2 mb-sm-0">Return To Home</a>

                                    <c:if test="${resend ne null}">
                                        <a href="/sendvalidation" class="btn btn-info btn-lg me-sm-2 mb-2 mb-sm-0">Resend Token</a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </body>
    </html>


