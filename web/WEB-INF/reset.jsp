<%-- 
    Document   : setnewpassword
    Created on : 11-Jun-2023, 6:22:27 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <c:if test="${status eq 'reset'}">
        <h3>Change Your Password</h3>
        <h4> Hello, ${user.getFirstname()} </h4>
        <form method="post" action="reset">
            Password: <input type="password" name="password" required><br>
            Confirm Password: <input type="password" name="confirmPassword" required><br>
            <input type="hidden" name="action" value="reset" />
            <input type="submit" value="Reset Password">
        </form>
    </c:if>
    <c:if test="${status ne 'reset'}">
        <h3>Invalid link</h3>
        <a href="/forgotpassword">Verify the email</a> <a href="/home">Home page</a>
    </c:if>

    <p>${message}</p>

</body>
</html>

