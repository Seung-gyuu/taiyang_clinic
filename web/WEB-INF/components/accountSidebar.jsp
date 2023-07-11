<%-- 
    Document   : accountSidebar
    Created on : 2023. 6. 6, 오전 2:59:48
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>
        <!--<link rel="stylesheet" type="text/css" href="../css/accountSidebar.css">-->
        <script src="https://kit.fontawesome.com/b0274adb94.js" crossorigin="anonymous"></script>
          <style>
          .account_side_wrap {
                /*border: 1px solid lightgray;*/
                width: 250px;
                /*background: #f7f7f7;*/
                margin-top: 10px;
            }

            .side_title {
                padding: 10px;
                background: gray;
                color: #fff;
                padding: 15px 40px;
                display: flex;
                align-items: center;
                font-size: 15px;
            }

            .fa-address-card {
                margin-right: 10px;
                margin-top: 3px;
                display: flex;
                align-items: center;
            }

            .side_title span {
            }

            .side_list_wrapper {
                list-style: none;
                margin: 0;
                padding: 0;
            }

            .side_list_wrapper a {
                text-decoration: none;
                color: #000;
            }

            .side_list {
                cursor: pointer;
                display: flex;
                align-items: center;
                padding: 10px 40px;
                /*border-top: 1px solid lightgray;*/
                font-size: 14px;

                /*border-bottom: 1px solid lightgray;*/
                border-top: 1px solid lightgray;
            }

            .side_list:hover {
                background: #212529;
                color: #fff !important;
                opacity: 0.8;
            }

            .active {
                background: #212529;
                color: #fff;
            }

            .fa-regular {
                margin-right: 10px;
            }

            .side_first {
                border-top: 1px solid lightgray;
            }

            .side_last {
                /*border-top: 1px solid lightgray;*/
                border-top: 1px solid lightgray;
                border-bottom: 1px solid lightgray;
            }
        </style>
    </head>
    <body>

        <div class="account_side_wrap">

            <ul class="side_list_wrapper">
                <a href="/en/history">
                    <li class="side_list side_first ${pageContext.request.requestURI eq '/WEB-INF/en/history.jsp'  ? 'active' : ''}">

                        <i class="fa-regular fa-calendar-check"></i>
                        My Appointments
                        <!--${pageContext.request.requestURI}-->
                        <i class="fa-light fa-chevrons-right"></i>
                    </li>
                </a>
                <a href="/en/profile">
                    <li class="side_list  ${pageContext.request.requestURI eq '/WEB-INF/en/profile.jsp' ? 'active' : ''}">
                        <i class="fa-regular fa-user"></i>
                        My Profile
                    </li>
                </a>
                <a href="/en/userforms">
                    <li class="side_list side_last ${pageContext.request.requestURI eq '/WEB-INF/en/userforms.jsp' ? 'active' : ''}">
                        <i class="fa-regular 	far fa-file-alt"></i>
                        View Forms
                    </li>
                </a>    

            </ul>
        </div>

    </body>
</html>