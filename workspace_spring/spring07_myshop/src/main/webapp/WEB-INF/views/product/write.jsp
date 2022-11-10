<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>write.jsp</title>
	<link href="../css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h3>상품목록</h3>
	<p>
		<button type="button" onclick="location.href='list'">상품전체목록</button>
	</p>
	
	<form name="form1" method="post" action="insert" enctype="multipart/form-data">
	<table border="1">
	<tr>
		<td>상품명</td>
		<td><input type="text" name="product_name"></td>
	</tr>
	<tr>
		<td>상품가격</td>
		<td><input type="number" name="price"></td>
	</tr>
	<tr>
		<td>상품설명</td>
		<td>
			<textarea rows="5" cols="60" name="description"></textarea>
		</td>
	</tr>
	<tr>
		<td>상품사진</td>
		<td><input type="file" name="img"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="상품등록">
		</td>
	</tr>
			
	</table>
	</form>
</body>
</html>