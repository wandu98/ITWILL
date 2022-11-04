<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>readMP3.jsp</title>
    <style> 
      *{ font-family: gulim; font-size: 24px; } 
    </style> 
    <link href="../css/style.css" rel="stylesheet" type="text/css">	
</head>
<body>
    <div class="title">MP3 듣기</div>
    <div class="content">
        <p><strong>${dto.title}</strong></p>
        <img src="../storage/${dto.poster}" width="400"><br>
        <audio src="../storage/${dto.filename}" controls></audio>
    </div>
  
    <div class='bottom'>
        <input type="button" value="음원목록" onclick="location.href='list.do?mediagroupno=${dto.mediagroupno}'">
        <input type="button" value="HOME"   onclick="location.href='/home.do'">   
    </div>
    
</body>
</html>