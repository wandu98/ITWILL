<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>detail.jsp</title>
	<script src="/js/jquery-3.6.0.min.js"></script>
	<link href="/css/main.css" rel="stylesheet" type="text/css">
	<script>
	function product_update(){
		document.form1.action="/product/update";
		document.form1.submit();
	}//product_update() end
	
	function product_delete(){
		if(confirm("영구히 삭제됩니다\n진행할까요?")){
			document.form1.action="/product/delete";
			document.form1.submit();
		}//if end
	}//product_delete() end
	</script>
</head>
<body>
	<h3>상품상세보기 / 상품수정 / 상품삭제</h3>
	<p>
		<button type="button" onclick="location.href='/product/list'">상품전체목록</button>
	</p>
	<form name="form1" method="post" enctype="multipart/form-data">
	<table border="1">
	<tr>
		<td>상품명</td>
		<td> <input type="text" name="product_name" value="${product.PRODUCT_NAME}"> </td>
	</tr>
	<tr>
		<td>상품가격</td>
		<td> <input type="number" name="price" value="${product.PRICE}"> </td>
	</tr>
	<tr>
		<td>상품설명</td>
		<td>
			<textarea row="5" cols="60" name="description">${product.DESCRIPTION}</textarea>
		</td>
	</tr>
	<tr>
		<td>상품사진</td>
		<td>
			<c:if test="${product.FILENAME != '-'}">
				<img src="/storage/${product.FILENAME}" width="100px">
			</c:if>
			<br>
			<input type="file" name="img">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="hidden" name="product_code" value="${product.PRODUCT_CODE}">
			<input type="button" value="상품수정" onclick="product_update()">
			<input type="button" value="상품삭제" onclick="product_delete()">	
		</td>
	</tr>
	</table>
	</form>
	
	<hr>
	<!-- 댓글  -->
	
	
	
</body>
</html>