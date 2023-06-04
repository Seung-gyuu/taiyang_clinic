<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/mycss.css">

    </head>
    <body>
 
        <h1> Welcome to Taiyang clicnic </h1>
         <h2>Hello, ${firstName} ${lastName}</h2>  

        //display main page
        
        <nav class="nav">
            <a class="nav-link active" href="#">HOME</a>
            <a class="nav-link" href="#">ABOUT US</a>
            <a class="nav-link" href="#">SERVICES</a>
            <a class="nav-link disabled" href="home?account">My account</a>
            <a class="nav-link disabled" href="#">BOOK NOW</a>
        </nav>


        <form>
            <div class="form-group">
                <label for="exampleInputEmail1">Email address</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
            </div>
            <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                <label class="form-check-label" for="exampleCheck1">Check me out</label>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
   

    <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
