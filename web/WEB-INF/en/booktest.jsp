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
        <link rel="stylesheet" type="text/css" href="../css/global.css">
        <link rel="stylesheet" type="text/css" href="../css/booktest.css">
        <script src="https://kit.fontawesome.com/b0274adb94.js" crossorigin="anonymous"></script>
        <script src="../js/bookingpage.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap" rel="stylesheet">

        <c:import url="../components/headers.jsp" />

        <style>
            :focus {
                outline: 0;
                border-color: #2260ff;
                box-shadow: 0 0 0 4px #b5c9fc;
            }

            .mydict {
                display: flex;
                flex-direction: column;
                /*flex-wrap: wrap;*/
                margin-top: 0.5rem;
                /*justify-content: center;*/
            }

            .mydict input[type="radio"] {
                clip: rect(0 0 0 0);
                clip-path: inset(100%);
                height: 1px;
                overflow: hidden;
                position: absolute;
                white-space: nowrap;
                width: 1px;
            }

            .mydict input[type="radio"]:checked + span {
                box-shadow: 0 0 0 0.0625em #0043ed;
                background-color: #dee7ff;
                z-index: 1;
                color: #0043ed;
            }

            label span {
                display: block;
                cursor: pointer;
                background-color: #fff;
                padding: 0.375em .75em;
                position: relative;
                margin-left: .0625em;
                box-shadow: 0 0 0 0.0625em #b5bfd9;
                letter-spacing: .05em;
                color: #3e4963;
                text-align: center;
                transition: background-color .5s ease;
            }

            label:first-child span {
                border-radius: .375em 0 0 .375em;
            }

            label:last-child span {
                border-radius: 0 .375em .375em 0;
            }

            .description-box {
                width: 100%;
                height: 200px; /* Adjust the height as needed */
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                vertical-align: top;
                white-space: normal;
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }



        </style>
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
        <div class="gloabal_container book_container">
                <div class="global_top_section book_top">
                <div class="leftArrow">
                    <button onclick="goLeft()">
                        <!--&leftarrow;-->
                        <i class="fa-solid fa-chevron-left"></i>
                    </button>
                </div>
                <h1>BOOK AN APPOINTMENT</h1>
                <!--<h1 class="smallH1">BOOK AN APPOINTMENT</h1>-->
                <div class="rightArrow">
                    <button onclick="goRight()">
                        <!--&rightarrow;-->
                        <i class="fa-solid fa-chevron-right"></i>
                    </button>
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
                        <!--<div class="table_time"></div>-->
                    </div>
                </div>
                <div class="days">
                    <div class="days-content">
                        <c:forEach items="${unavailableDays}" var="day">
                            <div class="unavailableDay">
                                <div class="table_header">
                                    <span>
                                        ${day.getDayname().substring(0,3)}       
                                    </span>
                                    <p>${day.getMonthName().substring(0,3)} ${day.getDaynumber()}</p>
                                </div>
                                <div class="unavailable_time_data">
                                </div>
                            </div>
                        </c:forEach>
                        <c:forEach items="${availableDays}" var="day">
                            <c:choose>
                                <c:when test="${day.getDayname() eq 'Saturday ' || day.getDayname() eq 'Sunday '} "> <!-- THIS DOESNT WORK FOR SOME REASON-->
                                    <div class="unavailableDay">
                                        <div class="table_header">
                                            <span>
                                                ${day.getDayname().substring(0,3)}       
                                            </span>
                                            <p>${day.getMonthName().substring(0,3)} ${day.getDaynumber()}</p>
                                        </div>
                                        <div class="unavailable_time_data"></div>
                                    </div>                
                                </c:when>
                                <c:otherwise>
                                    <div class="availableDay">
                                        <div class="table_header">
                                            <span>
                                                ${day.getDayname().substring(0,3)}       
                                            </span>
                                            <p>${day.getMonthName().substring(0,3)} ${day.getDaynumber()}</p>
                                        </div>
                                        <div class="table_time_data minLength">
                                            <div class="table_data "></div>
                                            <c:forEach items="${day.getAvailabletimeList()}" var="time">
                                                <c:if test="${time.getIsAvailable()==2}">
                                                    <div class="table_data data_unavailable">Unavailable</div>
                                                </c:if>    
                                                <c:if test="${time.getIsAvailable()==1}">
                                                    <div class="table_data data_available" data-value="${time.getTimeid()}" id="${time.getTimeid()}" onClick="getTime(this.getAttribute('data-value'))">
                                                        <span class="availableTimeData maxLengthTime"> ${time.getTruncatedStartTime()}&nbsp;</span> 
                                                        <span class="availableTimeData maxLengthTime"> - ${time.getTruncatedEndTime()}</span> 
                                                        
                                                        <span class="availableTimeData minLengthTime"> ${time.getTruncatedStartTime().substring(0, time.getTruncatedStartTime().indexOf(":"))} ${time.getTruncatedStartTime().substring(time.getTruncatedStartTime().length() -2)}</span> 
                                                        <span class="availableTimeData minLengthTime minTime"> - </span>
                                                        <span class="availableTimeData minLengthTime"> ${time.getTruncatedEndTime().substring(0, time.getTruncatedEndTime().indexOf(":"))} ${time.getTruncatedEndTime().substring(time.getTruncatedEndTime().length() -2)}</span> 
                                                    </div>
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
            <!--</div>-->

            <div class="bookValue">
                <input type="hidden" id="dynamicHtml" value="<div class='mydict'><c:forEach items='${services}' var='s'>
                       <label>
                       <input class='servicebtns' type='radio' name='serviceType' value='${s.serviceid}' onClick='enableBook()'>
                       <span>${s.serviceName}</span>
                       </label>
                    </c:forEach></div>">  
                <div id="popupBox" class="popup-box">
                    <!-- Content of the popup box will be dynamically updated -->
                    <div class="popup-content" id="popupContent">
                        <span class="book_close">&times;</span>
                    </div>
                </div>
                <div id="confirmBox" class="popup-box">
                    <div class="popup-content" id="confirmContent">
                        <span class="book_close">&times;</span>
                    </div>
                </div>
                <input type="hidden" id="hiddenmessage" value="${message}"> 

            </div>
            <!--</div>-->
        </div>

        <script src="../js/bookingpage.js"></script>

    </body>

    <footer>
        <jsp:include page="../components/footer.jsp" />
    </footer>

</html>