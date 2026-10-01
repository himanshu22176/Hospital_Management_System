<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Please Enter Patient Id</title>
</head>
<body style="height: 90vh; width: auto; background-color: Black; color: white; display:grid; font-family: sans-serif;">
	<br>
	<form action="${pageContext.request.contextPath}/patient" style="display:grid; place-content:center; justify-content:center; color: white; font-size: x-large; flex-direction:column;">
		<h3 style="font-size: xx-large;">Please Enter the Patient id</h3>
		<input type="text" name="id" style="height: 35px;border-radius: 10px; font-size: x-large;"> 
		<input type="submit" style="text-align: center; font-size: xx-large; background-color: Green; color: white; border-radius: 20px; height: 50px; margin-top: 20px;">

	</form>
	<br><br>
	<form action="${pageContext.request.contextPath}/patient/Welcome.jsp">
		<input type="submit" value="Go Back to Homepage" style="display:grid; place-content:left;  background-color: green;align-items:flex-start; color:white; font-size: x-large; width: 260px; height: 50px;border-radius: 20px;">
	</form>
</body>
</html>