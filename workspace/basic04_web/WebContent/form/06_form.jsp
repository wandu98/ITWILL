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
<title>06_form.jsp</title>
</head>
<body>
	<div class="container">
	<h3>* 성적 입력 *</h3>
	<form name="sungjukfrm" id="sungjukfrm" method="post" action="06_ok.jsp">
		이름:<input type="text" name="uname" id="uname" size="40" maxlength="20" placeholder="이름" required> 
		<hr>
		국어:<input type="number" name="kor" id="kor" size="20" min="0" max="100">
		<hr>
		영어:<input type="number" name="eng" id="eng" size="20" min="0" max="100">
		<hr>
		수학:<input type="number" name="mat" id="mat" size="20" min="0" max="100">
	  	<hr>
	  	<input type="submit" class="btn btn-success" value="전송">
	  	<input type="reset"  class="btn btn-danger" value="취소">
	</form>
	<!--
	● [<form> 관련 다양한 속성들] 
	   사용자가 입력한 정보를 서버로 전소하기 위한 양식
	   name    : 폼이름 서버에서 식별하기 위한 양식
	   id      : 폼아이디 Frontend단에서 식별자로 주로 사용
	   method  : 폼 전송방식 get | post방식 생략시 기본은 get방식
	   action  : 사용자가 요청한 정보를 서버가 받아서 처리할 결과 페이지
	   enctype : 폼에서 파일을 첨부해서 서버로 전송하고자 할 때 "multipart/form-data" 추가
	
	● [폼 전송방식]
	1) method=get방식
		- 생략시 기본값
		- 사용자가 입력 요청한 정보가 URL 그대로 노출
		- 한글 안 깨짐
		- ok.jsp?서버로 전송되는 값들
		  형식) 요청페이지(또는 명령어)?변수=값&변수=값&변수=값~~
		   예)06_ok.jsp?uname=대한민국&kor=40&eng=50&mat=60
		- 예)검색어
		            
    2) method=post방식
    	- 사용자가 요청한 정보가 URL에 노출되지 않고 팩키지화 되어서 서버로 전송
    	- 한글 깨짐
    	- 예) 비번, 주민번호, 카드번호 등
    	                         
	 -->
	 </div>
</body>
</html>