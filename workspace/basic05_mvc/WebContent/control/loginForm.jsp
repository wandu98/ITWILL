<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h3>* 회원 로그인 *</h3>
	<form method="post" action="loginproc.do">
		아이디 : <input type="text" name="uid"><br>
	    비번  : <input type="password" name="upw"><br>
	           <input type="submit" value="확인">
	</form>
	<!-- 
		1) JSP 페이지 호출
		   http://localhost:8080/basic05_mvc/control/loginForm.jsp
		
		2) 서블릿을 이용해서 JSP 페이지 호출
		   http://localhost:8080/basic05_mvc/login.do
		   
		   
	 -->
</body>
</html>