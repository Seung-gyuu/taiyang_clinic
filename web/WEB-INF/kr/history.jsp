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

        <link rel="stylesheet" type="text/css" href="../css/global.css">
        <link rel="stylesheet" type="text/css" href="../css/history.css">
        <script src="https://kit.fontawesome.com/b0274adb94.js" crossorigin="anonymous"></script>


        <!--        Libraries Stylesheet -->  
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   



        <c:import url="../components/headersKR.jsp" />
    </head>
    <body>
        <!--History Start-->
        <div class="gloabal_container">
            <div class="gloabal_top_section">
                <h1>내 예약 목록</h1>
                <!--<%out.println(request.getRequestURL());%>-->
                <!--${pageContext.request.requestURI}-->
            </div>
            <div class="account_container">

                <div class="account_side">
                    <%@include file="../components/accountSidebarKR.jsp"%>
                </div>
                <div class="account_main">
                    <div class="history_wrapper">
                        <div class="history_title history_upcoming">
                            <h4><i class="fa-solid fa-clock"  style="color:#03A9F4"></i>예정된 예약목록</h4>

                            <table class="history_upcoming_table">
                                <thead>
                                    <tr>
                                        <th class="upcoming_head">날짜</th>
                                        <th class="upcoming_head">시간</th>
                                        <th class="upcoming_head">치료 내용</th>
                                        <th class="upcoming_head last_cell"></th>
                                    </tr>
                                </thead>               
                                <tbody>
                                    <c:if test="${upcoming_message eq 'empty'}">
                                        <tr>
                                            <td colspan="4" style="text-align: center">예정된 예약이 없습니다.</td>
                                        </tr>
                                    </c:if>
                                    <c:if test="${upcoming_message ne 'empty'}">   
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
                                                <td class="upcoming_data appointmentid" hidden>${upcoming.appointmentid}</td>
                                                <td class="upcoming_data last_cell cell_buttons">
                                                    <button type="button" data-bs-toggle="modal" data-bs-target="#myModal">예약 취소하기</button>
                                                </td> 

                                            </tr>     
                                        </c:forEach>
                                    </tbody> 
                                </c:if>
                            </table> 
                        </div>
                        <p>${message}</p>


                        <div class="history_title history_old">
                            <!--<h2>지난 예약 목록</h2>-->
                            <h4><i class="fa-solid fa-clock-rotate-left" style="color:gray"></i>지난 예약 목록</h4>   
                            <table class="history_old_table">
                                <thead>
                                    <tr>
                                        <th class="old_head">날짜</th>
                                        <th class="old_head">시간</th>
                                        <th class="old_head last_cell">치료 내용</th>
                                        <!--<th class="old_head last_cell">Report</th>-->
                                    </tr>
                                </thead>   
                                <tbody>
                                    <c:if test="${past_message eq 'empty'}">
                                        <tr>
                                            <td colspan="3" style="text-align: center">지난 예약 내역이 없습니다.</td>
                                        </tr>
                                    </c:if>
                                    <c:if test="${past_message ne 'empty'}">   
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
                                                <td class="old_data last_cell"> 
                                                    <c:out value="${past.serviceid.serviceName}"  />
                                                </td>
                                                <!--after report?-->
                                            </tr>     
                                        </c:forEach>
                                    </tbody>
                                </c:if>
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
                        <h5 class="modal-title" id="myModal">Canceling the Appointment KOREAN SIDE</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to cancel this appointment?  KOREAN</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <form action="/${language}/history" method="POST">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="appointmentid" id="appointmentidInput">
                            <button type="submit" class="btn btn-primary cancel-btn">Cancel Appointment</button>       
                        </form>

                    </div>
                </div>
            </div>
        </div>


        <script>

            $(document).ready(function () {
                $(".upcoming_data.last_cell.cell_buttons button").click(function () {
                    var appointmentId = $(this).closest("tr").find(".appointmentid").text();
                    $("#appointmentIdSpan").text(appointmentId);
                    $("#appointmentidInput").val(appointmentId);
                    $("#myModal").modal("show");
                });
            });
        </script>
        <script src="../js/showMessage.js"></script>
        <script>
    $(document).ready(function () {
        <% if (session.getAttribute("deleteAppt") != null && (boolean) session.getAttribute("deleteAppt")) { %>
            // Call the showMessage function to display the pop-up message
            <% if (session.getAttribute("language").equals("en")) { %>
                showMessage("Your Appointment successfully deleted.");
            <% } else if (session.getAttribute("language").equals("kr")) { %>
                showMessage("귀하의 약속이 성공적으로 삭제되었습니다.");
            <% } %>
            <% session.removeAttribute("deleteAppt"); %> // Remove the flag from the session
        <% } %>

        <% if (session.getAttribute("failCancelAppt") != null && (boolean) session.getAttribute("failCancelAppt")) { %>
            // Call the showMessage function to display the pop-up message
            <% if (session.getAttribute("language").equals("en")) { %>
                showMessage("You cannot delete an appointment that is scheduled for tomorrow or within the next 24 hours. Please Check cancellation policy.");
            <% } else if (session.getAttribute("language").equals("kr")) { %>
                showMessage("내일 또는 다음 24시간 이내로 예정된 약속은 삭제할 수 없습니다. 취소 정책을 확인하십시오.");
            <% } %>
            <% session.removeAttribute("failCancelAppt"); %> // Remove the flag from the session
        <% } %>
    });
</script>

        <!--<script src="../js/bootstrap.bundle.min.js"></script>-->
        <footer>
            <jsp:include page="../components/footerKR.jsp" />
        </footer>
    </body>
</html>