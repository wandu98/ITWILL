<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jstlTest2ok2.jsp</title>
</head>
<body>
	<h3>* 결과페이지(JSTL) *</h3>
	
	<c:set var="name" value="${param.name}"></c:set>
	<c:set var="age" value="${param.age}"></c:set>
	
	
	이름 : ${name} / <c:out value="${name}"></c:out> <br> 
	나이 : ${age} /  <c:out value="${age}"></c:out> <br>	
	
	<!-- 조건문  -->
	<c:if test="${name=='itwill'}">대한민국</c:if>
	
	<!-- 다중 조건문 -->
	<c:choose>
		<c:when test="${age<10}">어린이</c:when>
		<c:when test="${age<20}">청소년</c:when>
		<c:otherwise>성인</c:otherwise>
	</c:choose>

	<!-- 반복문  -->
	<c:forEach var="a" begin="1" end="${age}" step="1">
		<c:out value="#"></c:out>
	</c:forEach>
	
	<c:forEach var="a" begin="1" end="${age}" step="1">
		<c:choose>
			<c:when test="${a%2==0}">
				<span style='color:blue'>${a}</span>
			</c:when>
			<c:when test="${a%2==1}">
				<span style='color:red'>${a}</span>
			</c:when>
		</c:choose>
	</c:forEach>
</body>
</html>