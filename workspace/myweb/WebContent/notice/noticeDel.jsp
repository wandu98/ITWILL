<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../header.jsp" %>
 <!-- 본문시작 noticeDel.jsp -->
 <!-- 글번호(noticeno)가 일치하면 글 삭제  -->
 <h3>* 글삭제 *</h3>
 <p><a href="noticeList.jsp">[글목록]</a></p>
 <%
 	int noticeno=Integer.parseInt(request.getParameter("noticeno"));
 %>
 <div class="container">
 	<form method="post" action="noticeDelProc.jsp" onsubmit="return delCheck()"><!-- myscript.js  -->
 		<input type="hidden" name="noticeno" value="<%=noticeno%>">
 		<table class="table">
 		<tr>
 			<td colspan="2">
 				<input type="submit" value="삭제" class="btn btn-danger">
 			</td>
 		</tr>
 		</table>
 	</form>
 </div>
 <!--  본문끝 -->
 <%@ include file="../footer.jsp" %>