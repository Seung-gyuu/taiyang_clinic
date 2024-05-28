<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Error 500 - Page Not Found</title>
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
                /*margin-top: -80px;*/
                /*margin-bottom: -70px;*/
                /*                position: relative;*/

            }

            .errorText {
                position: absolute;
                bottom: 15%;

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
                    bottom: 10%;
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
                    bottom: 7%;
                }
                .errorContainer img{
                    width: 400px;
                }
            }
        </style>
        <c:import url="WEB-INF/components/headers.jsp" />
    </head>


    <body>
        <div class=" errorContainer">
            <img src="/src/img/err500.png" alt="404 error">
            <div class="errorText">
                <h1>OOPS! Something went wrong</h1>
                <p>Try to refresh the page</p>
                <a href="/en/home">Go to Homepage</a>
            </div>
        </div>

    </body>
    <footer>
        <jsp:include page="WEB-INF/components/footer.jsp" />
    </footer>

</html>