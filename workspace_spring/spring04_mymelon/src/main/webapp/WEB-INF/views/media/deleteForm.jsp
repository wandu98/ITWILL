<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>deleteForm.jsp</title>
    <style> 
      *{ font-family: gulim; font-size: 24px; } 
    </style> 
    <link href="../css/style.css" rel="stylesheet" type="text/css">	
</head>
<body>

    <div class="title">음원 삭제</div>
	<form method="post" action="delete.do">
		<input type="hidden" name="mediano" value="${requestScope.mediano}">
		<div class="content">
			<p>음원을 삭제하시겠습니까?</p>
			<p>※ 관련 미디어 파일(mp3, mp4)도 전부 삭제됩니다</p>
	    </div>
	  	<div class='bottom'>
	        <input type='submit' value='삭제진행'>
	        <input type='button' value='HOME' onclick="location.href='/home.do'">
	  </div>
	</form>
  
</body>
</html>