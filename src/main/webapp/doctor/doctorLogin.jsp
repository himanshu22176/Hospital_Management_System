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
		<div></div>
	</header>
	<hr>

	<%
	String message = (String) session.getAttribute("registerStatus");
	if (message != null) {
	%>
	<h3 style="color: Green; display: flex; align-items: center;">Registration Successfull.</h3>
	<%
	}
	%>

	<form action="" style="display: grid; place-content: center; justify-content: center; color: white; font-size: x-large; flex-direction: column;">
		<div style="display: flex; align-items: center;">
			<h3 style="font-size: xx-large;">Email:</h3>
			<input type="text" name="userEmail"
				style="height: 35px; border-radius: 10px; font-size: x-large;">
		</div>
		<div style="display: flex; align-items: center;">
			<h3 style="font-size: xx-large;">Password:</h3>
			<input type="text" name="userPassword"
				style="height: 35px; border-radius: 10px; font-size: x-large;">
		</div>
		<div>
		<input type="submit" value="Login" formaction="${pageContext.request.contextPath}/doctorLogin"
			style="width: 48.5%; text-align: center; font-size: xx-large; background-color: Green; color: white; border-radius: 20px; height: 50px; margin-top: 20px;">
		<input type="submit" value="Register" formaction="${pageContext.request.contextPath}/redirectRegister" formmethod="post"
			style="width: 48.5%; text-align: center; font-size: xx-large; background-color: Green; color: white; border-radius: 20px; height: 50px; margin-top: 20px;">
		</div>
	</form>

</body>
</html>