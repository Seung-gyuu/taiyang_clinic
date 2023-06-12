<%-- 
    Document   : validate
    Created on : 12-Jun-2023, 10:22:24 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Validate Page</h1>
        ${message}
        <a href="register">Register Page</a>
            <a href="login">Login Page</a>
            <a href="home">Home page</a>
            <c:if test="${resend ne null}">
                <a href="sendvalidation">Resend Token</a>
            </c:if>
    </body>
</html>