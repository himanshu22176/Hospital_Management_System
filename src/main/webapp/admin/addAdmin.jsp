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
		<div>

			<form action="/Hospital_Management_System/admin/adminMenu.jsp">

				<input type="submit" value="&larr;"
					style="height: 30px; font-size: x-large; background-color: green; color: white; border-radius: 10px; width: 70px">

			</form>
		</div>
		<div>Welcome</div>

		<div>
			<%@ include file="logout.jsp"%></div>
	</header>
	<hr>


	<form action="${pageContext.request.contextPath}/newAdmin" method="post" style="display: grid; place-content: center; justify-content: center; color: white; font-size: x-large; flex-direction: column;">
	Username:
	<input type="text" name="email"
		style="height: 35px; border-radius: 10px; font-size: x-large;">
	<br>
	<br> 
	Password:
	<Input type="text" name="password" 
		style="height: 35px; border-radius: 10px; font-size: x-large;">
		<input type="submit" value="Sumbit Request" style="text-align: center; font-size: xx-large; background-color: Green; color: white; border-radius: 20px; height: 50px; margin-top: 20px;">

</form>
</body>
</html>