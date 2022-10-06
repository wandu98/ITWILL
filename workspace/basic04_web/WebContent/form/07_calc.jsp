<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>07_calc.jsp</title>
</head>
<body>
	<h3>* 계산기 연습 *</h3>
	<div class="container">
	<form name="calcfrm" id="calcfrm" method="get" action="07_ok.jsp">
		첫번째 수 : <input type="number" name="num1" min="0" max="9999999999" required> 
		<hr>
		연산자 :    <input type="text" name="op" size="3" required>
	  	<hr>
		두번째 수 : <input type="number" name="num2" min="" max="99999999999" required>
		<hr>
		<input type="submit" class="btn btn-success" value="계산">                      
  		<input type="reset"  class="btn btn-danger" value="취소"> 
	</form>
	</div>
</body>
</html>