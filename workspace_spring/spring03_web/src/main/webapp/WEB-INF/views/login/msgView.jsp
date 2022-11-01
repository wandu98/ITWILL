<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>msgView.jsp</title>
</head>
<body>
	<h2>로그인 결과</h2>

		${requestScope.message}
		<p>${requestScope.link}</p>
		<hr>
		
		${message}
		<p>${link}</p>
		
</body>
</html>