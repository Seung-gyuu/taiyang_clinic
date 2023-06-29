<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>
        <link rel="stylesheet" type="text/css" href="css/global.css">
        <!--<link rel="stylesheet" type="text/css" href="css/profile.css">-->
        <link rel="stylesheet" type="text/css" href="css/history.css">
        
                <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">
        
        <script src="https://kit.fontawesome.com/b0274adb94.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <c:import url="./components/headers.jsp" />

        <style>

            .profileHeader h1{
                /*display: flex;*/
                /*justify-content: flex-start;*/
                font-family: Cinzel;
            }
            .profileHeader h1::after {
                content: "";
                height: 5px;
                width: 170px;
                background-color: #ebe4d6;
                border-radius: 25px;
                display: block;
                margin: auto;    
            }

            .account_container {
                display: flex;
                /*width: 100%;*/
            }

            .account_side {
                flex: 1;
                padding: 20px;
            }

            .account_main {
                flex: 4;

                padding: 20px 40px;
                margin: 20px auto;
            }

            .profile_title h2 {
                font-size: 18px;
            }

            .user_info {
                width: 100%;
                margin: 0 auto;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

            .user_info_name { 
                display: flex;
                align-items: center;
            }

            .user_info_name h4 {
                margin: 0;
            }

            .user_info_name i {
                color:#84BD4D;
                margin-right: 10px;
                font-size: 18px;
            }

            [data-initials]:before {
                background: #099bdd;
                color: white;
                opacity: 1; 
                content: attr(data-initials); 
                display: inline-block; 
                font-weight: bold; 
                border-radius: 50%; 
                vertical-align: middle; 
                margin-right: 0.5em; 
                width: 200px; 
                height: 200px; 
                line-height: 200px; 
                text-align: center; 
                font-size: 68px;
            }

            .user_info_notice {
                margin: 0;
                padding-top: 5px;
                /*padding-left: 28px;*/
                color: gray;
                font-size: 11px;
            }

            .user_info form {
                margin: 25px 0;
                display: flex;
                flex-direction: column;
            }

            label {
                display: flex;
                flex-direction: column;
                /*align-items: center;*/
                margin-bottom: 20px; 
                /*justify-content: center;*/
            }

            .user_info form label {
                /*margin-right: 10px;*/
                /*font-size: 16px;*/
                margin-bottom: 20px; 
            }

            .user_info form label p {
                font-size: 14px;
                margin: 0; 
                color: gray;

            }

            .user_info form label input {
                padding: 10px;
                border: 1px solid #c4c4c4;
                border-radius: 5px;
                margin-top: 5px;
                width:100%;
            }

            .fullnameField {
                display: flex;
                align-items: center;
                justify-content: space-between;
                width: 100%;
            }

            #fnameInput {
                margin-right: 10px;
            }

            #lnameInput {
                margin-left: 10px;
            }

            .fullnameField label span input {
                /*                width: 170px;*/
                /*margin-right: 10px;*/
                cursor: not-allowed;
            }

            .formBtns {
                width: 100%;
                display: flex;
                justify-content: space-between;
            }

            .formBtns input {
                border: none;
                padding: 5px 0;
                width: 70px;
                border-radius: 10px;
                /*margin-left: 15px;*/
            }

            .accountUpdateBtn {
                background: #0b486b;
                color:#fff;
                font-size: 14px;
            }

            .accountUpdateBtn:hover {
                /*                border:2px solid #0b486b;
                                background: #fff;
                                color:#000;*/
                box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.2);
            }

            .accountCancelBtn:hover {
                box-shadow: 2px 2px 5px 2px rgba(0, 0, 0, 0.1);
            }

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
                    <%@include file="./components/accountSidebar.jsp"%>
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
        <script src="js/showMessage.js"></script>
        <script>
            $(document).ready(function () {
            <% if (request.getAttribute("updatedInfo") != null && (boolean) request.getAttribute("updatedInfo")) { %>
                // Call the showMessage function to display the pop-up message
                showMessage("Your information successfully updated.");
            <% request.removeAttribute("updatedInfo"); %> // Remove the flag from the session
            <% }%>
            });
        </script>


        <!-- Display updated email and phone -->
        <c:if test="${not empty updatedEmail}">
            <script>
                var emailField = document.getElementById("emailInput");
                emailField.value = "${updatedEmail}";
            </script>
        </c:if>
        <c:if test="${not empty updatedPhone}">
            <script>
                var phoneField = document.getElementById("phoneInput");
                phoneField.value = "${updatedPhone}";
            </script>
        </c:if>
    </body>

    <footer>
        <jsp:include page="./components/footer.jsp" />
    </footer>
</html>