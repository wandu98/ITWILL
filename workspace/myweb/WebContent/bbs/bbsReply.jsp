<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../header.jsp" %>
 <!-- 본문시작 template.jsp -->
 <h3>* 답변 쓰기 *</h3>
 <p><a href="bbsList.jsp">[글목록]</a></p>
 <form name="bbsfrm" id="bbsfrm" method="post" action="bbsReplyProc.jsp" onsubmit="return bbsCheck()"><!-- myscript.js  -->
 	<!-- 부모글번호  -->
 	<input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno")%>">
	<table class="table">
		<tr>
		   <th class="success">작성자</th>
		   <td><input type="text" name="wname" id="wname" class="form-control" maxlength="20" required></td>
		</tr>
		<tr>
		   <th class="success">제목</th>
		   <td><input type="text" name="subject" id="subject" class="form-control" maxlength="100" required></td>
		</tr>
		<tr>
		   <th class="success">내용</th>
		   <td><textarea rows="5"  class="form-control" name="content" id="content"></textarea></td>
		</tr>
		<tr>
		   <th class="success">비밀번호</th>
		   <td><input type="password" name="passwd" id="passwd" class="form-control" maxlength="10" required></td>
		</tr>
		<tr>
		    <td colspan="2" align="center">
		       <input type="submit" value="답변쓰기" class="btn btn-success">
		       <input type="reset"  value="취소" class="btn btn-danger">
		    </td>
	    </tr>
	</table>	
 </form>
   
 <!--  본문끝 -->
 <%@ include file="../footer.jsp" %>