<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error 404 - Page Not Found</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px;
        }
        main {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 80vh;
        }
        h1 {
            font-size: 4rem;
            margin: 0;
        }
        p {
            font-size: 1.5rem;
            text-align: center;
            margin: 20px 0;
        }
        a {
            color: #007bff;
            text-decoration: none;
            font-size: 1.2rem;
        }
        a:hover {
            text-decoration: underline;
        }
        img {
            width: 50%;
            max-width: 300px;
            height: auto;
            display: block;
            margin: 20px auto;
        }
        footer {
            background-color: #f7f7f7;
            padding: 10px;
            text-align: center;
        }
    </style>
    <c:import url="WEB-INF/components/headers.jsp" />
</head>
<body>
    <header>
        <h1>Error 404 - Page Not Found</h1>
    </header>
    <main>
        <p>Sorry, the page you're looking for can't be found.</p>
        <a href="/en/home">Go to Homepage</a>
        <img src="/src/img/cat404.png" alt="404 Cat Image">
    </main>
    <footer>
            <jsp:include page="WEB-INF/components/footer.jsp" />
        </footer>
</body>
</html>