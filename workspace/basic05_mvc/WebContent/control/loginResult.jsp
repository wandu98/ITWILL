<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>loginResult.jsp</title>
</head>
<body>
	<h3>* 회원 로그인 결과 *</h3>
	
	아이디 : <%=request.getAttribute("r_uid")%><br>
	비번  : <%=request.getAttribute("r_upw")%><br>
	<hr>
	
	2)EL (표현언어)<br>
	아이디 : ${requestScope.r_uid}<br>
	비번 : ${requestScope.r_upw}<br>
	
	<!-- Scope는 생략 가능하다 -->
	아이디 : ${r_uid}<br> 
	비번 : ${r_upw}<br>
	
	
	 
</body>
</html>