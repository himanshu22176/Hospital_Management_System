<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: black">

<header
		style="width: 100%; display: flex; justify-content: space-between; align-items: flex-start; height: 30px; font-size: x-large;">
		<div></div>
		<div>Welcome</div>

		<div>
			<%@ include file="logout.jsp"%></div>
	</header>
	<hr>
	
	<div style="width: 6.7cm; margin-top: 13%; margin-left: 40%;"><form action="/doctor" >

		<input type="submit" value="View Appointment" formaction="${pageContext.request.contextPath}/viewApp" style="font-family:sans-serif; background-color: green; color:white; font-size: xx-large; width: 250px; height: 50px;border-radius: 20px;">
			<br><br>
		<input type="submit" value="Close Appointment" formaction="${pageContext.request.contextPath}/closeAppointment" style="font-family:sans-serif; background-color: green; color:white; font-size: xx-large;width: 250px;height: 50px;border-radius: 20px;">
			<br><br>
	</form></div>
</body>
</html>