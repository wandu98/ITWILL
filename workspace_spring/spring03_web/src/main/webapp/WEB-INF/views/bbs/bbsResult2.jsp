<%@page import="kr.co.itwill.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>* 글쓰기 결과 *</title>
</head>
<body>
	<h3>* 글쓰기 결과 *</h3>
	
	1)JSP<br>
<% 
	BbsDTO dto=(BbsDTO)request.getAttribute("dto");
	out.println("작성자 : " + dto.getWname() + "<br>");
	out.println("제목 : " + dto.getSubject() + "<br>");
	out.println("내용 : " + dto.getContent() + "<br>");
	out.println("비번 : " + dto.getPasswd() + "<br>");
%>
	<hr>
	
	2)EL<br>
	<!-- BbsDTO클래스에 반드시 getter와 setter함수가 있어야 함 -->
	작성자 : ${dto.wname}<br>
	제목  : ${dto.subject}<br>
	내용  : ${dto.content}<br>
	비번  : ${dto.passwd}<br>
	
	 
</body>
</html>