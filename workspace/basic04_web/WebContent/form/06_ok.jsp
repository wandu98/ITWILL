<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<title>06_ok.jsp</title>
</head>
<body>
	<h3>* 성적 결과 *</h3>
<%
	//request 내부객체 
	//->사용자가 요청한 모든 정보를 관리하는 객체
	
	//request.getParameter("") 메소드
	//->사용자가 입력한 정보를 개별적으로 가져올 때
	//->예)<input type="text" name="uname">
	//	   request.getParameter("uname") 사용자가 입력한 uname값 가져옴
	/*
	out.print(request.getParameter("uname"));
	out.print("<hr>");
	out.print(request.getParameter("kor"));
	out.print("<hr>");
	out.print(request.getParameter("eng"));
	out.print("<hr>");
	out.print(request.getParameter("mat"));
	out.print("<hr>");
	*/
	
	//method=post방식이면 한글이 깨짐
	//한글 인코딩
	request.setCharacterEncoding("UTF-8");		//조합형
	//request.setCharacterEncoding("EUC-KR");	//완성형
	
	//사용자가 입력 요청한 정보를 개별적으로 가져오기
	String uname=request.getParameter("uname").trim();
	int kor=Integer.parseInt(request.getParameter("kor").trim());
	int eng=Integer.parseInt(request.getParameter("eng").trim());
	int mat=Integer.parseInt(request.getParameter("mat").trim());
	int aver=(kor+eng+mat)/3;
%>
	<!--  성적결과 테이블에 출력 -->  
	<div  class="container">
		<table class="table table-bordered">
		<tr>
			<th class="info">이름</th>
			<td><%=uname%></td>
		</tr>
		<tr>
			<th class="info">국어</th>
			<td><%=kor%></td>
		</tr>	
		<tr>
			<th class="info">영어</th>
			<td><%=eng%></td>
		</tr>
		<tr>
			<th class="info">수학</th>
			<td><%=mat%></td>
		</tr>
		<tr>
			<th class="info">평균</th>
			<td><%=aver%></td>
		</tr>
		</table>
	</div>
</body>
</html>