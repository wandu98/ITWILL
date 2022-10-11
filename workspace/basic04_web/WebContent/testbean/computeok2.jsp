<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.testbean.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>computeok2.jsp</title>
</head>
<body>
	<h3>* 계산 결과 *</h3>
	<h4>2) new 연산자를 이용해서 객체생성 후 메소드 호출</h4>
<%
	int num1=Integer.parseInt(request.getParameter("num1").trim());
	int num2=Integer.parseInt(request.getParameter("num2").trim());
	
	//객체생성 new Compute()
	//->RAM의 heap영역에 메모리가 할당되는 것
	Compute comp=new Compute();
	
	out.print(num1 + "+" + num2 + "=" + comp.add(num1,num2));
	out.print("<hr>");
	out.print(num1 + "-" + num2 + "=" + comp.sub(num1,num2));
	out.print("<hr>");
	out.print(num1 + "*" + num2 + "=" + comp.mul(num1,num2));
	out.print("<hr>");
	out.print(num1 + "/" + num2 + "=" + comp.div(num1,num2));
	out.print("<hr>");
	out.print(num1 + "%" + num2 + "=" + comp.mod(num1,num2));
	out.print("<hr>");
%>
</body>
</html>