<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../header.jsp" %>
 <!-- 본문시작 mailForm.jsp -->
<h3>* 메일 보내기 *</h3>
<form method="post" action="mailProc.jsp">
	<table class="table">
	<tr>
	    <th>받는사람</th>
		<td><input type="email" name="to"></td>
	</tr>
	<tr>
	    <th>보내는사람</th>
		<td><input type="email" name="from"></td>
	</tr>
	<tr>
	   <th>제목</th>
	   <td><input type="text" name="subject"></td>
	 </tr>
	 <tr>
	   <th>내용</th>
	   <td><textarea rows="5" cols="30" name="content"></textarea></td>
	 </tr>
	 <tr>
	   <td colspan="2">
	     <input type="submit" value="메일보내기" class="btn btn-primary">
	     <input type="reset"  value="취소"      class="btn btn-primary">
	   </td>
	 </tr> 
	</table>
</form>
 <!--  본문끝 -->
 <%@ include file="../footer.jsp" %>