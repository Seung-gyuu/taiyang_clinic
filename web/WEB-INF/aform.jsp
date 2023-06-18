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
        <link rel="stylesheet" href="css/aform.css">
        <!--        <script src="js/ausers.js"></script>-->

        <!--google fonts -->

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

        <!--google material icon-->
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons"rel="stylesheet">


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
                            <span>Todays</span></a>
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
                                <a href="" class="btn btn-danger me-2">Logout</a>
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
                                <input type="search" class="form-control" 
                                       placeholder="Search">
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
                                        <div class="col-sm-6 p-0 d-flex justify-content-lg-end justify-content-center">
                                            <a href="" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#consentFormModal" >
                                                <i class="material-icons">&#xE147;</i> <span>Add Consent Form</span></a>
                                            <a href="" class="btn btn-primary"data-bs-toggle="modal" data-bs-target="#medicalFormModal" >
                                                <i class="material-icons">&#xE147;</i> <span>Add Medical Form</span></a>
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
                                        <tr>

                                            <td>Euna</td>
                                            <td>Kim</td>
                                            <td>rladmsdk2068@gmail.com</td>
                                            <td>1234567890</td>
                                            <td>
                                                <a href="" class="" data-toggle="modal">
                                                    <i class="material-icons" data-toggle="tooltip" title="">&#xf1c4;</i></a>
                                                <a href="" class="" data-toggle="modal">
                                                    <i class="material-icons" data-toggle="tooltip" title="">&#xf1c3;</i></a>
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                                <div class="clearfix">
                                    <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                                    <ul class="pagination">
                                        <li class="page-item disabled"><a href="#">Previous</a></li>
                                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                                        <li class="page-item active"><a href="#" class="page-link">3</a></li>
                                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="consentFormModal" tabindex="-1" aria-labelledby="consentFormModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="consentFormModalLabel">Add Consent Form</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <label for="description">Consent Form:</label>
                                        <input type="text" id="description" class="form-control" placeholder="Please upload the file here">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary" onclick="uploadForm()">Upload</button>
                                        <button type="button" class="btn btn-success" onclick="saveForm()">Save</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="medicalFormModal" tabindex="-1" aria-labelledby="medicalFormModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="medicalFormModalLabel">Add Medical Form</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <label for="description">Medical Form:</label>
                                        <input type="text" id="description" class="form-control" placeholder="Please upload the file here">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary" onclick="uploadForm()">Upload</button>
                                        <button type="button" class="btn btn-success" onclick="saveForm()">Save</button>
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
            </div>

            <script>
                function uploadForm() {
                    // Handle form upload logic here
                    alert("Form uploaded successfully!");
                    $('#consentFormModal').modal('hide'); // Close the modal
                }

                function saveForm() {
                    // Handle form save logic here
                    alert("Form saved successfully!");
                    $('#consentFormModal').modal('hide'); // Close the modal
                }
            </script>


            <script src="js/bootstrap.bundle.min.js"></script>

    </body>
</html>

<!--                    <div id="formsSection" style="display: none;">
                        <div id="consentFormSection">
                            <h3>Consent Form:</h3>
                            <textarea class="form-control" id="consentFormTextarea" rows="5" readonly></textarea>
                        </div>

                        <div id="medicalFormSection">
                            <h3>Medical Form:</h3>
                            <textarea class="form-control" id="medicalFormTextarea" rows="5" readonly></textarea>
                        </div>

                        <div class="mt-3 d-flex justify-content-between">
                            <button class="btn btn-primary" id="uploadButton">Upload</button>
                            <button class="btn btn-success" id="saveButton">Save</button>
                        </div>
                    </div>-->