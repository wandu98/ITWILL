<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>computeForm.jsp</title>
</head>
<body>
	<h3>* 계산기 *</h3>
	<!-- 1) JSP 메소드  
	<form action="computeok1.jsp">
	-->
	<!-- 2) new 연산자  -->  
    <form action="computeok2.jsp">
    
    <!-- 3) Java Bean  
    <form action="computeok3.jsp">
    -->
	  <table border="1">
	  <tr>
	    <th>숫자1</th>
	    <td><input type="number" name="num1" size="5"></td>
	  </tr>
	  <tr>
	    <th>숫자2</th>
	    <td><input type="number" name="num2" size="5"></td>
	  </tr>
	  <tr>
	    <td colspan="2">
	       <input type="submit" value="계산">
	    </td>
	  </tr>  
	  </table>	
	</form>
</body>
</html>