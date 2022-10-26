<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>errorTest.jsp</title>
</head>
<body>
	<h3>에러 메세지 확인</h3>
<%
	//에러가 발생하는 경우, 에러 메세지를 직접 출력하지 않고, 다른 페이지로 이동할 필요가 있음
	//-> /WEB-INF/web.xml 배치 관리자에서 지정
	
	//1) HTTP 상태 404 - 찾을 수 없음
	//http://localhost:8080/basic05_mvc/error/list.jsp
	
	
	//2) HTTP 상태 500 - 내부 서버 오류
	//http://localhost:8080/basic05_mvc/error/errorTest.jsp
	//-> ?뒤에 Query String값으로 kor값을 넘겨야 에러가 발생하지 않음
	//-> 에러 해결 http://localhost:8080/basic05_mvc/error/errorTest.jsp?kor=30
	int num=Integer.parseInt(request.getParameter("kor"));
	out.print("num:" + num);
%>
	
	
</body>
</html>