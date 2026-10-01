<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body style="color: white; background-color: black;">
	<header
		style="width: 100%; display: flex; justify-content: space-between; align-items: flex-start; height: 30px; font-size: x-large;">
		<div></div>
		<div>Welcome</div>

		<div></div>
	</header>
	<hr>


	<form action="${pageContext.request.contextPath}/patientLogin"
		method="post"
		style="display: grid; place-content: center; justify-content: center; color: white; font-size: x-large; flex-direction: column;">
		Email: <input type="text" name="userEmail"
			style="height: 35px; border-radius: 10px; font-size: x-large;">
		<br> <br> Password: <input type="text" name="userPassword"
			style="height: 35px; border-radius: 10px; font-size: x-large;">
		<div>
			<input type="submit" value="Login"
				style="text-align: center; font-size: xx-large; background-color: Green; color: white; border-radius: 20px; height: 50px; width: 48.5%; margin-top: 20px;">
			<input type="submit" value="Register"
				formaction="${pageContext.request.contextPath}/patient/registerPatient.jsp"
				style="text-align: center; font-size: xx-large; background-color: Green; color: white; border-radius: 20px; height: 50px; width: 48.5%; margin-top: 20px;">
		</div>
	</form>

</body>
</html>