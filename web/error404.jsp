<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error 404</title>
    </head>
    <body>  
        <%@ page isErrorPage="true" %>
        <h1> <strong>404</strong> PAGE NOT FOUND</h1> 
        <p>
           Hmm, Something went wrong <br>
           Sorry, The page you're looking for can't be found <br>
        </p>
        <br>
        <a href="/en/home"> HOMEPAGE </a>
    </body>
</html>
