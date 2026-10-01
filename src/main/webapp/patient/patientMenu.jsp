<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body
	style="height: 90vh; width: auto; background-color: Black; color: white; font-family: sans-serif;">
	<header
		style="width: 100%; display: flex; justify-content: space-between; align-items: flex-start; height: 30px; font-size: x-large;">
		<div></div>
		<div>Welcome</div>

		<div>
			<%@ include file="logout.jsp"%></div>
	</header>
	<hr>
<form action="${pageContext.request.contextPath}/patient"
		style="display: grid; place-content: center; justify-content: center; color: white; font-size: x-large; flex-direction: column; margin-top: 12%">

		<input type="submit" value="Book Appointment" formaction="${pageContext.request.contextPath}/bookAppointment"
			style="height: 45px; font-size: xx-large; background-color: green; color: white; border-radius: 10px; width: 4.5in;">


</body>
</html>