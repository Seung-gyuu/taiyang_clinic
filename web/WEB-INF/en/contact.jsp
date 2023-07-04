<%-- 
    Document   : contact
    Created on : 2023. 6. 20, 오전 5:11:42
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>
        <link rel="stylesheet" type="text/css" href="../css/global.css">
        <link rel="stylesheet" type="text/css" href="../css/contact.css">
        
         <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">

        
        <script src="https://kit.fontawesome.com/b0274adb94.js" crossorigin="anonymous"></script>
        <c:import url="../components/headers.jsp" />
    </head>
    <body>
        <div class="gloabal_container">
            <div class="contact_container">
                <div class="gloabal_top_section contact_top_section">
                    <h1>Contact Us</h1>
                    <p>Get in touch and let us know how we can help.</p>
                </div>
                <div class="contact_main_section">
                    <div class="contact_info">
                        <i class="fa-solid fa-location-dot fa-6x"></i>
                        <h2>ADDRESS</h2> 
                        <p>1310 16Ave NW, Calgary, AB</p>
                    </div>
                    <div class="contact_info">
                        
                        <i class="fa-solid fa-phone fa-6x"></i>
                        <h2>PHONE</h2> 
                        <p>(012) 345-6789</p>
                    </div>
                    <div class="contact_info">
                        <i class="fa-solid fa-envelope fa-6x"></i>
                        <h2>EMAIL</h2> 
                        <p>Sunny@example.com</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <footer>
        <jsp:include page="../components/footer.jsp" />
    </footer>
</html>
