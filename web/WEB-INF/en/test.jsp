<%-- Document : profile Created on : 2023. 6. 6, 오전 1:16:59 Author : User --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
                                                                  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Tai Yang Clinic</title>
        <link rel="stylesheet" type="text/css" href="css/global.css" />
        <link rel="stylesheet" type="text/css" href="css/profile.css" />
        <link rel="stylesheet" type="text/css" href="css/history.css" />
        <script
            src="https://kit.fontawesome.com/b0274adb94.js"
            crossorigin="anonymous"
        ></script>

        <c:import url="./components/header.jsp" />
    </head>
    <body>
        <!--Profile Start-->
        <div class="gloabal_container">
            <div class="gloabal_top_section">
                <h1>MY ACCOUNT</h1>
            </div>
            <div class="account_container">
                <div class="account_side">
                    <%@include file="./components/accountSidebar.jsp"%>
                </div>
                <div class="account_main">
                    <div class="profile_wrapper">
                        <div class="profile_title">
                            <!--<h2>My Profile</h2>-->
                        </div>
                        <div class="user_info">
                            <div class="user_info_left">
                                <div class="info_avarta">
                                    <div data-initials="P"></div>
                                </div>
                            </div>

                            <div class="user_info_right">
                                <div class="info_data">
                                    <div class="info_data_title">First name:</div>
                                    <div class="info_data_value">Younshin</div>
                                </div>
                                <div class="info_data">
                                    <div class="info_data_title">Last name:</div>
                                    <div class="info_data_value">Park</div>
                                </div>
                                <div class="info_data">
                                    <div class="info_data_title">Email:</div>
                                    <div class="info_data_value">Park@gmail.com</div>
                                </div>
                                <div class="info_data">
                                    <div class="info_data_title">Phone:</div>
                                    <div class="info_data_edit">
                                        <div class="info_data_value">123-456-7890</div>
                                        <button>Edit</button>
                                    </div>
                                </div>
                                <!--                <div class="info_data">
                                                  <div class="info_data_title">Phone:</div>
                                                  <div class="info_data_edit info_data_save">
                                                    <input
                                                      type="tel"
                                                      name="phone"
                                                      id="phone"
                                                      placeholder="123-456-7890"
                                                      pattern="[0-9]{3} [-][0-9]{3}[-][0-9]{4}"
                                                    />
                                                    <button>Save</button>
                                                  </div>
                                                </div>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

    <footer>
        <jsp:include page="./components/footer.jsp" />
    </footer>
</html>