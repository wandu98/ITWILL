<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../header.jsp" %>
 <!-- 본문시작 memberWithdraw.jsp -->
 <h3>* 회원탈퇴 *</h3>
 <form method="post" action="memberWithdrawProc.jsp" onsubmit="return pwCheck()"><!-- myscript.js -->
 	<table class="table">
 	<tr>
 		<th class="success">비밀번호</th>
 		<td><input type="password" name="passwd" id="passwd" required></td> 
 	</tr>
 	<tr>
 		<td colspan="2">
 			<input type="submit" value="회원탈퇴" class="btn btn-danger">
		</td>
	</tr>
 	</table>
 </form>
 <!--  본문끝 -->
 <%@ include file="../footer.jsp" %>