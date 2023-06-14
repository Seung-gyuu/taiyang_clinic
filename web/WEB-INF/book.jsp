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
        <link rel="stylesheet" type="text/css" href="css/book.css">
        <script src="https://kit.fontawesome.com/b0274adb94.js" crossorigin="anonymous"></script>

        <c:import url="./components/headers.jsp" />
    </head>
    <body>

        <!--Book Start-->
        <div class="gloabal_container">
            <div class="gloabal_top_section">
                <h1>BOOK AN APPOINTMENT</h1>
            </div>
            <div class="book_main_section gloabal_main_section">
                <div class="book_main-left">
                    <!-- Calendar -->
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
                            <div class="table_header">Sun June 4</div>
                            <div class="table_time_data">
                                <div class="table_data"></div>
                                <div class="table_data data_available" name="getTime" id="1" onClick='clicked1(this)'>Available</div>
                                <div class="table_data data_available" name="getTime" id="2"  onClick='clicked2(this)'>Available</div>
                                <div class="table_data data_available" name="getTime" id="3"  onClick='clicked3(this)'>Available</div>
                                <div class="table_data data_available" name="getTime" id="4" onClick='clicked4(this)'>Available</div>
                                <div class="table_data data_available" name="getTime" id="5" onClick='clicked5(this)'>Available</div>
                                <div class="table_data data_available" name="getTime" id="6" onClick='clicked6(this)'>Available</div>
                                <div class="table_data data_available" name="getTime" id="7" onClick='clicked7(this)'>Available</div>
                                <div class="table_data data_available" name="getTime" id="8" onClick='clicked8(this)'>Available</div>
                                <div class="table_data data_available" name="getTime" id="9" onClick='clicked9(this)'>Available</div>
                                <div class="table_data"></div>
                            </div>
                        </div>
                        <div class="book_table_date">
                            <div class="table_header">Mon June 5</div>
                            <div class="table_time_data">
                                <div class="table_data"></div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_unavailable">Booked</div>
                                <div class="table_data data_unavailable">Booked</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_unavailable">Booked</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data"></div>
                            </div>
                        </div>
                        <div class="book_table_date">
                            <div class="table_header">Tus June 6</div>
                            <div class="table_time_data">
                                <div class="table_data"></div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_unavailable">Booked</div>
                                <div class="table_data data_unavailable">Booked</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_unavailable">Booked</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data"></div>
                            </div>
                        </div>
                        <div class="book_table_date">
                            <div class="table_header">Wed June 7</div>
                            <div class="table_time_data">
                                <div class="table_data"></div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_unavailable">Booked</div>
                                <div class="table_data data_unavailable">Booked</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_unavailable">Booked</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data"></div>
                            </div>
                        </div>
                        <div class="book_table_date">
                            <div class="table_header">Thu June 8</div>
                            <div class="table_time_data">
                                <div class="table_data"></div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_unavailable">Booked</div>
                                <div class="table_data data_unavailable">Booked</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_unavailable">Booked</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data"></div>
                            </div>
                        </div>
                        <div class="book_table_date">
                            <div class="table_header">Fri June 9</div>
                            <div class="table_time_data">
                                <div class="table_data"></div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_unavailable">Booked</div>
                                <div class="table_data data_unavailable">Booked</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_unavailable">Booked</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data"></div>
                            </div>
                        </div>
                        <div class="book_table_date">
                            <div class="table_header">Sat June 10</div>
                            <div class="table_time_data">
                                <div class="table_data"></div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_unavailable">Booked</div>
                                <div class="table_data data_unavailable">Booked</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_unavailable">Booked</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data data_available">Available</div>
                                <div class="table_data"></div>
                            </div>
                        </div>
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
                        <!--<div>Mon Jone 5, 11:00am</div>-->
                        <div id="selectedDateTime">-----</div>
                    </div>
                    <div class="book_right_btn">
                        <button class="book_btn" id="bookBtn">Booking Now</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- The Modal -->
        <div id="bookModal" class="book_modal">
            <div class="book_modal-content">
                <span class="book_close">&times;</span>
                <p>Are you sure you want to book this appointment?</p>
            </div>
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

    </body>

    <footer>
        <jsp:include page="./components/footer.jsp" />
    </footer>

</html>