<%-- 
    Document   : booktest.jsp
    Created on : 14-Jun-2023, 9:57:07 AM
    Author     : 00cap
--%>

 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
<h1>Book test!</h1>

<div class="container">
<c:forEach items="${unavailableDays}" var="day">
<div class="unavailableDay">
<header>${day.getDayname()}</header>
<br>
<p>${day.getMonthName()} ${day.getDaynumber()}</p>
<br>
<ul class="unavailableDayList">              
</ul>
</div>
</c:forEach>
<c:forEach items="${availableDays}" var="day">
<div class="availableDay">
<header>${day.getDayname()}</header>
<br>
<p>${day.getMonthName()} ${day.getDaynumber()}</p>
<br>
<ul class="availableDayList">
<c:forEach items="${day.getAvailabletimeList()}" var="time">
<li> ${time.getTruncatedStartTime()} ${time.getTruncatedEndTime()}</li>
</c:forEach>
</ul>
</div>
</c:forEach>



</div>

</body>
</html>