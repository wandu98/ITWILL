<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>04_함수.jsp</title>
	<link rel="stylesheet" href="../css/reset.css">
	<script src="../js/jquery-3.6.1.min.js"></script>
</head>
<body>
	<h3>JSP 사용자 정의 함수</h3>
	최대값 : <%=max(3,5)%>
	<hr>
	두수 사이의 차이 : <%=diff(2,6)%>
	
<%!
	//JSP에서 함수 작성 영역 (많이 사용 안 함)
	public int max(int a, int b){
		return Math.max(a, b);
	}//max() end
	
	public int diff(int a, int b){
		return Math.abs(a-b);
	}//diff() end

%>
	
	
</body>
</html>