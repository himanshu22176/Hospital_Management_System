<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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


	<%
	boolean success = Boolean.parseBoolean(request.getParameter("success"));
	if (success) {
	%>
	<h1 style="color: green;">Added Successfully</h1>
	<%
	}
	%>


	<form action="${pageContext.request.contextPath}/add"
		style="display: grid; place-content: center; justify-content: center; color: white; font-size: x-large; flex-direction: column; margin-top: 12%">

		<input type="submit" value="Review Doctor Requests"
			formaction="${pageContext.request.contextPath}/reviewDoctor"
			formmethod="post"
			style="height: 45px; font-size: xx-large; background-color: green; color: white; border-radius: 10px; width: 4.5in;">
		<input type="submit" value="Invoke Doctor Access"
			formaction="${pageContext.request.contextPath}/invokeDoctor"
			formmethod="post"
			style="height: 45px; font-size: xx-large; background-color: green; color: white; border-radius: 10px; width: 4.5in;">
		<input type="submit" value="Add Admin"
			formaction="${pageContext.request.contextPath}/addAdmin"
			formmethod="post"
			style="height: 45px; font-size: xx-large; background-color: green; color: white; border-radius: 10px; width: 4.5in;">

	</form>

</body>
</html>