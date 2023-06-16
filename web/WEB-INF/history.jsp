<%-- 
    Document   : history
    Created on : 2023. 6. 6, 오전 1:18:37
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>

        <link rel="stylesheet" type="text/css" href="css/global.css">
        <link rel="stylesheet" type="text/css" href="css/history.css">
        <script src="https://kit.fontawesome.com/b0274adb94.js" crossorigin="anonymous"></script>


        <!--        Libraries Stylesheet -->  
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   



        <c:import url="./components/headers.jsp" />
    </head>
    <body>
        <!--History Start-->
        <div class="gloabal_container">
            <div class="gloabal_top_section">
                <h1>MY ACCOUNT</h1>
                <!--<%out.println(request.getRequestURL());%>-->
                <!--${pageContext.request.requestURI}-->
            </div>
            <div class="account_container">

                <div class="account_side">
                    <%@include file="./components/accountSidebar.jsp"%>
                </div>
                <div class="account_main">
                    <div class="history_wrapper">
                        <div class="history_title history_upcoming">
                            <h2>Upcoming Appointments</h2>

                            <c:if test="${message ne 'empty'}">                               
                                <table class="history_upcoming_table">
                                    <thead>
                                        <tr>
                                            <th class="upcoming_head">Date</th>
                                            <th class="upcoming_head">Time</th>
                                            <th class="upcoming_head">Treatment</th>
                                            <th class="upcoming_head last_cell"></th>
                                        </tr>
                                    </thead>               
                                    <tbody>    
                                        <c:forEach items="${upcomings}" var="upcoming">                           
                                            <tr>     
                                                <!--appointment date--> 
                                                <td class="upcoming_data">
                                                    <c:out value="${upcoming.timeid.getFulldate()}"  />
                                                   </td>
                                                <td class="upcoming_data">
                                                    <c:out value="${upcoming.timeid.getTruncatedStartTime()}"  /> 
                                                    - <c:out value="${upcoming.timeid.getTruncatedEndTime()}"  />
                                                </td>       
                                                <!--service name-->
                                                <td class="upcoming_data"> 
                                                    <c:out value="${upcoming.serviceid.serviceName}"  />
                                                </td>


                                                <!--appointment ID--> 
                                                <td class="upcoming_data appointment-id" hidden>${upcoming.appointmentid}</td>
                                                <!--...-->


                                                <!--<button class="edit_btn">Reschedule</button>-->
                                                <!--                                                    <input type="hidden" name="action" value="delete">
                                                                                                    <input type="hidden" name="appointmentid" value="${appointmentid}">-->

                                                <td class="upcoming_data last_cell cell_buttons">
                                                    <button type="button" data-bs-toggle="modal" data-bs-target="#myModal"> Cancel Appointment</button>
                                                </td> 

                                            </tr>     
                                        </c:forEach>
                                    </tbody>
                                </table> 
                            </c:if>
                        </div>
                        <p>${message}</p>


                        <div class="history_title history_old">
                            <h2>Appointments History</h2>
                            <table class="history_old_table">
                                <thead>
                                    <tr>
                                        <th class="old_head">Date</th>
                                        <th class="old_head">Time</th>
                                        <th class="old_head">Treatment</th>
                                        <th class="old_head last_cell">Report</th>
                                    </tr>
                                </thead>   
                                <tbody>    
                                    <c:forEach items="${pasts}" var="past">                           
                                        <tr>     
                                            <!--appointment date--> 
                                            <td class="old_data">
                                                <c:out value="${past.timeid.getFulldate()}"  /></td>
                                            <td class="old_data">
                                                <c:out value="${past.timeid.getTruncatedStartTime()}"  /> 
                                                - <c:out value="${past.timeid.getTruncatedEndTime()}"  />
                                            </td>       
                                            <!--service name-->
                                            <td class="old_data"> 
                                                <c:out value="${past.serviceid.serviceName}"  />
                                            </td>
                                            <!--after report?-->
                                            <td class="old_data last_cell cell_buttons">
                                                <!--<button class="edit_btn">Reschedule</button>-->
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="appointmentid" value="${appointmentid}">
                                                <a href="<c:url value='/history?action=delete&amp;'> 
                                                       <c:param name='appointmentid' value='${past.appointmentid}'/> 
                                                   </c:url>" class="cancel_btn" id="myBtn" > Cancel Appointment
                                                </a>
                                            </td> 
                                        </tr>     
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>  

        </div>


        <div class="modal fade" id="myModal" aria-hidden="true" aria-labelledby="myModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="myModal">Canceling the Appointment</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to cancel this appointment?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <form action="/history" method="GET">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="appointmentid" id="appointmentidInput" value="${upcoming.appointmentid}">
                            <button type="submit" class="btn btn-primary">Cancel Appointment</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                $(".cancel-btn").click(function () {
                    var appointmentId = $(this).closest("tr").find(".appointment-id").text();
                    $("#appointmentidInput").val(appointmentId);
                    $("#myModal").modal("show");
                });
            });

        </script>




        <script src="js/bootstrap.bundle.min.js"></script>
        <footer>
            <jsp:include page="./components/footer.jsp" />
        </footer>
    </body>
</html>