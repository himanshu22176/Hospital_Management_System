<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="height: 90vh; width: auto; background-color: Black; color: white;  font-family: sans-serif;">

	<header style="width: 100%; display: flex; justify-content: space-between;align-items: flex-start; height: 30px; font-size: x-large;">
	<div>
	
	<form action="/Hospital_Management_System/admin/reviewDoctor.jsp">
	
	<input  type="submit" value="&larr;" style="height: 30px; font-size: x-large; background-color: green; color: white; border-radius: 10px; width: 70px">
	
	</form>
	</div>
	<div>Welcome</div>
	
	<div>
		<%@ include file="logout.jsp"%></div>
	</header>
	<hr>

	<form action="${pageContext.request.contextPath}/fees" method="post" style="display:grid; place-content:center; justify-content:center; color: white; font-size: x-large; flex-direction:column;">
	
		<h3 style="font-size: xx-large;">Enter the fees for doctor: </h3><input type="text" name= "fees" style="height: 35px;border-radius: 10px; font-size: x-large;">
		<input type="submit" style="text-align: center; font-size: xx-large; background-color: Green; color: white; border-radius: 20px; height: 50px; margin-top: 20px;">
		
	</form>

</body>
</html>