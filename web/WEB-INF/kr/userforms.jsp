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
        <link rel="stylesheet" href="../fonts/material-icon/css/material-design-iconic-font.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">


        <!--        Libraries Stylesheet -->  
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   



        <c:import url="../components/headersKR.jsp" />
        <style>


            @media screen and (max-width: 768px) {

                .account_container {
                    display: flex;
                    flex-direction: column;
                }
                .account_side {
                    order: 1;

                }
                .account_main {
                    order: 2;
                }


            }

            .download-link {
                font-weight: bold;
                color: #393f81;
                font-size:13.5px;
            }

            .view-button {
                background-color: #0B486B;
                color: #fff;
                padding: 4px 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .account_main h2{
                font-size: 20px;
                font-weight: bold;


            }

            .gloabal_top_section h2 {
                font-family: 'Cinzel', serif;
                font-size: 25px;
            }


            .gloabal_top_section h2::after {
                content: "";
                height: 5px;
                width: 150px;
                background-color: #ebe4d6;
                border-radius: 25px;
                display: block;
                margin: auto;    
            }


            .gloabal_container {
                /*max-width: 1320px;*/
                margin: 40px auto;
                padding: 1.5rem;
                min-height: 70vh;
                min-height: 70vh;
                font-family: 'Open Sans', sans-serif;

            }

            .gloabal_top_section {
                text-align: center;
                margin-bottom: 40px;

            }

            .gloabal_main_section {
                min-height: 70vh;
                text-align: center;

            }

            .userForm_title h4 {
                margin-right: 10px;
                /*font-size: 18px;*/
                display: flex;
                align-items: center;
            }

        </style>
    </head>
    <body>
        <!--History Start-->
        <div class="gloabal_container">
            <div class="gloabal_top_section">
                <h1>서류 보기</h1>
                <!--<%out.println(request.getRequestURL());%>-->
                <!--${pageContext.request.requestURI}-->
            </div>
            <div class="account_container">

                <div class="account_side">
                    <%@include file="../components/accountSidebarKR.jsp"%>
                </div>
                <div class="account_main">
                    <div class="history_wrapper">
                        <div class="userForm_title history_title ">
                            <h4><i class="fa-solid fa-rectangle-list" style="color:#FF8A30"></i>내 서류</h4>
                            <c:if test="${userForms eq null}">
                                <table>
                                    <tr><th>저장된 파일이 없습니다.</th></tr>
                                </table>
                            </c:if>
                            <c:if test="${userForms ne null}">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Form</th>
                                            <th>Date Added</th>
                                            <th>View</th>
                                            <th>Download</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${medicalforms}" var="mdform">
                                            <tr>
                                                <td>Medical</td>
                                                <td>${mdform.getTimeAdded()}</td>
                                                <td><button class="view-button" onclick="openPdfPopup('/viewForm?formId=${mdform.getId()}&form=1')">View</button></td>                                        
                                                <td> <a class="download-link" href="/downloadForm?formId=${mdform.getId()}&form=1&referer=${pageContext.request.requestURI}">Download</a></td>
                                            </tr>
                                        </c:forEach>
                                        <c:forEach items="${consentforms}" var="csform">
                                            <tr>
                                                <td>Consent</td>
                                                <td>${csform.getTimeAdded()}</td>
                                                <td><button class="view-button" onclick="openPdfPopup('/viewForm?formId=${csform.getId()}&form=2')">View</button></td>                                        
                                                <td> <a class="download-link" href="/downloadForm?formId=${csform.getId()}&form=2&referer=${pageContext.request.requestURI}">Download</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                            <div id="pdfPopup" class="popup">
                                <div class="popup-content" id="popup-content">
                                    <div class="pdf-container">
                                        <div id="pdfViewer" class="pdfViewer"></div>
                                    </div>
                                    <span class="popup-close" onclick="closePopup()">&times;</span>
                                </div>
                            </div>

                        </div>
                    </div>  
                </div> 
            </div> 
        </div>

        <style>



            .popup {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.8); /* Adjust the transparency here */
                z-index: 9999;
                animation: 2s ease-in-out;
            }

            .popup-content {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                height: 100%;
            }

            .pdf-container {
                max-width: 90%;
                max-height: 90%;
                background-color: #fff; /* Set the background color for the PDF container */
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* Add a box shadow for styling */
            }

            .pdf-container #pdfViewer {
                display: flex;
                margin: auto;
                overflow-x: scroll;
            }
        </style>



        <!--<script src="../js/bootstrap.bundle.min.js"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.11.338/pdf.min.js"></script>
        <script src="../js/vform.js"></script><!-- Vform has the exact same code, no need for new javascript file :P-->
        <footer>
            <jsp:include page="../components/footerKR.jsp" />
        </footer>
    </body>
</html>