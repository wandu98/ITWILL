<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문 시작 pdsRead.jsp-->
<h3>* 포토갤러리 상세보기 *</h3>
<p><a href="pdsForm.jsp">[사진올리기]</a></p>
<%
	int pdsno = Integer.parseInt(request.getParameter("pdsno"));
	dto = dao.read(pdsno);
	if(dto==null) {
		out.println("해당 글 없음!");
	} else {
		dao.incrementCnt(pdsno); //조회수 증가
%>
	<table class="table">
	<tr>
		<th>글제목</th>
		<td><%=dto.getSubject() %></td>
	</tr>
	<tr>
		<th>사진</th>
		<td><img src="../storage/<%=dto.getFilename()%>"></td>
	</tr>
	<tr>
		<th>파일크기</th>
		<td><%=Utility.toUnitStr(dto.getFilesize())%></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><%=dto.getWname() %></td>
	</tr>
	<tr>
		<th>작성일</th> 
		<td><%=dto.getRegdate() %></td>
	</tr>
	</table>
	<input type="button" value="수정" 	class="btn btn-warning" onclick="location.href='pdsUpdate.jsp?pdsno=<%=pdsno%>'">
	<input type="button" value="삭제" class="btn btn-danger"	onclick="location.href='pdsDel.jsp?pdsno=<%=pdsno%>'">
<%
	}//if end
%>
  
<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>