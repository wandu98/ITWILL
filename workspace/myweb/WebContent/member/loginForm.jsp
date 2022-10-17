<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<meta charset="UTF-8">
<!-- 본문시작 loginForm.jsp  -->
<title>* 로 그 인 *</title>
<form name="Loginfrm" id="Loginfrm" action="loginProc.jsp">
	<table class="table">
			<tr>
			    <td>
				   <input type="text" name="id" id="id" placeholder="아이디" maxlength="10" required>
			    </td>
			    <td rowspan="2">
			    <!-- type=image는 기본속성이 submit  -->
				   <input type="image" src="../images/bt_login.gif">		   
			    </td>
			</tr>
			<tr>
			   <td>
			      <input type="password" name="passwd" id="passwd" placeholder="비밀번호" maxlength="10" required>
			   </td>
			</tr>
			<tr>
			   <td colspan="2">
			      <label><input type="checkbox" name="c_id" value="SAVE">아이디 저장</label>			  
				  &nbsp;&nbsp;&nbsp;
				  회원가입
				  &nbsp;&nbsp;&nbsp;
				  아이디/비밀번호찾기
			   </td>
			</tr>		  
			</table>
	
</form>
<!--  본문끝 -->
 <%@ include file="../footer.jsp" %>