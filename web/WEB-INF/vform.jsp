<%@page import="java.util.List"%>
<%@page import="models.User"%>
<%@page import="models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
        <title>Tai Yang Clinic</title>

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/vform.css">
        <!--        <script src="js/ausers.js"></script>-->

        <!--google fonts -->

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

        <!--google material icon-->
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons"rel="stylesheet">

        <style>

        </style>

    </head>
    <body>


        <div class="wrapper">

            <div class="body-overlay"></div>

            <!-- Sidebar  -->
            <nav id="sidebar">

                <div class="sidebar-header">
                    <h3><img src="logo" class="img-fluid"/><span>Tai Yang Clinic</span></h3>
                </div>
                <ul class="list-unstyled components">
                    <li  class="active">
                        <a href="admin" class="dashboard"><i class="material-icons">dashboard</i>
                            <span>Today</span></a>
                    </li>


                    <li class="dropdown">
                        <a href="ausers" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">aspect_ratio</i>Users</a>
                    </li>

                    <li class="dropdown">
                        <a href="aavailability" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">library_books</i><span>Availability</span></a>
                    </li>

                    <li class="dropdown">
                        <a href="aform" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">border_color</i><span>Add Form</span></a>
                    </li>

                    <li class="dropdown">
                        <a href="vform" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">extension</i><span>View Form</span></a>
                    </li>

                    <li class="dropdown">
                        <a href="viewappointment" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">apps</i><span>View Appointments</span></a>
                    </li>

                    <li class="dropdown">
                        <a href="areport" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">grid_on</i><span>Reports</span></a>
                        <ul class="collapse list-unstyled menu" id="pageSubmenu6">
                    </li>
                </ul>
            </nav>




            <div id="content">

                <!--top--navbar--->

                <div class="top-navbar">
                    <div class="xp-topbar">
                        <div class="row"> 
                            <div class="col-2 col-md-1 col-lg-1 order-2 order-md-1 align-self-center">
                                <div class="xp-menubar">
                                    <span class="material-icons text-white">signal_cellular_alt
                                    </span>
                                </div>
                            </div> 
                            <div class="col-10 col-md-11 col-lg-11 order-1 order-md-2 text-end">
                                <a href="/home" class="btn btn-primary me-2">Home</a>
                                <a href="home?logout" class="btn btn-danger me-2">Logout</a>
                            </div>
                        </div> 
                    </div>
                    <div class="xp-breadcrumbbar text-center">
                        <h4 class="page-title">Dashboard</h4>               
                    </div>
                </div>




                <!--------main-content------------->
                <div class="my-4"></div>
                <div class="col-md-5 col-lg-3 mx-auto order-3 order-md-2">
                    <div class="xp-searchbar">
                        <form>
                            <div class="input-group">
                                <input type="search" class="form-control" id="searchterm" placeholder="Search By First Name" oninput="handleSearch(this.value)" />
                                <div class="input-group-append">
                                    <button class="btn" type="submit" 
                                            id="button-addon2">GO</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="main-content">
                    <div class="row">

                        <div class="col-md-12">
                            <div class="table-wrapper">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-sm-6 p-0 d-flex justify-content-lg-start justify-content-center">
                                            <h2 class="ml-lg-2">View Forms</h2>
                                            <!--                                            <div class="show">
                                                                                            <a href="/vform" class="show-all-users">Show all users</a>    
                                                                                        </div>-->
                                        </div>

                                    </div>
                                </div>
                                <c:if test="${userForm eq null}">


                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Forms</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% int usersPerPage = 10; %>
                                        <% List<User> userList = (List<User>) request.getAttribute("userList"); %>
                                        <% int totalUsers = userList.size(); %>
                                        <% int totalPages = (int) Math.ceil((double) totalUsers / usersPerPage); %>
                                        <% int currentPage = 1; %>
                                        <% String pageParam = request.getParameter("page"); %>
                                        <% if (pageParam != null && !pageParam.isEmpty()) { %>
                                        <% currentPage = Integer.parseInt(pageParam); %>
                                        <% } %>
                                        <% int startIndex = (currentPage - 1) * usersPerPage; %>
                                        <% int endIndex = Math.min(startIndex + usersPerPage, totalUsers);%>
                                        <% int loopIndex = 0; %>
                                            
                                            
                                            
                                            <c:forEach items="${userList}" var="user">
                                                <tr class="userRow <% if (loopIndex >= startIndex && loopIndex < endIndex) { %>active<% } %>">
                                                    <td>${user.getFirstname()}</td>
                                                    <td>${user.getLastname()}</td>
                                                    <td>${user.getEmailAddress()}</td>
                                                    <td>${user.getPhoneNumber()}</td>
                                                    <td> <a href="/vform?userId=${user.getUserid()}">View Forms</a></td>
                                                </tr>
                                                <% loopIndex++; %>
                                                </c:forEach>
                                        </tbody>

                                    </table>
                                <div class="pageNumbers">
                                    <% for (int pageNumber = 1; pageNumber <= totalPages; pageNumber++) {%>
                                    <button onclick="showPage(<%= pageNumber%>)">Page <%= pageNumber%></button>
                                    <% }%>
                                </div>
                                
                                <script>
                                    const userRows = document.querySelectorAll('.userRow');
                                    const rowsPerPage = 10;
                                    let currentPage = 1;

                                    function showPage(pageNumber) {
                                        document.getElementById('searchterm').value="";
                                        const startIndex = (pageNumber - 1) * rowsPerPage;
                                        const endIndex = startIndex + rowsPerPage;

                                        userRows.forEach(function (row, index) {
                                            if (index >= startIndex && index < endIndex) {
                                                row.style.display = 'table-row';
                                            } else {
                                                row.style.display = 'none';
                                            }
                                        });

                                        currentPage = pageNumber;
                                    }

                                    function handleSearch(searchTerm) {
                                        searchTerm = searchTerm.toLowerCase();

                                        if (searchTerm === '') {
                                            showPage(1); // Display the first page with all users
                                            return; // Exit the function
                                        }

                                        userRows.forEach(function (row) {
                                            const firstName = row.querySelector('td:first-child').textContent.toLowerCase();
                                            if (firstName.includes(searchTerm)) {
                                                row.style.display = 'table-row';
                                            } else {
                                                row.style.display = 'none';
                                            }
                                        });

                                        // Hide all rows on other pages
                                        const currentPageRows = Array.from(document.querySelectorAll('.userRow.active'));
                                        currentPageRows.forEach(function (row) {
                                            if (!row.style.display) {
                                                row.style.display = 'none';
                                            }
                                        });
                                    }

                                    // Show the first page on initial load
                                    showPage(1);
                                </script>
                                
                                
                                </c:if>

                                <c:if test="${userForm ne null}">


                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>${userForm.getFirstname()}</th>
                                                <th>${userForm.getLastname()}</th>
                                                <th>${userForm.getEmailAddress()}</th>
                                                <th>Time Added</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${medicalforms}" var="mdform">
                                                <tr><td>${mdform.getUserid().getFirstname()}</td>
                                                    <td>${mdform.getUserid().getLastname()}</td>
                                                    <td>Medical Form</td>
                                                    <td>${mdform.getTimeAdded()}</td>
                                                    <td><button onclick="openPdfPopup('/viewForm?formId=${mdform.getId()}&form=1')">View</button></td>
                                                    <td> <a href="/downloadForm?formId=${mdform.getId()}&form=1&referer=${pageContext.request.requestURI}">Download</a></td>
                                                    <td><button onclick="openDeleteConfirm(this.value, 'medical')" value="${mdform.getId()}">Delete</button></td>
                                                </tr>

                                            </c:forEach>
                                            <c:forEach items="${consentforms}" var="csform">
                                                <tr><td>${csform.getUserid().getFirstname()}</td>
                                                    <td>${csform.getUserid().getLastname()}</td>
                                                    <td>Consent Form</td>
                                                    <td>${csform.getTimeAdded()}</td>
                                                    <td><button onclick="openPdfPopup('/viewForm?formId=${csform.getId()}&form=2')">View</button></td>
                                                    <td> <a href="/downloadForm?formId=${csform.getId()}&form=2&referer=${pageContext.request.requestURI}">Download</a></td>
                                                    <td><button onclick="openDeleteConfirm(this.value, 'consent')" value="${csform.getId()}">Delete</button></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="show">
                                        <a href="/vform" class="show-all-users">Show all users</a>    
                                    </div>
                                </c:if>
                                <div id="javascriptmessage">
                                    
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <!-- The popup container -->
                <div id="pdfPopup" class="popup">
                    <div class="popup-content" id="popup-content">
                        <div class="pdf-container">
                            <div id="pdfViewer" class="pdfViewer"></div>
                        </div>
                        <span class="popup-close" onclick="closePopup()">&times;</span>
                    </div>
                </div>
                <!-- Confirmation when delete form-->
                <div id="confirmPopup" class="confirmPopup">
                    <div class="popup-content" id="confirm-content">
                        
                    </div>
                </div>



                <!--start footer-->
                <div class="my-5"></div>
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="footer-in">
                            <p class="mb-0">&copy Tai Yang Clinic. All Rights Reserved.</p>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.11.338/pdf.min.js"></script>
    <script src="js/vform.js"></script>

    <script type="text/javascript">

                            $(document).ready(function () {
                                $(".xp-menubar").on('click', function () {
                                    $('#sidebar').toggleClass('active');
                                    $('#content').toggleClass('active');
                                });

                                $(".xp-menubar,.body-overlay").on('click', function () {
                                    $('#sidebar,.body-overlay').toggleClass('show-nav');
                                });

                            });

    </script>

</body>
</html>