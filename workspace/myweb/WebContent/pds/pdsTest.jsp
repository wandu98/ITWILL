<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
 <html>
 <head>
 	<meta charset="UTF-8">
 	<title>pdsTest.jsp</title>
 </head>
 <body>
 	<h3>* 파일 첨부 테스트 *</h3>
	<form method="post" action="pdsTestProc.jsp" enctype="multipart/form-data">
													<!-- 파일 첨부 시 반드시  -->
		이름: <input type="text" name="uname"> <br>
		제목: <input type="text" name="subject"> <br>
		내용: <textarea rows="5" cols="20" name="content"></textarea> <br>
		첨부: <input type="file" name="filenm"><br>
		<input type="submit" value="전송">
	</form> 	
 </body>
 </html>