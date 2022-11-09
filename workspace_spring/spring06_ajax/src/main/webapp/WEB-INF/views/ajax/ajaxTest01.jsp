<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ajaxTest01.jsp</title>
	<script src="../js/jquery-3.6.1.min.js"></script>
	<script src="../js/jquery.cookie.js"></script>
</head>
<body>
	<script>
		alert($);
	</script>
	
	● AJAX (Asynchronous JavaScript and XML)
	https://www.egovframe.go.kr/wiki/doku.php?id=egovframework:rte3.9:ptl:jquery_ajax
	  - 참조 https://www.w3schools.com/js/js_ajax_intro.asp
	  - 웹페이지 전체를 reload하지 않고, 일부분만 새로고침(reload) 하는 기술 방식
	  - 비동기식 통신(문자단위 통신)
      - 전체 페이지는 1번만 불러오고, 그 이후에는 문자단위(비동기)로 통신이 이루어 진다
      - 자바스크립의 XMLHttpRequest객체를 이용하지만, 사용문법이 복잡해서 jQuery 오픈소스의 ajax()함수를 많이 이용한다
      
      
	● jQuery AJAX 관련 메소드
      - 참조 https://www.w3schools.com/jquery/jquery_ref_ajax.asp
      - $.ajax()
      - $.get()
      - $.post()
      - serialize()
      - 응답받은 메세지를 처리하는 함수를 callback함수라 한다
	
</body>
</html>