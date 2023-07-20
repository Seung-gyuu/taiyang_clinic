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

        <link rel="apple-touch-icon" sizes="57x57" href="../src/img/favicon/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="../src/img/favicon/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="../src/img/favicon/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../src/img/favicon/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="../src/img/favicon/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../src/img/favicon/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="../src/img/favicon/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../src/img/favicon/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="../src/img/favicon/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192"  href="../src/img/favicon/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="../src/img/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="../src/img/favicon/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="../src/img/favicon/favicon-16x16.png">
        <link rel="manifest" href="../src/img/favicon/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">
        
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/vform.css">

        <!--google fonts -->

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

        <!--google material icon-->
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons"rel="stylesheet">

        <style>

            .popupText{
                font-weight: light;
                color: black;
                margin-bottom: 20px;
            }

            #confirm-content {
                width: 400px;
                background-color: #f3f3f3;
                padding: 20px;
                border-radius: 8px;     
                margin-bottom: 20px;
                height: 130px;
            }



            .cancelBtn {
                background-color: #979797;
                color: #fff;
                border: none;
                padding: 5px 10px;
                border-radius: 4px;
                cursor: pointer;
                font-weight: light;
                font-size: 13px;
                transition: background-color 0.3s ease;
                float: left;
                margin-right: 220px;

            }



            .confirmBtn {
                background-color: #0B486B;
                color: white;
                border: none;
                padding: 5px 10px;
                border-radius: 4px;
                cursor: pointer;
                font-weight: light;
                float: right;
                font-size: 13px;



            }


            .cancelBtn:hover {
                background-color: #c62828;
            }

            #javascriptmessage {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #496f53;
                /*                padding: 11px;*/
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
                border-radius: 3px;   
                text-align:center;
                color: white;

            }


            .show{
                margin-bottom: 15px;
            }

            .show-all-users {
                color: #ececec;
                background-color: #0B486B;
                padding: 5px 10px;
                border-radius: 4px;
                text-decoration: none;
                font-size:13px;

            }

            .show-all-users:hover {
                background-color: #076e95;
            }

            .view-button{
                background-color: #0B486B;
                color: white;
                border: none;
                padding: 4px 10px;
                border-radius: 4px;
                cursor: pointer;
                font-weight: light;
                font-size:13px;

            }


            .delete-button {
                background-color: #c62828;
                color: white;
                border: none;
                padding: 4px 10px;
                border-radius: 4px;
                cursor: pointer;
                font-weight: light;
                font-size:13px;

            }

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


            .cancelBtn {
                background-color: #979797;
                color: #fff;
                border: none;
                padding: 5px 10px;
                border-radius: 4px;
                cursor: pointer;
                font-weight: light;
                transition: background-color 0.3s ease;
                float: left;

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
                /*                padding: 11px;*/
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
                border-radius: 3px;   
                text-align:center;
                color: white;


            }


            input[type="search"]{
                /*                background-color:#f9f9f5;*/
                background-color: #f3f3f3;
                color:#fff;
                padding-left:20px;
                border:none;
                border-radius:50px 0px 0px 50px;
            }


            .xp-searchbar .btn{
                /*                background-color:#496f53;*/
                background-color:#4a5263;
                color:#fff;
                font-weight:600;
                font-size:18px;
                border-radius:0 50px 50px 0;
                padding:4px  15px;
            }


            .download-link{
                color: white;
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
                                <a href="home?logout" class="btn  me-2" style="color:#fff; border-bottom-color: #f9f9f5 ">Logout</a>
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
                                        <button id="page<%=pageNumber%>" onclick="showPage(<%= pageNumber%>)">Page <%= pageNumber%></button>
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


                                </c:if>


                                <c:if test="${userForm ne null}">


                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>${userForm.getFirstname()}</th>
                                                <th>${userForm.getLastname()}</th>
                                                <th>${userForm.getEmailAddress()}</th>
                                                <th>Time Added</th>
                                                <th>Forms</th>
                                                <th>Download</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${medicalforms}" var="mdform">
                                                <tr><td>${mdform.getUserid().getFirstname()}</td>
                                                    <td>${mdform.getUserid().getLastname()}</td>
                                                    <td>Medical Form</td>
                                                    <td>${mdform.getTimeAdded()}</td>
                                                    <td><button class="view-button" onclick="openPdfPopup('/viewForm?formId=${mdform.getId()}&form=1')">View</button></td>
                                                    <td> <a class="download-link" href="/downloadForm?formId=${mdform.getId()}&form=1&referer=${pageContext.request.requestURI}">Download</a></td>
                                                    <td><button class="delete-button" onclick="openDeleteConfirm(this.value, 'medical')" value="${mdform.getId()}">Delete</button></td>
                                                </tr>

                                            </c:forEach>
                                            <c:forEach items="${consentforms}" var="csform">
                                                <tr><td>${csform.getUserid().getFirstname()}</td>
                                                    <td>${csform.getUserid().getLastname()}</td>
                                                    <td>Consent Form</td>
                                                    <td>${csform.getTimeAdded()}</td>
                                                    <td><button class="view-button" onclick="openPdfPopup('/viewForm?formId=${csform.getId()}&form=2')">View</button></td>
                                                    <td> <a  class="download-link" href="/downloadForm?formId=${csform.getId()}&form=2&referer=${pageContext.request.requestURI}">Download</a></td>
                                                    <td><button class="delete-button" onclick="openDeleteConfirm(this.value, 'consent')" value="${csform.getId()}">Delete</button></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                    <div class="show">
                                        <a href="/vform" class="show-all-users">Show all users</a>    
                                    </div>

                                    <!-- Confirmation when delete form-->
                                    <div id="confirmPopup" class="confirmPopup">
                                        <div class="popup-content" id="confirm-content">

                                        </div>
                                    </div>
                                </c:if>
                                <div id="javascriptmessage">

                                </div>

                                <div class="clearfix">
                                    <div class="hint-text"></div>


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
                    <!--                     Confirmation when delete form
                                        <div id="confirmPopup" class="confirmPopup">
                                            <div class="popup-content" id="confirm-content">
                    
                                            </div>
                                        </div>-->



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

                                setTimeout(function () {
                                    var messageElement = document.getElementById('javascriptmessage');
                                    messageElement.style.display = 'none';

                                }, 3000);

                                $(document).ready(function () {
                                    $(".xp-menubar").on('click', function () {
                                        $('#sidebar').toggleClass('active');
                                        $('#content').toggleClass('active');
                                    });

                                    $(".xp-menubar,.body-overlay").on('click', function () {
                                        $('#sidebar,.body-overlay').toggleClass('show-nav');
                                    });

                                });


                                window.onload = setParam;

                                function setParam() {
                                    var urlParams = new URLSearchParams(window.location.search);

                                    // Get the value of the 'message' parameter
                                    var message = urlParams.get('message');

                                    // Set the message as the text content of the div
                                    var messageDiv = document.getElementById('javascriptmessage');
                                    messageDiv.textContent = message;
                                }



                                function openPdfPopup(url) {
                                    // Show the popup container
                                    var popupContainer = document.getElementById('pdfPopup');
                                    popupContainer.style.display = 'block';

                                    // Load the PDF using pdf.js
                                    var pdfViewer = document.getElementById('pdfViewer');
                                    pdfjsLib.getDocument(url).promise.then(function (pdf) {
                                        var totalPages = pdf.numPages;
                                        var renderedPages = 0; // Counter for rendered pages
                                        var renderedCanvasArray = []; // Array to store rendered canvas elements

                                        // Helper function to render a page
                                        function renderPage(pageNumber) {
                                            pdf.getPage(pageNumber).then(function (page) {
                                                var viewport = page.getViewport({scale: 1.0});
                                                var canvas = document.createElement('canvas');
                                                var context = canvas.getContext('2d');
                                                canvas.height = viewport.height;
                                                canvas.width = viewport.width;

                                                canvas.style.border = '1px solid black';

                                                var renderContext = {
                                                    canvasContext: context,
                                                    viewport: viewport
                                                };

                                                page.render(renderContext).promise.then(function () {
                                                    // Push the rendered canvas into the array
                                                    renderedCanvasArray.push({pageNumber: pageNumber, canvas: canvas});

                                                    renderedPages++; // Increment the counter

                                                    // Check if all pages have been rendered
                                                    if (renderedPages === totalPages) {
                                                        // Sort the rendered canvas array by page number
                                                        renderedCanvasArray.sort(function (a, b) {
                                                            return a.pageNumber - b.pageNumber;
                                                        });

                                                        // Append the sorted canvas elements to the PDF viewer
                                                        renderedCanvasArray.forEach(function (renderedPage) {
                                                            pdfViewer.appendChild(renderedPage.canvas);
                                                        });

                                                        // Scroll to the first page
                                                        pdfViewer.scrollTo(0, 0);
                                                    }
                                                });
                                            });
                                        }

                                        // Render pages in ascending order starting from page 1
                                        for (var pageNumber = 1; pageNumber <= totalPages; pageNumber++) {
                                            renderPage(pageNumber);
                                        }
                                    });

                                    document.addEventListener('click', closePopupOnClickOutside);
                                }
                                function closePopupOnClickOutside(event) {
                                    var popupContainer = document.getElementById('popup-content');

                                    if (popupContainer.contains(event.target)) {
                                        var popupContainer = document.getElementById('pdfPopup');
                                        popupContainer.style.display = 'none';
                                        document.removeEventListener('click', closePopupOnClickOutside);
                                        var pdfViewer = document.getElementById('pdfViewer');
                                        while (pdfViewer.firstChild) {
                                            pdfViewer.removeChild(pdfViewer.firstChild);
                                        }
                                    }
                                }
                                function closePopup() {
                                    // Hide the popup container
                                    var popupContainer = document.getElementById('pdfPopup');
                                    popupContainer.style.display = 'none';
                                    var pdfViewer = document.getElementById('pdfViewer');
                                    while (pdfViewer.firstChild) {
                                        pdfViewer.removeChild(pdfViewer.firstChild);
                                    }
                                }


                                function openDeleteConfirm(formID, formType) {
                                    var confirmContainer = document.getElementById('confirm-content');
                                    var output = "<div class='popupText'>Are you sure you want to delete this form?</div>";
                                    output += "<form method='post' action='vform'>";
                                    output += "<input type='hidden' value='" + formID + "' name='formId'>";
                                    output += "<input type='hidden' value='" + formType + "' name='form'>";
                                    output += "<input type='hidden' value='deleteform' name='action'>";
                                    output += "<button type='button' onclick='closeConfirmBox()' class='cancelBtn'>Cancel</button>";
                                    output += "<input type='submit' class='confirmBtn' value='Confirm'>";
                                    confirmContainer.innerHTML = output;
                                    document.getElementById('confirmPopup').style.display = 'block';
                                    popupBox.style.display = 'block';
                                }
                                function closeConfirmBox() {
                                    document.getElementById('confirmPopup').style.display = 'none';
                                }

        </script>

    </body>
</html>