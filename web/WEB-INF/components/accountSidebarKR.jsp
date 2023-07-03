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
        <link rel="stylesheet" type="text/css" href="../css/accountSidebar.css">
        <script src="https://kit.fontawesome.com/b0274adb94.js" crossorigin="anonymous"></script>
    </head>
    <body>

        <div class="account_side_wrap">

            <ul class="side_list_wrapper">
                <a href="/kr/history">
                    <li class="side_list side_first ${pageContext.request.requestURI eq '/WEB-INF/kr/history.jsp'  ? 'active' : ''}">

                        <i class="fa-regular fa-calendar-check"></i>
                        My Appointments KOREAN
                        <!--${pageContext.request.requestURI}-->
                        <i class="fa-light fa-chevrons-right"></i>
                    </li>
                </a>
                <a href="/kr/profile">
                    <li class="side_list side_last ${pageContext.request.requestURI eq '/WEB-INF/kr/profile.jsp' ? 'active' : ''}">
                        <i class="fa-regular fa-user"></i>
                        My Profile  KOREAN
                    </li>
                </a>
                <a href="/kr/userforms">
                    <li class="side_list side_last ${pageContext.request.requestURI eq '/WEB-INF/kr/userforms.jsp' ? 'active' : ''}">
                        <i class="fa-regular 	far fa-file-alt"></i>
                        View Forms KOREAN
                    </li>
                </a>    

            </ul>
        </div>

    </body>
</html>