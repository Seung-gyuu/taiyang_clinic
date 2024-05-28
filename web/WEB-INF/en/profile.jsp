<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>
        <link rel="stylesheet" type="text/css" href="../css/global.css">
        <link rel="stylesheet" type="text/css" href="../css/profile.css">
        <link rel="stylesheet" type="text/css" href="../css/history.css">

        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">

        <script src="https://kit.fontawesome.com/b0274adb94.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <c:import url="../components/headers.jsp" />
         <script src="../js/profileJS.js"></script>

        <style>

        </style>
    </head>
    <body>
        <!--Profile Start-->
        <div class="gloabal_container">
            <div class="gloabal_top_section profileHeader">
                <h1>MY PROFILE</h1>       
            </div>
            <div class="account_container">           
                <div class="account_side">
                    <%@include file="../components/accountSidebar.jsp"%>
                </div>
                <div class="account_main">
                    <div class="profile_wrapper">
                        <!--update information-->
                        <div class="user_info">
                            <div class="user_info_name">
                                <i class="fa-solid fa-leaf"></i>
                                <h4>Hello, ${loggedUser.getFirstname()} ${loggedUser.getLastname()}</h4> 
                            </div>
                            <p class="user_info_notice">* You can update your personal information.</p>
                            <form action="profile" method="post">
                                <label for="emailInput">
                                    <p>Email</p>
                                    <input type="text" value="${loggedUser.getEmailAddress()}" name="email" id="emailInput" onchange="validateEmail()" required>  
                                    <br> <span id="email-span"></span>
                                </label>
                              

                                <div class="fullnameField">
                                    <label for="fnameInput">
                                        <p>First name</p>
                                        <span>
                                            <!--<c:out value="${loggedUser.getFirstname()}"/> <input type="hidden" id="fnameInput" name="Firstname" value="${loggedUser.getFirstname()}"> <br>-->
                                            <input type="text" id="fnameInput" name="Firstname" value="${loggedUser.getFirstname()}" disabled /> <br>
                                        </span>
                                    </label>
                                    <label for="lnameInput">
                                        <p>Last name</p>
                                        <span>
                                               <!--<c:out value=" ${loggedUser.getLastname()}"/><input type="hidden" id="lnameInput" name="Lastname" value="${loggedUser.getLastname()}"><br>>-->
                                            <input type="text" id="lnameInput" name="Lastname" value="${loggedUser.getLastname()}" disabled /><br>
                                        </span>
                                    </label>
                                </div>    

                                <label for="phoneInput">
                                    <p>Phone</p> 
                                    <input type="text" id="phoneInput" value="${loggedUser.getPhoneNumber()}" name="phone" placeholder="1234567890" onchange="validatePhone()" required>
                                    <br><span id="phone-span"></span> 
                                </label>
                                
                                
                                <label for="pwdInput">
                                    <p>Password</p>
                                    <input type="password" value="" name="password" id="pwdInput" onchange="validatePassword()" required>
                                    <br><span id="pwd-span"></span>
                                </label>
                                

                                <div class="formBtns">
                                    <input type="button" value="Cancel" class="accountCancelBtn" onclick="window.location.href = '/home'">
                                    <div>                                        
                                        <input type="submit" value="Update" id="submitbutton" class="accountUpdateBtn">
                                        <input type="hidden" name="action" value="update">
                                    </div>

                                </div>
                            </form>   
                                    <c:choose>
                                        <c:when test="${message ne 'Update successful!'}">
                                            <p id="profileMessage" style="color: #ff3333; font-size: 15px;">${message}</p>
                                        </c:when>
                                        <c:otherwise>
                                            <p id="profileMessage" style="color:blue; font-size: 15px;">${message}</p>                   
                                        </c:otherwise>
                                    </c:choose>
                        </div>
                    </div>
                </div>
            </div>  

        </div>
        <script src="../js/showMessage.js"></script>
        <script>
                                        $(document).ready(function () {
            <% if (request.getAttribute("updatedInfo") != null && (boolean) request.getAttribute("updatedInfo")) { %>
                                            // Call the showMessage function to display the pop-up message
            <% if (session.getAttribute("language").equals("en")) { %>
                                            showMessage("Your information successfully updated.");
            <% } else if (session.getAttribute("language").equals("kr")) { %>
                                            showMessage("귀하의 정보가 성공적으로 업데이트되었습니다.");
            <% } %>

            <% request.removeAttribute("updatedInfo"); %> // Remove the flag from the session
            <% }%>
                                        });
        </script>
 <!--<script src="../js/profileJS.js"></script>-->
    </body>

    <footer>
        <jsp:include page="../components/footer.jsp" />
    </footer>
</html>