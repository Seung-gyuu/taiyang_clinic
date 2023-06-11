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
        
        <c:import url="./components/header.jsp" />
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
                    <div class="history history_upcoming">
                        <h2>Upcoming Appointments</h2>
                        <table class="history_upcoming_table">
                            <thead>
                              <tr>
                                <th class="upcoming_head">Date</th>
                                <th class="upcoming_head">Treatment</th>
                                <th class="upcoming_head last_cell"></th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td class="upcoming_data">June 30, 2023 - 10:00am</td>
                                <td class="upcoming_data">Massage/luiNa</td>
                                <td class="upcoming_data last_cell cell_buttons">
                                    <button class="edit_btn">Reschedule</button>
                                    <button class="cancel_btn">Cancel</button>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                    </div>
                    
                    <div class="history history_old">
                        <h2>Appointments History</h2>
                        <table class="history_old_table">
                            <thead>
                              <tr>
                                <th class="old_head">Date</th>
                                <th class="old_head">Treatment</th>
                                <th class="old_head last_cell">Price</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td class="old_data">June 30, 2023 - 10:00am</td>
                                <td class="old_data">Massage/luiNa</td>
                                <td class="old_data last_cell">
                                  $80.00
                                </td>
                              </tr>
                               <tr>
                                <td class="old_data">June 30, 2023 - 10:00am</td>
                                <td class="old_data">Massage/luiNa</td>
                                <td class="old_data last_cell">
                                  $80.00
                                </td>
                              </tr>
                               <tr>
                                <td class="old_data">June 30, 2023 - 10:00am</td>
                                <td class="old_data">Massage/luiNa</td>
                                <td class="old_data last_cell">
                                  $80.00
                                </td>
                              </tr>
                               <tr>
                                <td class="old_data">June 30, 2023 - 10:00am</td>
                                <td class="old_data">Massage/luiNa</td>
                                <td class="old_data last_cell">
                                  $80.00
                                </td>
                              </tr>
                               <tr>
                                <td class="old_data">June 30, 2023 - 10:00am</td>
                                <td class="old_data">Massage/luiNa</td>
                                <td class="old_data last_cell">
                                  $80.00
                                </td>
                              </tr>
                               <tr>
                                <td class="old_data">June 30, 2023 - 10:00am</td>
                                <td class="old_data">Massage/luiNa</td>
                                <td class="old_data last_cell">
                                  $80.00
                                </td>
                              </tr>
                               <tr>
                                <td class="old_data">June 30, 2023 - 10:00am</td>
                                <td class="old_data">Massage/luiNa</td>
                                <td class="old_data last_cell">
                                  $80.00
                                </td>
                              </tr>
                               <tr>
                                <td class="old_data">June 30, 2023 - 10:00am</td>
                                <td class="old_data">Massage/luiNa</td>
                                <td class="old_data last_cell">
                                  $80.00
                                </td>
                              </tr>
                            </tbody>
                          </table>
                    </div>
                </div>
            </div>
        </div>  
   
    </div>
    </body>
    
     <footer>
        <jsp:include page="./components/footer.jsp" />
        <%--<%@include file="./components/footer.jsp"%>--%>
        <%--<c:import url="./components/footer.jsp" />--%>
    </footer>
</html>