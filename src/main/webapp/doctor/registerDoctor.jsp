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

	<form action="${pageContext.request.contextPath}/registerOtpDoctor" method="post"
		style="display: grid; place-content: center; justify-content: center; color: white; font-size: x-large; flex-direction: column;">

		<div style="display: flex; align-items: center;">
			<h3 style="font-size: xx-large;">Name:</h3>
			<input type="text" name="userName"
				style="height: 35px; border-radius: 10px; font-size: x-large;">
		</div>


		<div style="display: flex; align-items: center;">
			<h3 style="font-size: xx-large;">Age:</h3>
			<input type="text" name="userAge"
				style="height: 35px; border-radius: 10px; font-size: x-large;">
		</div>



		<div style="display: flex; align-items: center;">
			<h3 style="font-size: xx-large;">Speciality:</h3>
			<input type="text" name="docSpec"
				style="height: 35px; border-radius: 10px; font-size: x-large;">
		</div>



		<div style="display: flex; align-items: center;">
			<h3 style="font-size: xx-large;">Phone Number:</h3>
			<input type="text" name="userPhone"
				style="height: 35px; border-radius: 10px; font-size: x-large;">
		</div>


		<div style="display: flex; align-items: center;">
			<h3 style="font-size: xx-large;">Email:</h3>
			<input type="text" name="userEmail"
				style="height: 35px; border-radius: 10px; font-size: x-large;">
		</div>


		<div style="display: flex; align-items: center;">
			<h3 style="font-size: xx-large;">Password:</h3>
			<input type="password" name="userPassword"
				style="height: 35px; border-radius: 10px; font-size: x-large;">
		</div>


		<div style="display: flex; align-items: center;">
			<h3 style="font-size: xx-large;">Confirm Password:</h3>
			<input type="password" name="userConPassword"
				style="height: 35px; border-radius: 10px; font-size: x-large;">
		</div>


		<%
		String message = (String) request.getAttribute("errorMessage");
		if (message != null) {
		%>

		<h3 style="color: red;"><%=message%></h3>

		<%
		}
		%>

		<input type="submit" value="Send OTP"
			style="text-align: center; font-size: xx-large; background-color: Green; color: white; border-radius: 20px; height: 50px; margin-top: 20px;">


	</form>

</body>
</html>