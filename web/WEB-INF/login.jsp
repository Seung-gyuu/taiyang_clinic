<%-- 
    Document   : Login
    Created on : 2-Jun-2023, 10:30:22 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login page</title>
    </head>
    <body>
         <h4> MENU: <a href="login?signIn" > Create a new account </a></h4>
        <h1>Login</h1>
        <form method="post" action="login">
            Email: <input type="text" value="" name="email" required><br>
            Password: <input type="password" value="" name="password" required><br>
            <input type="submit" value="Login">
            <a href="login?reset" > Forgot password? </a>
            <p>${res}</p>
        </form>
<!--        <c:if test="${message eq 'register'}">
            Your information is added successfully!         
        </c:if>
        <c:if test="${message eq 'deactivate'}">
            Your account is deactivated. Thank you!         
        </c:if>-->
    </body>
</html>
