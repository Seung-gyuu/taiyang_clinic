<%-- 
    Document   : register
    Created on : Jun 4, 2023, 4:27:59 PM
    Author     : Hussein
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>REGISTER JSP</h1>
        <form action="register" method="post">
            First Name <input type="text" required="true" name="first name">
            Last Name <input type="text" required="true" name="last name">
            Email <input type="email" required="true" name="email">
            Phone <input type="text" required="true" name="phone" placeholder="1234567890">
            Password <input type="password" required="true" name="password">
            <input type="hidden" name="action" value="register" >
            <input type="submit" name="submit" value="Register">
        </form>
        ${message} <br>
        ${validation} <br>
        <a href="login">Login!</a>
        <a href="home">Home</a>
    </body>
</html>