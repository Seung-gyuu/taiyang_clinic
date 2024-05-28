<%@page import="java.util.List"%>
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
        <link rel="apple-touch-icon" sizes="57x57" href="src/img/favicon/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="src/img/favicon/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="src/img/favicon/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="src/img/favicon/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="src/img/favicon/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="src/img/favicon/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="src/img/favicon/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="src/img/favicon/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="src/img/favicon/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192"  href="src/img/favicon/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="src/img/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="src/img/favicon/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="src/img/favicon/favicon-16x16.png">
        <link rel="manifest" href="src/img/favicon/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/aform.css">

        <!--google fonts -->

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

        <!--google material icon-->
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons"rel="stylesheet">
        <style>

            .pageNumbers {
                margin-top: 10px;
                text-align: center;
            }




            .pageNumbers button{

                margin-bottom: 10px;
                font-size:13px;
                border:none;
                color: #666;
                padding: 0 6px;
                text-align:center;
                border-radius: 2px;
                transition: background-color 0.3s ease-in;
            }

            .borderless-button {
                background-color: #0B486B;
                border-color: #0B486B;
                padding: 3px 7px;
                cursor: pointer;
                margin-right: 20px;
                font-color: white;
                color: white;
                border-radius: 4px;
                transition: none; 

            }

     
            #popupBox {
                width: 500px;
                background-color: #f3f3f3;
                padding: 20px;
                border-radius: 8px;     
            }

            .popupText {
                font-weight: light;
                color: black;
                margin-bottom: 10px;
            }

            .popupBtns {
                margin-top: 20px;
                display: flex;
                justify-content: space-between;

            }

            .cancelBtn {
                background-color: #979797;
                color: #fff;
                border: none;
                padding: 5px 10px;
                border-radius: 4px;
                cursor: pointer;
                font-weight: light;

                transition: background-color 0.3s ease;
                margin-right: auto;
            }

            .cancelBtn:hover {
                background-color: #c62828;
            }

            .addFormBtn {
                background-color: #0B486B;
                color: #0B486B;
                color: white;
                border: none;
                padding: 5px 10px;
                border-radius: 4px;
                cursor: pointer;
                font-weight: light;


            }

            #message{
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #496f53;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
                border-radius: 3px;   
                text-align:center;
                color: white;


            }


            input[type="search"]{
                background-color: #f3f3f3;
                color:#fff;
                padding-left:20px;
                border:none;
                border-radius:50px 0px 0px 50px;
            }


            .xp-searchbar .btn{
                background-color:#4a5263;
                color:#fff;
                font-weight:600;
                font-size:18px;
                border-radius:0 50px 50px 0;
                padding:4px  15px;
            }







        </style>
    </head>
    <body>


        <div class="wrapper">

            <div class="body-overlay"></div>

            <!-- Sidebar  -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3><img src="src/img/ClinicLogo.png" class="img-fluid"/><span>Tai Yang Clinic</span></h3>
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
                        <a href="analytics" data-toggle="collapse" aria-expanded="false" 
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
                                <a href="/home" class="btn me-2" style="color:#fff; border-bottom-color: #f9f9f5 ">Home</a>
                                <a href="home?logout" class="btn  me-2" style="color:#fff; border-bottom-color: #f9f9f5">Logout</a>
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
                                            <h2 class="ml-lg-2">Add Forms</h2>
                                        </div>

                                    </div>
                                </div>

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
                                                <td>
                                                    <button name="addForm" onClick="formPopUp(${user.getUserid()})" class="borderless-button">Add Form</button>
                                                    <a href="vform?userId=${user.getUserid()}">View forms</a>
                                                </td>
                                            </tr>
                                            <% loopIndex++; %>
                                        </c:forEach>
                                    </tbody>

                                </table>



                                <div class="pageNumbers">
                                    <% for (int pageNumber = 1; pageNumber <= totalPages; pageNumber++) {%>
                                    <button id="page<%=pageNumber%>" onclick="showPage(<%= pageNumber%>)" >Page <%= pageNumber%></button>
                                    <% }%>
                                </div>




                                <script>
                                    const userRows = document.querySelectorAll('.userRow');
                                    const rowsPerPage = 10;
                                    let currentPage = 1;

                                    function showPage(pageNumber) {
                                        document.getElementById('searchterm').value = "";
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

                                        // Reset styles for all buttons
                                        const pageButtons = document.querySelectorAll('.pageNumbers button');
                                        pageButtons.forEach(function (button) {
                                            button.style.backgroundColor = '';
                                            button.style.color = '';
                                        });

                                        // Apply styles to the clicked button
                                        const clickedButton = document.getElementById('page' + pageNumber);
                                        clickedButton.style.backgroundColor = 'grey';
                                        clickedButton.style.color = 'white';
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




                                <div id="popupBox" style="display: none;"> 
                                    <div id="popupContent"></div>
                                </div>
                                <div id ="message">
                                    ${message}
                                </div>

                            </div>
                        </div>


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




        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/aform.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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

                                    setTimeout(function () {
                                        var messageElement = document.getElementById('message');
                                        messageElement.style.display = 'none';
                                    }, 3000);

                                    var users = [
                                        {firstName: "John", lastName: "Doe", email: "john.doe@example.com", phoneNumber: "1234567890", consentForm: "", medicalForm: ""},
                                        {firstName: "Jane", lastName: "Smith", email: "jane.smith@example.com", phoneNumber: "9876543210", consentForm: "", medicalForm: ""}
                                    ];

                                    var searchUserInput = document.getElementById("searchUserInput");
                                    var searchUserBtn = document.getElementById("searchUserBtn");
                                    var userTableBody = document.getElementById("userTableBody");
                                    var formsSection = document.getElementById("formsSection");
                                    var consentFormTextarea = document.getElementById("consentFormTextarea");
                                    var medicalFormTextarea = document.getElementById("medicalFormTextarea");
                                    var uploadButton = document.getElementById("uploadButton");
                                    var saveButton = document.getElementById("saveButton");

                                    searchUserBtn.addEventListener("click", function () {
                                        var searchTerm = searchUserInput.value.trim().toLowerCase();
                                        var matchedUsers = users.filter(function (user) {
                                            var fullName = user.firstName.toLowerCase() + " " + user.lastName.toLowerCase();
                                            return fullName.includes(searchTerm);
                                        });

                                        displayUserTable(matchedUsers);
                                    });

                                    function displayUserTable(users) {
                                        userTableBody.innerHTML = "";

                                        users.forEach(function (user) {
                                            var row = document.createElement("tr");

                                            var firstNameCell = document.createElement("td");
                                            firstNameCell.textContent = user.firstName;
                                            row.appendChild(firstNameCell);

                                            var lastNameCell = document.createElement("td");
                                            lastNameCell.textContent = user.lastName;
                                            row.appendChild(lastNameCell);

                                            var emailCell = document.createElement("td");
                                            emailCell.textContent = user.email;
                                            row.appendChild(emailCell);

                                            var phoneNumberCell = document.createElement("td");
                                            phoneNumberCell.textContent = user.phoneNumber;
                                            row.appendChild(phoneNumberCell);

                                            var actionsCell = document.createElement("td");
                                            var viewButton = document.createElement("button");
                                            viewButton.className = "btn btn-primary";
                                            viewButton.textContent = "View";
                                            viewButton.addEventListener("click", function () {
                                                displayForms(user);
                                            });
                                            actionsCell.appendChild(viewButton);

                                            row.appendChild(actionsCell);

                                            userTableBody.appendChild(row);
                                        });
                                    }

                                    function displayForms(user) {
                                        consentFormTextarea.value = user.consentForm;
                                        medicalFormTextarea.value = user.medicalForm;

                                        formsSection.style.display = "block";

                                        uploadButton.addEventListener("click", function () {

                                            alert("File uploaded successfully!");
                                        });

                                        saveButton.addEventListener("click", function () {

                                            alert("Form saved successfully!");
                                        });
                                    }


                                    function formPopUp(userId) {
                                        fetch('/getUserInfo?userId=' + userId)
                                                .then(response => response.json())
                                                .then(data => {
                                                    var firstName = data.firstName;
                                                    var lastName = data.lastName;
                                                    var email = data.email;
                                                    var userId = data.userId;
                                                    // Get the reference to your popup box element
                                                    var popupBox = document.getElementById('popupBox');

                                                    //                var span = document.getElementsByClassName("book_close")[0];

                                                    // Update the content of the popup box with the retrieved day name and month name
                                                    var output = "<div class='popupText'> Add Form for  " + firstName + ", " + lastName + " <br>" + email + "?</div>";
                                                    output += "<form method='post' action='aform'  enctype='multipart/form-data'>";
                                                    output += "<input type='hidden' name='action' value='addForm' >";
                                                    output += "<input type='hidden' name='userId' value='" + userId + "'>";
                                                    output += "<input type='radio' name='formType' value='medical'> Medical Form <br>";
                                                    output += "<input type='radio' name='formType' value='consent'> Consent Form <br>";
                                                    output += "<br><input type='file' name='pdfFile' accept='application/pdf'>";
                                                    output += "<br>" + "<div class='popupBtns'><button onclick='cancel()' value='Cancel' class='cancelBtn'>Cancel</button>";
                                                    output += "<input type='submit' class ='addFormBtn' value='Add Form'></form></div>";
                                                    //                popupBox.innerHTML = output;
                                                    document.getElementById('popupContent').innerHTML = output;

                                                    // Show the popup box
                                                    popupBox.style.display = 'block';
                                                })
                                                .catch(error => {
                                                    // Handle any error that occurs during the request
                                                    console.error('Error:', error);
                                                });
                                    }

                                    function cancel() {
                                        var popupBox = document.getElementById('popupBox');
                                        popupBox.style.display = 'none';
                                        document.getElementById('popupContent').innerHTML = "";
                                    }


        </script>

    </body>
</html>
