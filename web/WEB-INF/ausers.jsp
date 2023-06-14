<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>

        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">
    <p style ="background-image:url('src/img/main.png');">



        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!--        Libraries Stylesheet -->  
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/admin1.css">


    </head>
<body>



    <!--Navbar Start -->
    <div class="container-fluid sticky-top bg-white shadow-sm">
        <div class ="container">
            <nav class="navbar navbar-expand-lg bg-white navbar-light py-3 py-lg-0">
                <a href ="/home" class ="navbar-brand">
                    <h1 class="m-0 text-uppercase text-primary"><i class ="fa fa-clinic-medical me-2"></i>

                        Tai Yang Clinic</h1>
                </a>
                <button class ="navbar-toggler" type ="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class ="collapse navbar-collapse" id ="navbarCollapse">
                    <div class="navbar-nav text-right ms-auto py-0">
                        <a href="/home" class="nav-item nav-link active">Home</a>
                        <a href="" class="nav-item nav-link">Logout</a>
                    </div>
                </div>
            </nav>
        </div>
    </div>

    <!--sidevar-->
    <div class="container-fluid">
        <div class="row">

            <div class="col-md-3 text-dark py-5" style="background-color: #f3f2f2;">
                <h3 class="text-center mt-3 mb-4">Admin Menu</h3>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="ausers">Users</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="aavailability">Availability</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="adminform">Add Consent or Medical Form</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="#">View Forms</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="#">View Appointments</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="#">Reports</a>
                    </li>
                </ul>
            </div>
            <!--end sidevar-->

            <div class="col-md-9">

                <div class="container py-5">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <h2>Admin Panel - User Management</h2>
                        </div>
                        <div class="col-md-6 text-end">
                            <button class="btn btn-primary" id="addUserBtn">Add New User</button>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="searchUserInput" placeholder="Search User">
                        </div>
                        <div class="col-md-6 text-end">
                            <button class="btn btn-secondary" id="searchUserBtn">Search</button>
                        </div>
                    </div>

                    <table class="table">
                        <thead>
                            <tr>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Email</th>
                                <th>Phone Number</th>
                                <th>#Edit</th>
                                <th>isActive</th>
                            </tr>
                        </thead>
                        <c:forEach items="${users}" var="user">
                            <tr>
                                <td><c:out value="${user.firstName}"/></td>
                                <td><c:out value="${user.lastName}"/></td>
                                <td><c:out value="${user.email}"/></td>
                                <td><c:out value="${user.phone}"/></td>
                                <td><input type="hidden" name="action" value="edit">
                                    <a href="users?action=edit&amp;email=${user.email}">Edit</a></td>
                                <td><input type="hidden" name="action" value="delete">
                                    <a href="users?action=delete&amp;email=${user.email}">Delete</a></td>
                                <td></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>


    <!--Add user-->
    <div class="container py-5">
        <h2>Add User</h2>
        <form id="addUserForm">
            <div class="mb-3">
                <label for="firstNameInput" class="form-label">First Name</label>
                <input type="text" class="form-control" id="firstNameInput" placeholder="Enter first name" required>
            </div>
            <div class="mb-3">
                <label for="lastNameInput" class="form-label">Last Name</label>
                <input type="text" class="form-control" id="lastNameInput" placeholder="Enter last name" required>
            </div>
            <div class="mb-3">
                <label for="emailInput" class="form-label">Email</label>
                <input type="email" class="form-control" id="emailInput" placeholder="Enter email" required>
            </div>
            <div class="mb-3">
                <label for="passwordInput" class="form-label">Password</label>
                <input type="password" class="form-control" id="passwordInput" placeholder="Enter password" required>
            </div>
            <div class="mb-3">
                <label for="phoneInput" class="form-label">Phone Number</label>
                <input type="text" class="form-control" id="phoneInput" placeholder="Enter phone number" required>
            </div>
            <div class="mb-3">
                <label for="roleInput" class="form-label">Role</label>
                <select class="form-select" id="roleInput" required>
                    <option value="">Select role</option>
                    <option value="admin">Admin</option>
                    <option value="regular">Regular User</option>
                </select>
            </div>
            <div class="text-end">
                <button type="button" class="btn btn-secondary" id="cancelBtn">Cancel</button>
                <button type="submit" class="btn btn-primary" id="addBtn">Add</button>
            </div>
        </form>
    </div>
    <!--end add user-->

    <!--edit user-->
    <div class="container py-5">
        <h2>Edit User</h2>
        <form id="editUserForm">
            <div class="mb-3">
                <label for="firstNameInput" class="form-label">First Name</label>
                <input type="text" class="form-control" id="firstNameInput" placeholder="Enter First Name" required>
            </div>
            <div class="mb-3">
                <label for="lastNameInput" class="form-label">Last Name</label>
                <input type="text" class="form-control" id="lastNameInput" placeholder="Enter Last Name" required>
            </div>
            <div class="mb-3">
                <label for="emailInput" class="form-label">Email</label>
                <input type="email" class="form-control" id="emailInput" placeholder="Enter Email" required>
            </div>
            <div class="mb-3">
                <label for="passwordInput" class="form-label">Password</label>
                <input type="password" class="form-control" id="passwordInput" placeholder="Enter Password" required>
            </div>
            <div class="mb-3">
                <label for="phoneInput" class="form-label">Phone Number</label>
                <input type="text" class="form-control" id="phoneInput" placeholder="Enter Phone Number" required>
            </div>
            <div class="text-end">
                <button type="button" class="btn btn-secondary" id="cancelBtn">Cancel</button>
                <button type="submit" class="btn btn-primary" id="saveBtn">Save Changes</button>
            </div>
        </form>
    </div>
    <!--end edit user-->

    <!--                <p>        
    <c:if test="${message eq 'update'}">User information updated</c:if>
    <c:if test="${message eq 'empty'}">No users found. Please add a user</c:if>
    <c:if test="${message eq 'error'}">Sorry, something went wrong.</c:if>
    </p>

    <c:if test="${message ne 'empty'}">
        <table border="1" cellpadding="5">
            <tr>
                <th>Email</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Phone Number</th>
                <th></th>
                <th></th>
            </tr>
        <c:forEach items="${users}" var="user">
            <tr>
                <td><c:out value="${user.email}"  /></td>
                <td><c:out value="${user.firstName}"  /></td>
                <td><c:out value="${user.lastName}"  /></td>
                <td><input type="hidden" name="action" value="edit">
                    <a href="<c:url value='/users?action=edit&amp;'>
                <c:param name='email' value='${user.email}'/>  
            </c:url>">Edit
         </a></td> 
     <td><input type="hidden" name="action" value="delete">
         <a href="<c:url value='/users?action=delete&amp;'> 
                <c:param name='email' value='${user.email}'/> 
            </c:url>"> Delete</a></td>     
 </tr>
        </c:forEach>
    </table>
    </c:if>

    <c:if test="${selectedUser eq null}">
        <form action="users" method="post">
            <h2>Add User</h2>   
            Email: <input type="text" value="${email}" name="email">  <br>
            First name: <input type="text" value="${first}" name="first"> <br>
            Last name: <input type="text" value="${last}" name="last"> <br>
            Phone number: <input type="text" value="${last}" name="last"> <br>
            Password: <input type="password" value="${pw}" name="pw"> <br>
            <input type="submit" value="Add user">
            <input type="hidden" name="action" value="add">
        </form>
    </c:if>

    <c:if test="${(message eq 'edit')}">
        <h2>Edit User</h2>
        <form action="users" method="post">
            Email: <c:out value="${email}"/> <input type="hidden" name="email" value="${email}">    <br>          
            First name: <input type="text" value="${selectedUser.firstName}" name="first"> <br>
            Last name: <input type="text" value="${selectedUser.lastName}" name="last"> <br>
            Password: <input type="password" value="" name="pw"> <br>                          
            <br>
            <input type="submit" value="Update">
            <input type="hidden" name="action" value="update">
            <a href="/"><input type="button" value="Cancel">
                <input type="hidden" name="action" value="cancel"></a> 
    </c:if>
<p>
    ${mes}
</p> -->





    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-light  py-5">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-3 col-md-6">
                    <h4 class="d-inline-block text-primary text-uppercase border-bottom border-5 border-secondary mb-4">Get In Touch</h4>
                    <p class="mb-4">Please feel free to contact us if you need any information.</p>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary me-3"></i>1310 16Ave NW, Calgary</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary me-3"></i>Sunny@example.com</p>
                    <p class="mb-0"><i class="fa fa-phone-alt text-primary me-3"></i>+012 345 6789</p>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="d-inline-block text-primary text-uppercase border-bottom border-5 border-secondary mb-4">Quick Links</h4>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-light mb-2" href="/home"><i class="fa fa-angle-right me-2"></i>Home</a>
                        <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>About Us</a>
                        <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>Our Services</a>
                        <a class="text-light mb-2" href="/book"><i class="fa fa-angle-right me-2"></i>Book an appointment</a>
                        <a class="text-light" href="#"><i class="fa fa-angle-right me-2"></i>Contact Us</a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="d-inline-block text-primary text-uppercase border-bottom border-5 border-secondary mb-4">Popular Links</h4>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-light mb-2" href="/home"><i class="fa fa-angle-right me-2"></i>Home</a>
                        <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>About Us</a>
                        <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>Our Services</a>
                        <a class="text-light mb-2" href="#"><i class="fa fa-angle-right me-2"></i>Book an appointment</a>
                        <a class="text-light" href="#"><i class="fa fa-angle-right me-2"></i>Contact Us</a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">

                    <h6 class="text-primary text-uppercase mt-4 mb-3">Follow Us</h6>
                    <div class="d-flex">
                        <a class="btn btn-lg btn-primary btn-lg-square rounded-circle me-2" href=""><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-lg btn-primary btn-lg-square rounded-circle me-2" href=""><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-lg btn-primary btn-lg-square rounded-circle me-2" href=""><i class="fab fa-linkedin-in"></i></a>
                        <a class="btn btn-lg btn-primary btn-lg-square rounded-circle" href=""><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid bg-dark text-light border-top border-secondary py-4">
        <div class="container">
            <div class="row g-5">
                <div class="col-md-6 text-center text-md-start">
                    <p class="mb-md-0">&copy; <a class="text-primary" href="#">Tai Yang Clinic</a>. All Rights Reserved.</p>

                </div>
            </div>
        </div>
    </div>



    <script src="js/bootstrap.bundle.min.js"></script>

</body>
</html>