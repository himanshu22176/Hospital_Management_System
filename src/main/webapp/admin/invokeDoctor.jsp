<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="jakarta.tags.core"%>
	
    <%@ page import="com.himanshu.Entity.Doctor" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<body style="height: 90vh; width: auto; background-color: Black; color: white;font-family: sans-serif;">

	<header style="width: 100%; display: flex; justify-content: space-between;align-items: flex-start; height: 30px; font-size: x-large;">
	<div>
	
	<form action="/Hospital_Management_System/admin/adminMenu.jsp">
	
	<input  type="submit" value="&larr;" style="height: 30px; font-size: x-large; background-color: green; color: white; border-radius: 10px; width: 70px">
	
	</form>
	</div>
	<div>Welcome</div>
	
	<div>
		<%@ include file="logout.jsp"%></div>
	</header>
	<hr>

<div style="display: grid;">
	<form action="/admin" style="display:grid; place-content:center; justify-content:center; color: white; font-size: x-large; flex-direction:column;">
	
		<h3 style="font-size: xx-large;">Enter the Doctor Id:</h3><input type="text" name="id" style="height: 35px;border-radius: 10px; font-size: x-large;">
		<div><input type="submit" value="Invoke" formaction="${pageContext.request.contextPath}/removeDoctor" formmethod="post" style=" width:48.5%; height: 35px;border-radius: 10px; font-size: x-large; background-color: green; color: white;">
		
	</form>
	
	
	
			<table border="1"
			style="display:grid; place-content:center; margin-top:3%; padding: 4%; border-spacing: 0px; border: 0px; border-style: hidden; border-collapse: collapse; background-color: White; color: black; font-size: x-large; background-color: black; border-color: black; color: white; text-align: center;">

			<tr>

				<th colspan="6" style="font-size: xx-large;">The Pending Doctor Details Are as Follow's:</th>

			</tr>

			<tr>

				<th colspan="6" height="30px"></th>
			</tr>
			<tr>
				<th style="width: 1in;">Id</th>
				<th style="width: 1.5in;">Name</th>
				<th style="width: 1in;">Age</th>
				<th style="width: 1.5in;">Email</th>
				<th style="width: 1.5in;">Phone</th>
				<th style="width: 1.5in;">Speciality</th>
			</tr>
	<%
			List<Doctor> p = (List<Doctor>) request.getAttribute("doctorList");
			
			if(p!=null && !p.isEmpty()){
			for (Doctor g : p) {
			%>
			

			<tr>

				<td><%=g.getId()%></td>
				<td><%=g.getName()%></td>
				<td><%=g.getAge()%></td>
				<td><%=g.getEmail()%></td>
				<td><%=g.getPhone()%></td>
				<td><%=g.getSpeciality()%></td>

			</tr>
			<%
			}
			}
			else{
			%>
			<tr>
			
			<td colspan="6">No Pending Doctors<td>
			<tr>
			<%} %>
			
			</div>
	</table>
</html>