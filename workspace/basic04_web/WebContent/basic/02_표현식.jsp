<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_표현식.jsp</title>
</head>
<body>
	<h3>표현식</h3>
<%
	String name="코로나";
	int kor=80, eng=85, mat=100;
	int aver=(kor+eng+mat)/3;
	
	//1)출력
	out.println("이름:" + name + "<br>");
	out.println("국어:" + kor + "<br>");
	out.println("영어:" + eng + "<br>");
	out.println("수학:" + mat + "<br>");
	out.println("평균:" + aver + "<br>");
	out.println("<hr>");

	//2)출력
	out.println("<table border='1'>");
	out.println("<tr>");
	out.println("	  <th>이름</th>");
	out.println("	  <td>"+name+"</td>");
	out.println("</tr>");
	out.println("<tr>");
	out.println("	  <th>국어</th>");
	out.println("	  <td>"+kor+"</td>");
	out.println("</tr>");
	out.println("<tr>");
	out.println("	  <th>영어</th>");
	out.println("	  <td>"+eng+"</td>");
	out.println("</tr>");
	out.println("<tr>");
	out.println("	  <th>수학</th>");
	out.println("	  <td>"+mat+"</td>");
	out.println("</tr>");
	out.println("<tr>");
	out.println("	  <th>평균</th>");
	out.println("	  <td>"+aver+"</td>");
	out.println("</tr>");
	out.println("</table>");
%>
	<hr>
	<!-- 3)표현식(Expression) : out.print() 단축키 -->
	<table border="1">
	<tr>
		<th>이름</th>
		<td><%=name%></td>
	</tr>
	<tr>
		<th>국어</th>
		<td><%=kor%></td>
	</tr>
	<tr>
		<th>영어</th>
		<td><%=eng%></td>
	</tr>
	<tr>
		<th>수학</th>
		<td><%=mat%></td>
	</tr>
	<tr>
		<th>평균</th>
		<td><%=aver%></td>
	</tr>
	</table>
</body>
</html>