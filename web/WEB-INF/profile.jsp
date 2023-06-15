<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>
        <link rel="stylesheet" type="text/css" href="css/global.css">
        <link rel="stylesheet" type="text/css" href="css/profile.css">
        <link rel="stylesheet" type="text/css" href="css/history.css">
        <script src="https://kit.fontawesome.com/b0274adb94.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <c:import url="./components/headers.jsp" />
    </head>
    <body>
        <!--Profile Start-->
        <div class="gloabal_container">
            <div class="gloabal_top_section">
                <h1>MY ACCOUNT</h1>       
            </div>
            <div class="account_container">           
                <div class="account_side">
                    <%@include file="./components/accountSidebar.jsp"%>
                </div>
                <div class="account_main">
                    <div class="profile_wrapper">
                        <div class="profile">
                            <h2>My Profile</h2>                        
                        </div>
                        update information
                        <h4>Username: ${loggedUser.getFirstname()} ${loggedUser.getLastname()}</h4> 
                        <form action="profile" method="post">
                            Email: <input type="text" value="${loggedUser.getEmailAddress()}" name="email" id="emailInput" required>  <br> 
                            <!--Email: <c:out value="${loggedUser.getEmailAddress()}"/> <input type="hidden" name="email" value="${loggedUser.getEmailAddress()}"> <br>-->
                            First name: <c:out value="${loggedUser.getFirstname()}"/> <input type="hidden" name="Firstname" value="${loggedUser.getFirstname()}"> <br>
                            Last name:<c:out value=" ${loggedUser.getLastname()}"/><input type="hidden" name="Lastname" value="${loggedUser.getLastname()}"><br>
                            Phone: <input type="text" id="phoneInput" value="${loggedUser.getPhoneNumber()}" name="phone" placeholder="1234567890" required> <br> 
                            Password: <input type="password" value="" name="password" required> <br> 
                            <br>
                            <input type="submit" value="Update">
                            <input type="hidden" name="action" value="update">
                            <a href="/home"><input type="button" value="Cancel">
                                <input type="hidden" name="action" value="cancel"></a> 
                        </form>   
                        <p>${message}</p>
                    </div>
                </div>
            </div>  

        </div>
        <script src="js/showMessage.js"></script>
        <script>
            $(document).ready(function () {
            <% if (session.getAttribute("updatedInfo") != null && (boolean) session.getAttribute("updatedInfo")) { %>
                // Call the showMessage function to display the pop-up message
                showMessage("Your information successfully updated.");
            <% session.removeAttribute("updatedInfo"); %> // Remove the flag from the session
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
