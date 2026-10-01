<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" type="text/css" href="css/test.css">
<title>Insert title here</title>
</head>
<body
	style="height: 90vh; width: auto;background-color:black; color: white; font-family: sans-serif;">
	<header
		style="width: 100%; display: flex; justify-content: space-between; align-items: flex-start; height: 30px; font-size: x-large;">
		<div></div>
		<div style="font-size: 27px;">Welcome</div>
		<div></div>
	</header>
	<hr>

	<div style="width: 6.7cm; margin-top: 13%; margin-left: 40%;">
		<form action="${pageContext.request.contextPath}/adminLogin"
			method="post">

			<div style="display: flex; align-items: center;">
				<h3 style="font-size: xx-large;">User:</h3>
				<input type="text" name="adminName"
					style="height: 35px; border-radius: 10px; font-size: x-large;">
			</div>
			<div style="display: flex; align-items: center;">
				<h3 style="font-size: xx-large;">Password:</h3>
				<input type="text" name="adminPassword"
					style="height: 35px; border-radius: 10px; font-size: x-large;">
			</div>
			<input type="submit"
				style="text-align: center; font-size: xx-large; background-color: Green; color: white; border-radius: 20px; width: 3.5in; height: 50px; margin-top: 20px;">

		</form>

	</div>
	<%
	String message = (String) session.getAttribute("error");
	if (message != null) {
	%>
	<h3 style="color: red;">Invalid Login Details.</h3>
	<%
	}
	%>

</body>
</html>