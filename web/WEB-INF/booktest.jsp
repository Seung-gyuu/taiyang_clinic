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
            <div class="services">
                <c:forEach items="${services}" var="s">
                    <input type="radio" name="serviceType" value="${s.getServiceid()}">${s.getServiceName()} 
                    <br>
                </c:forEach>
            </div>
        </div>
            
            
<!--            <div class="book_main_section gloabal_main_section">
                <div class="book_main-left">
                     Calendar 
                    <div class="book_left_top">
                        <button class="prev_week"><i class="fa-solid fa-chevron-left"></i></button>
                        <h2>Sun Jun 4 - Sat Jun 10</h2>
                        <button class="next_week"><i class="fa-solid fa-chevron-right"></i></button>
                    </div>
                    <div class="book_left_time">
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
                            <div class="table_time">7:00pm</div>
                        </div>
                        <div class="book_table_date">
                            
                            
            <div class="daysContainer">
            <c:forEach items="${unavailableDays}" var="day">
                        <div class="day">
                            <div class="table_header">${day.getDayname()} ${day.getMonthName()} ${day.getDaynumber()}</div>
                            <div class="unavailable_time_data">
                            </div>
                        </div>
   

            </c:forEach>
            <c:forEach items="${availableDays}" var="day">
                        <div class="day">
                            <div class="table_header">${day.getDayname()} ${day.getMonthName()} ${day.getDaynumber()}</div>
                            <div class="table_time_data">
                                <div class="table_data"></div>
                                <c:forEach items="${day.getAvailabletimeList()}" var="time">
                                    <c:if test="${time.getIsAvailable()==2}">
                                        <div class="table_data data_unavailable">Unavailable</div>
                                    </c:if>
                                    <c:if test="${time.getIsBooked()==2}">
                                        <div class="table_data data_unavailable">Booked</div>
                                    </c:if>
                                    <c:if test="${time.getIsAvailable()==1}">
                                        <div class="table_data data_available" name="${time.getTruncatedStartTime()}" id="${time.getTimeid()}"  onClick='clicked2(this)'>Available</div>
                                    </c:if>
                                    
                                </c:forEach>
                            </div>     
                        </div>
            </c:forEach>
 
                    </div>
                </div>
                <div class="book_main_right">
                    <div class="book_right_icon">
                        <div class="able">Available</div>
                        <div class="unable">unavailable</div>
                    </div>
                    <div class="book_right_selected">
                        <div>Selected time:</div>
                        <%--<c:if test=""></c:if>--%>
                        <div>Mon Jone 5, 11:00am</div>
                        <div id="selectedDateTime">-----</div>
                    </div>
                    <div class="book_right_btn">
                        <button class="book_btn" id="bookBtn">Booking Now</button>
                    </div>
                </div>
            </div>
        </div>
        </div>-->
        <!-- The Modal -->
        <div id="bookModal" class="book_modal">
            <div class="book_modal-content">
                <span class="book_close">&times;</span>
                <p>Are you sure you want to book this appointment?</p>
            </div>
        </div>
        <div id="popupBox" class="popup-box">
            <!-- Content of the popup box will be dynamically updated -->
        </div>
        
        
        <script>

            var divItems = document.getElementsByClassName("getTime");
            var modal = document.getElementById("bookModal");

            var btn = document.getElementById("bookBtn");

            var span = document.getElementsByClassName("book_close")[0];

            btn.onclick = function () {
                modal.style.display = "block";
            }

            span.onclick = function () {
                modal.style.display = "none";
            }

            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }

            function clicked1(item) {
                document.getElementById("selectedDateTime").innerHTML = "Sun June 4, 9:00am";
//                item.style.backgroundColor = "#0d6efd";
            }
            function clicked2(item) {
                document.getElementById("selectedDateTime").innerHTML = "Sun June 4, 10:00am";
//                item.style.backgroundColor = "#0d6efd";
            }
            function clicked3(item) {
                document.getElementById("selectedDateTime").innerHTML = "Sun June 4, 11:00am";
//                item.style.backgroundColor = "#0d6efd";
            }
            function clicked4(item) {
                document.getElementById("selectedDateTime").innerHTML = "Sun June 4, 12:00pm";
//                item.style.backgroundColor = "#0d6efd";
            }
            function clicked5(item) {
                document.getElementById("selectedDateTime").innerHTML = "Sun June 4, 1:00pm";
//                item.style.backgroundColor = "#0d6efd";
            }
            function clicked6(item) {
                document.getElementById("selectedDateTime").innerHTML = "Sun June 4, 2:00pm";
//                item.style.backgroundColor = "#0d6efd";
            }
            function clicked7(item) {
                document.getElementById("selectedDateTime").innerHTML = "Sun June 4, 3:00pm";
//                item.style.backgroundColor = "#0d6efd";
            }
            function clicked8(item) {
                document.getElementById("selectedDateTime").innerHTML = "Sun June 4, 4:00pm";
//                item.style.backgroundColor = "#0d6efd";
            }
            function clicked9(item) {
                document.getElementById("selectedDateTime").innerHTML = "Sun June 4, 5:00pm";
//                item.style.backgroundColor = "#0d6efd";
            }


        </script>
    <script src="js/bookingpage.js"></script>

    </body>

    <footer>
        <jsp:include page="./components/footer.jsp" />
    </footer>

</html>