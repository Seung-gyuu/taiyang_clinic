<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${message eq 'forget'}">
            <h1>Forgot My Password</h1>
            <h1>We need to verify your email</h1>
            <form method="post" action="reset">
                Email: <input type="text" value="" name="email" required><br>
                <input type="submit" value="Send the Email">
            </form>
        </c:if>

        <c:if test="${message eq 'reset'}">
            <h3>Change Your Password</h3>
            <h4> Hello, ${firstname} </h4>
            <form method="post" action="resetPassword">
                Password: <input type="password" name="password" required><br>
                Confirm Password: <input type="password" name="confirmPassword" required><br>
                <input type="submit" value="Change Password">
            </form>
        </c:if>

        <c:if test="${message eq 'invalid'}">
            <h3>Invalid link</h3>
            <a href="invalid?reset">verify the email</a> <a href="invalid?home">main page</a>
            </c:if>

        <p>${res}</p>
    </body>
</html>
