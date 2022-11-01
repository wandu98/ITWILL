<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>start.jsp</title>
</head>
<body>
	<h3>환영합니다~~</h3>
	${requestScope.message}<br>
	${message}<br>
	
	${requestScope.img}<br>
	${img}<br>
	
</body>
</html>