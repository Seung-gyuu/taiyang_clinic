<%-- 
    Document   : reset
    Created on : 4-Jun-2023, 3:45:24 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>forgot my password</h1>
        <!--        //get email-->
        <h1>we need to verify your email </h1>
        <form method="post" action="reset">
            Email: <input type="text" value="" name="email" required><br>
            <input type="submit" value="send the email">
        </form>
        
           <h3>Change your password</h3>
             <form method="post" action="resetPassword">
            Password <input type="text" value="" name="password" required><br>
            <input type="submit" value="change the password">
        </form>
            <!--        //send reset link
                    //using the link
                    //set the password-->
            <p>${res}</p>
    </body>
</html>
