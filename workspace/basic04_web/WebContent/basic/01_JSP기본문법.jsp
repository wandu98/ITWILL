<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
    
<%-- JSP 코드 주석 --%>
<%-- JSP 주석 자동 코딩 Ctrl+Shift+/ --%>
<%--
	●[한글 인코딩] - 섞어 쓰지 않도록 주의
	 - 조합형(UTF-8)  : 초성+중성+종성으로 조합. 더 많은 한글 표현이 가능
	 - 완성형(EUC-KR) : MS949 

	● JSP Directive(지시자) 선언이 안 되면 Error 발생한다 꼭 해줘야 됨 
	  <%@ page %>
	  <%@ include %>
	  <%@ taglib %>
	  
	● <%@ page %> 지시자
	  language=""		생략가능
	  contentType=""	필수요소
	  pageEncoding=""	생략가능
	  import=""			자바팩키지 및 자바클래스 선언
	  
  	● JSP페이지에서 사용 가능한 문법
  	  - HTML tag
  	  - CSS			<style></style>
  	  - JavaScript	<script></script>
  	  - JSP			<% %>
  	  
  	● JSP코드 작성 영역 선언
  	 <%  %> 스크립트릿(Scriptlet)  
	   
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01_JSP기본문법.jsp</title>
</head>
<body>
	
	<h3>JSP 기본문법</h3>
	<hr>
	<h4>대한민국</h4>
	<hr>
	1+2+3
	<hr>
<%
	//한줄 주석
	/* 여러줄 주석 */
	/*
	 스크립트릿(Scriptlet)
	 - JSP 코드 작성 영역
	 - Tomcat WAS에  의해 JSP코드가 해석되고, 결과값을 HTML문서로 변환해서
	   Frontend단으로 응답해 준다
	*/
	out.print("무궁화");
	out.print(123+456);
	out.print(5+7);
	out.print(8.9);
	out.print('X');
	/*
		● 결과확인
        http://localhost:8080/basic04_web/basic/01_JSP기본문법.jsp
        - http://                프로토콜
        - localhost:8080/        내시스템:port번호
        - basic04_web            Context Path 프로젝트명
        - /basic/01_JSP기본문법.jsp 경로명 및 파일명
        
		● 가상의 경로 basic04_web
	    basic04_web의 실제 물리적 경로(src/main/webapp)는 외부에서 접근 불가능
	    프로젝트명 basic04_web으로 접근해야 한다
	    에러 http://localhost:9090/src/main/webapp/basic/01_JSP기본문법.jsp
    */
    
    //HTML 태그를 JSP에서 사용하는 경우 "" 안에서 작성
    out.print("<h1>워그레이몬</h1>");
	out.print("<img src='../images/wargreymon.jpeg'>");
	out.print("<hr>");
%>
<%-- 스크립트릿 주석 윈도우 Ctrl+Shift+/ Mac command+/
<%
	//스크립트릿은 문서에 여러번 가능하다
	out.println("<style>.txt{color:red}</style>");
	out.println("<span class=txt>오필승코리아</span>");
	
	
%>
 --%>	
	
</body>
</html>