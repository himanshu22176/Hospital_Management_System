<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="height: 90vh; color: white; background-color: black;">
	<form action="${pageContext.request.contextPath}/patient" method="Post"
		style="display: grid; flex-direction: column; place-content: center;">

		<table style="font-family: sans-serif; font-size: xx-large;">
			<tr>

				<th colspan="2">
					<h1 style="text-align: center;">Enter the patient details:</h1>
				</th>
			</tr>
			<tr>
				<td>Name:</td>
				<td><input type="text" name="name"
					style="height: 25px; width: 10cm; border-radius: 10px; font-size: large;"></td>
			</tr>
			<tr>
				<td>Age:</td>
				<td><input type="text" name="age"
					style="height: 25px; width: 10cm; border-radius: 10px; font-size: large;"></td>
			</tr>
			<tr>
				<td>Phone Number:</td>
				<td><input type="text" name="phone"
					style="height: 25px; width: 10cm; border-radius: 10px; font-size: large;"></td>
			</tr>
			<tr>
				<td>Disease:</td>
				<td><input type="text" name="disease"
					style="height: 25px; width: 10cm; border-radius: 10px; font-size: large;"></td>
			</tr>
			<tr></tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Submit"
					style="height: 50px; width: 10cm; border-radius: 20px; margin-top: 40px; font-size: xx-large; background-color: green; color: white;"></td>
			</tr>

		</table>
	</form>

	<form action="${pageContext.request.contextPath}/patient/Welcome.jsp">
		<input type="submit" value="Go Back to Homepage"
			style="display: grid; place-content: left; background-color: green; align-items: flex-start; color: white; font-size: x-large; width: 260px; height: 50px; border-radius: 20px; margin-top: 70px;">
	</form>
</body>
</html>