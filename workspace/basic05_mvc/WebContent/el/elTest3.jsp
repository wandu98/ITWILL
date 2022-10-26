<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>elTest03.jsp</title>
</head>
<body>
	<h3>* EL 내장객체 (Collection) *</h3>
<%
	//1)JSP 내장객체
	//->pageContext, request, session, application
	
	//내부변수 선언
	pageContext.setAttribute("kor", 100);	//현재 페이지에서만 유효
	request.setAttribute("eng", 200);		//전역변수(부모와 자식페이지에서만 유효)
	session.setAttribute("mat", 300);		//전역변수(모든페이지에서 유효 + 개인사용자 + 시간)
	application.setAttribute("aver", 400);	//전역변수(모든페이지에서 유효 + 모든사용)
%>
	
	1)JSP<br>
	kor : <%=pageContext.getAttribute("kor") %><br>
	eng : <%=request.getAttribute("eng") %><br>
	mat : <%=session.getAttribute("mat") %><br>
	aver : <%=application.getAttribute("aver") %><br>
	<hr>
	
<!--
	2)EL의 내장객체(Collection)
	-> param, pageScope, requestScope, sessionScope, applicationScope
-->
	2)EL<br>
	kor : ${pageScope.kor}<br>
	eng : ${requestScope.eng}<br>
	mat: ${sessionScope.mat}<br>
	aver : ${applicationScope.aver}<br>
	<hr>
	<!-- EL에서는 내장객체명을 생략할 수 있다(pageScope, requestScope, sessionScope, application)  -->
	<!-- EL에서는 page -> request -> session -> application 순으로 자동으로 검색 -->
	kor : ${kor}<br>
	eng : ${eng}<br>
	mat : ${mat}<br>
	aver : ${aver}<br>
	<hr>
	<!-- 각 Scope에서 내장변수명이 동일한 경우  -->
<%
	pageContext.setAttribute("num", 500);
	request.setAttribute("num", 600);
	session.setAttribute("num", 700);
	application.setAttribute("num", 800);
%>
	<!-- 내장객체명이 생략되면 자동으로 작은 영역순으로 찾게 된다  -->
	num : ${num} <!-- 500 -->
	<hr>
	
	<!-- 각 Scope의 내장변수가 없는 경우  -->
	JSP : <%=request.getAttribute("uname")%> <!--  null  -->
	<br>
	EL : @${requestScope.uname}@ 			 <!-- 빈문자열 -->
</body>
</html>