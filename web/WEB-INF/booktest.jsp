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
        <!--<link rel="stylesheet" type="text/css" href="css/booktest.css">-->
        <script src="https://kit.fontawesome.com/b0274adb94.js" crossorigin="anonymous"></script>
        <!--        <script src="js/bookingpage.js"></script>-->
        <link href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap" rel="stylesheet">

        <c:import url="./components/headers.jsp" />

        <style>
            .book_container {
                margin: 0;
                padding: 0;
            }
            .book_container h1 {
                font-family: Cinzel;
            }

            .bookValue {
                margin-left: 45px;
                font-size: 16px;
            }

            .fullCalendar{
                width: 100%;
                display: flex;
                overflow: hidden;
                margin: 20px auto;
            }

            .TimesLeft {
            }

            .global_top_section {
                white-space: nowrap;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .leftArrow, .rightArrow {
                display: inline-block;
            }
            .leftArrow{
                padding-right: 10%;
            }
            .rightArrow{
                padding-left: 10%;
            }

            .global_top_section button {
                background-color: #0B486B;
                border: none;
                color: white;
                padding: 10px 20px;
                font-size: 16px;

                border-radius: 50%;
            }

            .table_header {
                background-color: #fff;
                color:#000;
                height: 70px;
                padding: 15px;
                font-size: 15px;
                margin-top: -25px;
                padding-top: 10px;
            }

            .header_time {
                height: 100%;
                background-color: white;
                margin-top: -50px;
            }

            .table_time {
                height: 15px;
                padding-top: 32px;
                font-size: 11px;
                margin-top: 70%;
            }

            .book_table_date {
                margin-left: 3px;
            }

            .table_time_data {
                background-color: #f5f5f5;
                border-radius: 5px;
            }
            .days {
                display: flex;
                /*border: solid red 2px;*/
                overflow-x: hidden;
                position: relative;
                border:none;
            }

            .days .days-content {
                display: flex;
                position: relative;
                transition: transform 0.6s ease;
                background-color: #fbfbfb;
            }
            .days-content{
                width: 100%;
            }
            .days {
                display: flex;
                /*border: solid red 2px;*/
                overflow-x: hidden;
                white-space: nowrap;
            }

            /*            .days {
                            display: flex;
                            border: solid red 2px;
                            overflow-x: scroll;
                            white-space: nowrap;
                        }*/
            .table_header{
                padding-top: 20px;
                /*                margin: 20px auto;*/
                text-align: center;
                display: flex;
                align-items: center;
                justify-content: center;
                font-family: sans-serif;
                /*color: white;*/
            }
            .days .availableDay {
                flex: 0 0 auto;
                flex-basis: calc(100% / 7);
                max-width: calc(100% / 7);
                min-width: calc(100% / 7);
                padding-top: 10px;
                background:#f5f5f5;
                border: 2px solid #fff;
            }
            .days .unavailableDay {
                flex: 0 0 auto;
                flex-basis: calc(100% / 7);
                max-width: calc(100% / 7);
                min-width: calc(100% / 7);
                padding-top: 10px;
                border: 2px solid #fff;
            }


            .availableDay, .unavailableDay {
                flex-basis: calc(100% / 7);
                max-width: calc(100% / 7);
                min-width: calc(100% / 7);
                padding-top: 10px;
            }

            .unavailableDay{
                /*background-color: #f5f5f5;*/
                /*rgb(196, 196, 196, 0.4) 10px*/
                background: repeating-linear-gradient(
                    135deg,
                    #f5f5f5,
                    #f5f5f5 5px,
                    #c4c4c4 5px,
                    #c4c4c4 10px
                    );
                opacity: 0.4;
                border: 2px solid #fff;
            }
            .table_data {
                height: 30px;
                padding: 25px 15px;
                padding-top: 35px;
                border-radius: 5px;
                font-size: 13px;
                display: flex;
                align-items: center;
                justify-content: center;
                background:#f5f5f5;
            }
            .days{
                display: flex;
                overflow: hidden;
                /*border: solid red 2px;*/
            }
            .data_available {
                background-color: #5ea1ff;
                color:#fff;
                border: 1px solid #fff;
                cursor: pointer;
                height: 50px;
                max-height: 50px;
                min-height: 50px;
            }

            .data_available:hover {
                background-color: #0d6efd;
            }

            .data_unavailable {
                background-color: lightgray;
                color: gray;
                border: 2px solid #fff;
                cursor: not-allowed;
                height: 50px;
                max-height: 50px;
                min-height: 50px;
            }

            .book_main_right {
                flex: 1;
                margin-top: 75px;
                /*position: relative;*/
                padding-left: 20px;

            }

            .book_right_icon {
                display: flex;
                justify-content: space-between;
                margin: 10px;
                font-size: 11px;
            }

            .able {
                background-color: #0d6efd;
                color:#fff;
                padding: 2px 5px;
                border-radius: 10px
            }

            .unable {
                background-color: lightgray;
                color: gray;
                padding: 2px 5px;
                border-radius: 10px
            }

            .book_right_selected {
                display: flex;
                justify-content: space-between;
                background-color: #f5f5f5;
                border-radius: 5px;
                padding: 20px 10px;
                margin: 10px;
                font-size: 14px;
            }

            .book_right_btn {
                margin: 20px 10px;
            }

            .book_btn {
                padding: 10px 20px;
                border-radius: 5px;
                border: none;
                cursor: pointer;
                width: 100%;
                background-color: lightgray;
                color: gray;
                font-weight: 300;

            }

            .book_btn:hover {
                background: #212529;
                color: #fff;
            }

            @media screen and (max-width: 1400px) {
                .book_container {
                    max-width: 1140px;
                }
            }

            @media screen and (max-width: 1200px) {
                .book_container {
                    max-width: 960px;  
                }

            }

            @media screen and (max-width: 992px) {

                .book_container {
                    max-width: 720px;  
                    /*height: 100vh;*/
                }

                .book_main_section {
                    display: block;
                }

                .book_main_right {
                    display: block;
                    margin: 20px 0;
                    height: 160px;

                }

                .book_right_icon {
                    justify-content: flex-start;
                }

                .book_right_icon > div {
                    margin-right: 20px;
                }

                .book_right_selected {
                }

                .book_btn {

                }
            }


            @media screen and (max-width: 768px) {
                .book_container {
                    max-width: 720px;  
                }
            }

            @media screen and (max-width: 576px) {
                .book_container {
                    max-width: 540px;  
                }
            }

            .popup-box {
                display: none; 
                position: fixed;
                z-index: 1021;
                padding-top: 100px;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%; 
                overflow: auto; 
                background-color: rgb(0,0,0); 
                background-color: rgba(0,0,0,0.4); 

            }

            .popup-content {
                width: 570px;
                /*text-align: center;*/
                background-color: #fefefe;
                /*margin: auto;*/
                padding: 30px;
                border: 1px solid #888;
                position: absolute;
                float: left;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                border-radius: 5px;
                display: flex;
                flex-direction: column;
                justify-content: center;
            }

            .book_close {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
                text-align: right;
            }

            .book_close:hover,
            .book_close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

            .popupBtns {
                display: flex;
                align-items: center;
                /*justify-content: flex-end;*/
                justify-content: center;
            }

            .popupBtns button {
                border: none;
                padding: 5px 0;
                width: 70px;
                border-radius: 10px;
                margin-left: 20px;
            }

            .popupBtns input[type=button],
            .popupBtns input[type=submit]{
                border: none;
                padding: 5px 0;
                width: 70px;
                border-radius: 10px;
                margin-left: 15px;

                margin-top: 15px;
            }


            .confirmBtn {
                background: #0b486b;
                color:#fff;
                font-size: 14px;
            }

            .confirmBtn:hover {
                /*                border:2px solid #0b486b;
                                background: #fff;
                                color:#000;*/
                box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.2);
            }

            .cancelBtn:hover {
                box-shadow: 2px 2px 5px 2px rgba(0, 0, 0, 0.1);
            }

            #confirmBox form {
                margin-top: 15px;
            }
            
            #confirmBox form input {
/*                display: flex;
                align-items: center;*/
                /*flex-direction: column;*/
            }


            .confirmService {
                font-size: 18px;
                font-weight: 600;
                margin-bottom: 15px;
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
        <div class="gloabal_container">
            <!--<h1>BOOK AN APPOINTMENT</h1>-->
            <!--<div class="bookAll">-->
            <!--                <div class="calendarLeft">-->
            <div class="global_top_section book_container">
                <div class="leftArrow">
                    <button onclick="goLeft()">
                        <!--&leftarrow;-->
                        <i class="fa-solid fa-chevron-left"></i>
                    </button>
                </div>
                <h1>BOOK AN APPOINTMENT</h1>
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
                                <div class="table_header">${day.getDayname().substring(0,3)}
                                    ${day.getMonthName()} ${day.getDaynumber()}</div>
                                <div class="unavailable_time_data">
                                </div>
                            </div>
                        </c:forEach>
                        <c:forEach items="${availableDays}" var="day">
                            <c:choose>
                                <c:when test="${day.getDayname() eq 'Saturday ' || day.getDayname() eq 'Sunday '} "> <!-- THIS DOESNT WORK FOR SOME REASON-->
                                    <div class="unavailableDay">
                                        <div class="table_header">${day.getDayname().substring(0,3)}
                                            ${day.getMonthName()} ${day.getDaynumber()}</div>
                                        <div class="unavailable_time_data"></div>
                                    </div>                
                                </c:when>
                                <c:otherwise>
                                    <div class="availableDay">
                                        <div class="table_header">${day.getDayname().substring(0,3)}
                                            ${day.getMonthName()} ${day.getDaynumber()}</div>
                                        <div class="table_time_data">
                                            <div class="table_data"></div>
                                            <c:forEach items="${day.getAvailabletimeList()}" var="time">
                                                <c:if test="${time.getIsAvailable()==2}">
                                                    <div class="table_data data_unavailable">Booked</div>
                                                </c:if>    
                                                <c:if test="${time.getIsAvailable()==1}">
                                                    <div class="table_data data_available" data-value="${time.getTimeid()}" id="${time.getTimeid()}" onClick="getTime(this.getAttribute('data-value'))">
                                                        <span class="availableTimeData"> ${time.getTruncatedStartTime()}&nbsp;</span> 
                                                        <span class="availableTimeData"> - ${time.getTruncatedEndTime()}</span> 
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
                <input type="hidden" id="dynamicHtml" value="<c:forEach items='${services}' var='s'><input type='radio' name='serviceType' value='${s.serviceid}' onClick='enableBook()'>${s.serviceName}</c:forEach>">  
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
        <script src="js/bookingpage.js"></script>

    </body>

    <footer>
        <jsp:include page="./components/footer.jsp" />
    </footer>

</html>