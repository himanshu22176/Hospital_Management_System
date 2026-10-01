<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="${pageContext.request.contextPath}/checkOtp">
	Enter OTP:<input type="text" name="otpDetails" >
	<input type="submit">
	</form>
</body>
</html>