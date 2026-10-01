<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.himanshu.Entity.*"%>
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
		<div>

			<form action="/Hospital_Management_System/doctor/doctorMenu.jsp">

				<input type="submit" value="&larr;"
					style="height: 30px; font-size: x-large; background-color: green; color: white; border-radius: 10px; width: 70px">

			</form>
		</div>
		<div>Welcome</div>

		<div>
			<%@ include file="logout.jsp"%></div>
	</header>
	<hr>

	
			<%
			List<Patient> p = (List<Patient>) request.getAttribute("patientList");

			if (p != null && !p.isEmpty()) {%>
			
			<div style="display: grid;">

		<table border="1"
			style="display: grid; place-content: center; margin-top: 3%; padding: 4%; border-spacing: 0px; border: 1; border-style: thick; border-collapse: collapse; background-color: White; color: black; font-size: x-large; background-color: black; border-color: black; color: white; text-align: center;">

			<tr>

				<th colspan="5" style="font-size: xx-large;">The Pending Doctor
					Details Are as Follow's:</th>

			</tr>

			<tr>

				<th colspan="5" height="30px"></th>
			</tr>

			<tr>
				<th style="width: 1in;">Id</th>
				<th style="width: 1.5in;">Name</th>
				<th style="width: 1in;">Age</th>
				<th style="width: 1.5in;">Phone</th>
				<th style="width: 1.5in;">Disease</th>
			</tr>
			
			<%
				for (Patient g : p) {
			%>

			<tr>

				<td><%=g.getId()%></td>
				<td><%=g.getName()%></td>
				<td><%=g.getAge()%></td>
				<td><%=g.getPhone_number()%></td>
				<td><%=g.getDisease()%></td>

			</tr>
		<%
		} %>
		</table>
		 <%}else {
		%>
		<div style="display: grid; place-content: center; border: thick;border-color: white; border-style: solid; border-radius: 30px;"><h1>No Pending Patients</h1></div>
		<%
		}
		%>

	</div>

</body>
</html>