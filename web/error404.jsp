<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Error 404 - Page Not Found</title>
        <link rel="stylesheet" type="text/css" href="./css/global.css">
        <style>
            .errorContainer {
                max-width: 1320px;
                margin: 40px auto;
                padding: 1.5rem 0;
                /*min-height: 70vh;*/

                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;

                position: relative;
            }

            .errorContainer img {
                width: 50%;

            }

            .errorText {
                position: absolute;
                bottom: 10%;

                display: flex;
                flex-direction: column;
                align-items: center;
                /*justify-content: center;*/
            }

            .errorText h1 {
                font-weight: 600;
            }

            .errorText p {
                margin-bottom: 20px;
                font-size: 18px;
                text-align: center;
            }

            .errorText a{
                text-decoration: none !important;
                color: #fff;
                background: #4292dc;  
                cursor: pointer;
                padding: 10px 20px;
                font-size: 18px;
                border-radius: 10px;
            }

            @media screen and (max-width: 1200px) {
                .errorText h1 {
                    font-size: 28px;
                }

                .errorText p {
                    margin-bottom: 20px;
                    font-size: 16px;
                }

            }

            @media screen and (max-width: 990px) {
                .errorText {
                    bottom: 7%;
                }
                .errorText h1 {
                    font-size: 18px;
                }
                .errorText p {
                    margin-bottom: 20px;
                    font-size: 14px;
                }
            }

            @media screen and (max-width: 768px) {
                .errorContainer img{
                    width: 400px;
                }
            }
            @media screen and (max-width: 430px) {
                .errorText {
                    bottom: 0;
                }
                .errorContainer img{
                    width: 400px;
                }
            }
        </style>
        <c:import url="WEB-INF/components/headers.jsp" />
    </head>
    <body>
        <div class="errorContainer">
            <img src="/src/img/err404.png" alt="404 error">
            <div class="errorText">
                <h1>OOPS! PAGE NOT BE FOUND</h1>
                <p>Sorry but the page you are looking for does not exist, <br/>
                    have been removed, name changed or temporarly unavailable. </p>
                <a href="/en/home">Go to Homepage</a>
            </div>
        </div>

    </body>
    <footer>
        <jsp:include page="WEB-INF/components/footer.jsp" />
    </footer>

</html>