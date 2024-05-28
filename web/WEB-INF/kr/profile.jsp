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
        <c:import url="../components/headersKR.jsp" />

        <style>

        </style>
    </head>
    <body>
        <!--Profile Start-->
        <div class="gloabal_container">
            <div class="gloabal_top_section profileHeader">
                <h1>내 정보</h1>       
            </div>
            <div class="account_container">           
                <div class="account_side">
                    <%@include file="../components/accountSidebarKR.jsp"%>
                </div>
                <div class="account_main">
                    <div class="profile_wrapper">
                        <!--update information-->
                        <div class="user_info">
                            <div class="user_info_name">
                                <i class="fa-solid fa-leaf"></i>
                                <h4>안녕하세요, ${loggedUser.getFirstname()} ${loggedUser.getLastname()}</h4> 
                            </div>
                            <p class="user_info_notice">* 당신은 개인 정보를 변경하실 수 있습니다.</p>
                            <form action="profile" method="post">
                                <label for="emailInput">
                                    <p>Email</p>
                                    <input type="text" value="${loggedUser.getEmailAddress()}" name="email" id="emailInput" required>
                                </label>

                                <!--Email: <c:out value="${loggedUser.getEmailAddress()}"/> 
                                <input type="hidden" name="email" value="${loggedUser.getEmailAddress()}"> <br>-->
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
                                    <input type="text" id="phoneInput" value="${loggedUser.getPhoneNumber()}" name="phone" placeholder="1234567890" required> <br> 
                                </label>
                                <label for="pwdInput">
                                    <p>Password</p>
                                    <input type="password" value="" name="password" id="pwdInput" required>
                                </label>

                                <div class="formBtns">
                                     <input type="button" value="Cancel" class="accountCancelBtn" onclick="window.location.href='/home'">
                                    <div>                                        
                                        <input type="submit" value="Update" class="accountUpdateBtn">
                                        <input type="hidden" name="action" value="update">
                                </div>

                                </div>
                            </form>   
                                     <c:if test="${message ne 'Update successful!'}">
                            <p id="profileMessage" style="color: #ff3333; font-size: 15px;">${message}</p>
                                     </c:if>
                            <c:if test="${message eq 'Update successful!'}">
                            <p id="profileMessage" style="color:blue; font-size: 15px;">${message}</p>
                                     </c:if>
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


        <!-- Display updated email and phone -->
        <c:if test="${not empty updatedEmail}">
            <script>
                var emailField = document.getElementById("emailInput");
                emailField.value = "${updatedEmail}";
                <% session.removeAttribute("updatedEmail"); %>
            </script>
        </c:if>
        <c:if test="${not empty updatedPhone}">
            <script>
                var phoneField = document.getElementById("phoneInput");
                phoneField.value = "${updatedPhone}";
                <% session.removeAttribute("updatedPhone"); %>
            </script>
        </c:if>
    </body>

    <footer>
        <jsp:include page="../components/footerKR.jsp" />
    </footer>
</html>