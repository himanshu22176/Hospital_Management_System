<%@
 page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"
	import="java.util.*, com.himanshu.Entity.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Details:</title>


</head>
<body
	style="height: auto; width: auto; background-color: black; display: grid; place-content: center;">
	<div style="display: flex; justify-content: center;">
		<table border="1"
			style="border-spacing: 0px; border: 0px; border-style: hidden; border-collapse: collapse; background-color: White; color: black; font-size: x-large; background-color: black; border-color: black; color: white; text-align: center;">

			<tr>

				<th colspan="5">The Patient Details Are as Follow's:</th>

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
			List<Patient> p = (List<Patient>) request.getAttribute("objView");
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
			}
			%>
		</table>
	</div>

<form action="/patient">
	<input type="submit" value="Go Back to Homepage"
		style="background-color: green; color: white; font-size: x-large; width: 260px; height: 50px; border-radius: 20px;"
		formaction="${pageContext.request.contextPath}/patient/Welcome.jsp">
</form>
</body>
</html>