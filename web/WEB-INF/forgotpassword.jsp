<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <h1>Forgot My Password</h1>
            <h1>We need to verify your email</h1>
            <form method="post" action="forgotpassword">
                Email: <input type="text" value="" name="email" required><br>
                <input type="hidden" name="action" value="forgot" />
                <input type="submit" value="Send the Email">
            </form>
        <p>${message}</p>
    </body>
</html>
