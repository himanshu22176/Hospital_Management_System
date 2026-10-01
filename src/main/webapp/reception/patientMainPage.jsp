<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body style="background-color: black;">

	<div style="width: 6.7cm; margin-top: 13%; margin-left: 40%;"><form action="/patient" >

		<input type="submit" value="Add Patient" style="font-family:sans-serif; background-color: green; color:white; font-size: xx-large; width: 250px; height: 50px;border-radius: 20px;"
			formaction="${pageContext.request.contextPath}/patient/give_form_add.jsp">
			<br><br>
		<input type="submit" value="View Patient" style="font-family:sans-serif; background-color: green; color:white; font-size: xx-large;width: 250px;height: 50px;border-radius: 20px;"
			formaction="${pageContext.request.contextPath}/patient/give_id_view.jsp">
			<br><br>
		<input type="submit" value="Delete Patient" style="font-family:sans-serif; background-color: green; color:white; font-size: xx-large;width: 250px;height: 50px;border-radius: 20px;"
			formaction="${pageContext.request.contextPath}/patient/give_id_delete.jsp">
			<br><br>
		<input type="submit" value="View All Patient" style="font-family:sans-serif; background-color: green; color:white; font-size: xx-large;width: 250px;height: 50px;border-radius: 20px;"
			formaction="${pageContext.request.contextPath}/viewPatient">
	</form></div>

</body>
</html>