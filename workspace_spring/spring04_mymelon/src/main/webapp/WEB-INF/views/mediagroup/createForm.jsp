<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>createForm.jsp</title>
	<style>
		*{ font-famliy: gulim; font-size: 24px; }
	</style>
	<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="title">미디어 그룹 등록</div>
	<form name='frm' method='POST' action='create.do'>
	<table class='table'>
	<tr>
		<th>미디어 그룹 제목</th>
		<td><input type='text' name='title' size='50' value='2022년 댄스 음악'></td>
	</tr>
	</table>
	<div class='bottom'>
		<input type='submit' value='등록'>
		<input type='button' value='목록' onclick="location.href='list.do'">
	</div>
	</form>
</body>
</html>