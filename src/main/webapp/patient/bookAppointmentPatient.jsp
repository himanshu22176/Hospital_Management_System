<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.himanshu.Entity.*" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="color: white; background-color: black; ">
	<header style="width: 100%; display: flex; justify-content: space-between;align-items: flex-start; height: 30px; font-size: x-large;">
	<div>
	
	<form action="/Hospital_Management_System/patient/patientMenu.jsp">
	
	<input  type="submit" value="&larr;" style="height: 30px; font-size: x-large; background-color: green; color: white; border-radius: 10px; width: 70px">
	
	</form>
	</div>
	<div>Welcome</div>
	
	<div>
		<%@ include file="logout.jsp"%></div>
	</header>
	<hr>
	
	
	<form action="" style="display:grid; place-content:center; justify-content:center; color: white; font-size: x-large; flex-direction:column;">
	Describe Your Problem:<input type="text" name="problem" style="height: 35px;border-radius: 10px; font-size: x-large;"> 	<br><br>
	Doctor:<select name="docName" style="height: 35px;border-radius: 10px; font-size: x-large;"> 
		<option value="" disabled="disabled" selected="selected">Doctor Name - Speciality</option>
		<c:forEach items="${docNames}" var= "na">
		
			<option value="${na.id}">${na.name} - ${na.speciality}</option>
		
		</c:forEach>
	
	</select>
	
	<% 
	Doctor d= (Doctor) request.getAttribute("doctor");
	String message= d!=null? d.getFees():null;
	if(message!=null) {%>
		<h3 style="color: green;">Total Fees: ₹<%= message %></h3>
		<input type="submit" value="Sumbit Request" formaction="${pageContext.request.contextPath}/book" style="text-align: center; font-size: xx-large; background-color: Green; color: white; border-radius: 20px; height: 50px; margin-top: 20px;">
	<% } 
	else{ %>
		<input type="submit" value="Calculate Fees" formaction="${pageContext.request.contextPath}/calculateFees" style="text-align: center; font-size: xx-large; background-color: Green; color: white; border-radius: 20px; height: 50px; margin-top: 20px;">
	<%} %>
	
	</form>
	
	
	
	
	
	
	
</body>
</html>