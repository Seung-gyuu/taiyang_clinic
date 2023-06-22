<%-- 
    Document   : book
    Created on : 2023. 6. 5, 오전 12:53:35
    Author     : third
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>
        <link rel="stylesheet" type="text/css" href="css/global.css">
        <link rel="stylesheet" type="text/css" href="css/booktest.css">
        <script src="https://kit.fontawesome.com/b0274adb94.js" crossorigin="anonymous"></script>
<!--        <script src="js/bookingpage.js"></script>-->

        <c:import url="./components/headers.jsp" />
    </head>
    <body>
        <c:if test="${weekCounter eq null}">
            <input type="hidden" value="0" id="weekCounter" name="weekCounter"> 
        </c:if>
        <c:if test="${weekCounter ne null}">
            <input type="hidden" value="${weekCounter}" id="weekCounter" name="weekCounter"> 
        </c:if>
       <!-- will put this into a form so that when form submitted, it can reset the value
                                                                            of this and then JS can put the calendar back to where it was. >
        <!--Book Start-->
        <div class="gloabal_container">
            <div class="global_top_section">
                <div class="leftArrow">
                    <button onclick="goLeft()">&leftarrow;</button>
                </div>
                <h1>BOOK AN APPOINTMENT</h1>
                <div class="rightArrow">
                    <button onclick="goRight()">&rightarrow;</button>
                </div>
                
            </div>
            
            
            <div class="fullCalendar">
                <div class="TimesLeft">
                    <div class="book_table_time">
                            <div class="table_header header_time"></div>
                            <div class="table_time">8:00am</div>
                            <div class="table_time">9:00am</div>
                            <div class="table_time">10:00am</div>
                            <div class="table_time">11:00am</div>
                            <div class="table_time">12:00pm</div>
                            <div class="table_time">1:00pm</div>
                            <div class="table_time">2:00pm</div>
                            <div class="table_time">3:00pm</div>
                            <div class="table_time">4:00pm</div>
                            <div class="table_time">5:00pm</div>
                            <div class="table_time">6:00pm</div>
                        </div>
                </div>
                <div class="days">
                    <div class="days-content">
                    <c:forEach items="${unavailableDays}" var="day">
                        <div class="unavailableDay">
                            <div class="table_header">${day.getDayname()} <br>
                                ${day.getMonthName()} ${day.getDaynumber()}</div>
                            <div class="unavailable_time_data">
                            </div>
                        </div>
                    </c:forEach>
                    <c:forEach items="${availableDays}" var="day">
                        <c:choose>
                        <c:when test="${day.getDayname() eq 'Saturday ' || day.getDayname() eq 'Sunday '} "> <!-- THIS DOESNT WORK FOR SOME REASON-->
                            <div class="unavailableDay">
                            <div class="table_header">${day.getDayname()} <br>
                                ${day.getMonthName()} ${day.getDaynumber()}</div>
                            <div class="unavailable_time_data"></div>
                        </div>                
                        </c:when>
                        <c:otherwise>
                            <div class="availableDay">
                            <div class="table_header">${day.getDayname()} <br>
                                ${day.getMonthName()} ${day.getDaynumber()}</div>
                            <div class="table_time_data">
                                <div class="table_data"></div>
                                <c:forEach items="${day.getAvailabletimeList()}" var="time">
                                    <c:if test="${time.getIsAvailable()==2}">
                                        <div class="table_data data_unavailable">Unavailable</div>
                                    </c:if>    
                                    <c:if test="${time.getIsAvailable()==1}">
                                        <div class="table_data data_available" data-value="${time.getTimeid()}" id="${time.getTimeid()}" onClick="getTime(this.getAttribute('data-value'))">${time.getTruncatedStartTime()} - ${time.getTruncatedEndTime()}</div>
                                    </c:if>
                                    
                                </c:forEach>
                            </div>     
                        </div>
                        </c:otherwise>
                        </c:choose>
            </c:forEach>
                </div>
                </div>
        </div>
            
        <input type="hidden" id="dynamicHtml" value="<c:forEach items='${services}' var='s'><input type='radio' name='serviceType' value='${s.serviceid}' onClick='enableBook()'>${s.serviceName}</c:forEach>">  
        <div id="popupBox" class="popup-box">
            <!-- Content of the popup box will be dynamically updated -->
        </div>
        <input type="hidden" id="hiddenmessage" value="${message}">    
    <script src="js/bookingpage.js"></script>

    </body>

    <footer>
        <jsp:include page="./components/footer.jsp" />
    </footer>

</html>