<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>updateForm.jsp</title>
	<style>
	*{font-family: gulim; font-size: 24px;}
	</style>
	<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="title">음원 수정</div>
	<form name="frm" method="post" action="update.do" enctype="multipart/form-data">
	<!-- 부모글번호(음원목록을 유지하기 위해) -->
		<input type="hidden" name="mediagroupno" value="${dto.mediagroupno}"> <!-- 부모글번호 -->
		<input type="hidden" name="mediano" value="${dto.mediano}"> <!-- 부모글번호 -->
		<table class='table'>
        <tr>
          <th>제목</th>
          <td><input type='text' name='title' size='50' value="${dto.title}"></td>
        </tr>
        <tr>
          <th>포스터</th>
          <td>
          	<img src="../storage/${dto.poster}" width="250"><br> 
          	<input type='file' name='posterMF' size='100'>
          </td>    
        </tr>
        <tr>
          <th>미디어 파일</th>
          <td>
          	등록된 파일명 : ${dto.filename}<br>
          	<input type='file' name='filenameMF' size='50'>
          </td>    
        </tr>  
        </table>
        
        <div class="bottom">
			<input type="submit" value="음원수정">
			<input type="button" value="음원목록" onclick="location.href='list.do?mediagroupno=${dto.mediagroupno}'">
			<input type="button" value="HOME" onclick="location.href='/home.do'"><!-- 절대경로 -->
		</div>
        
	</form>

</body>
</html>