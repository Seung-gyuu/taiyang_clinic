<%-- 
    Document   : sendValidation
    Created on : 9-Jun-2023, 9:40:53 AM
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
        <link href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap" rel="stylesheet"> 



        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="../fonts/material-icon/css/material-design-iconic-font.min.css">

        <!--        Libraries Stylesheet -->  
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="../css/send.css">


    </head>
    <body>
        <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Tai Yang Clinic</title>
        </head>
        <body>
            <section class="p-0 mb-0 " style="background-color: #ececec;">
                <div class="container-fluid d-flex flex-column">
                    <div class="row align-items-center justify-content-center min-vh-100">
                        <div class="col-md-9 col-lg-6 my-5">
                            <div class="text-center validate-page ">
                                <h3 class="mb-3 text-secondary">Send Token</h3>
                                <form method="post" action="sendvalidation">
                                    <p class="w-sm-80 mx-auto mb-4 text-black">Please enter an email to receive the token.</p>
                                    <div class="form-outline mb-4 d-flex align-items-center">
                                        <input type="text" name="email" class="form-control form-control-lg me-2"  placeholder="Enter your email" />
                                        <input type="hidden" name="action" value="send verification">
                                        <input type="submit" class="btn btn-secondary btn-lg" value="Send Validation">
                                        
                                    </div>
                                </form>
                                <p>${message}</p> 
                                <div>
                                    <a href="/home?fromValidation=true" class="btn btn-info btn-lg me-sm-2 mb-2 mb-sm-0">Return To Home</a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </body>
    </html>