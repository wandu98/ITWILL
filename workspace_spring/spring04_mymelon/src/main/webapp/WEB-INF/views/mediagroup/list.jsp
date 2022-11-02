<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>list.jsp</title>
	<style>
		*{ font-famliy: gulim; font-size: 24px; }
	</style>
	<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="title">미디어 그룹 목록</div>
	<div class="content">
		<input type="button" value="그룹등록" onclick="location.href='create.do'">
	</div>
	
	<c:if test="${requestScope.count==0}">
		<table><tr><td>게시판 글 없음!!	</td></tr></table>
	</c:if>
	
	<c:if test="${requestScope.count>0}">
		<table>
		<tr>
			<th>그룹번호</th>
			<th>그룹제목</th>
			<th>수정/삭제</th>
		</tr>
		
		<!-- MediagroupCont의 list()함수에서 mav.addObject("list")를 가르킴 -->
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.mediagroupno}</td>
				<td>${dto.title}</td>
				<td>
					<input type="button" value="수정">
					<input type="button" value="삭제">
				</td>
			</tr>
		</c:forEach>
		</table>
	</c:if>
	
	<!-- 페이지 리스트 -->
	<c:if test="${requestScope.count>0}">
	   <c:set var=:"pageCount" value="${requestScope.totalPage}"/>
	   <c:set var=:"startPage" value="${requestScope.startPage}"/>
	   <c:set var=:"endPage"   value="${requestScope.endPage}"/>
	   
	   <div class="content">
	   	<c:if test="${endPage>pageCount}">
	   		<c:set var="endPage" value="${pageCount+1}"/>
   		</c:if>
	   </div>
   </c:if>
</body>
</html>