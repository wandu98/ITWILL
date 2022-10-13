<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="ssi.jsp" %>   
 <%@ include file="../header.jsp" %>
 <!-- 본문시작 template.jsp -->
 <!-- 글번호가 일치하는 행을 가져와서, 수정폼에 출력하기 -->
 <h3>* 게시판 수정 *</h3>
 <p>
 	<a href="bbsForm.jsp">[글쓰기]</a>
 	&nbsp;&nbsp;
 	<a href="bbsList.jsp">[글목록]</a>
 </p>
 
<div class="container">
<%
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));//수정 글번호
	dto=dao.read(bbsno);	//글번호가 일치하는 행을 가져오기
	if(dto==null){
		out.println("해당 글 없음!!");		
	}else{
%>
	<form name="bbsfrm" id="bbsfrm" method="post" action="bbsUpdateProc.jsp" onsubmit="return bbsCheck()">
	<table class="table">
	<tr>
	   <th class="success">작성자</th>
	   <td><input type="text" name="wname" id="wname" value="<%=dto.getWname()%>" class="form-control" maxlength="20" required></td>
	</tr>
	<tr>
	   <th class="success">제목</th>
	   <td><input type="text" name="subject" id="subject" value="<%=dto.getSubject()%>" class="form-control" maxlength="100" required></td>
	</tr>
	<tr>
	   <th class="success">내용</th>
	   <td><textarea rows="5"  class="form-control" name="content" id="content"><%=dto.getContent()%></textarea></td>
	</tr>
	<tr>
	   <th class="success">비밀번호</th>
	   <td><input type="password" name="passwd" id="passwd" class="form-control" maxlength="10" required></td>
	</tr>
	<tr>
	    <td colspan="2" align="center">
	       <input type="submit" value="쓰기" class="btn btn-success">
	       <input type="reset"  value="취소" class="btn btn-danger">
	    </td>
	</table>		
	</form>
<%		
	}//if end
%>
</div>
 <!--  본문끝 -->
 <%@ include file="../footer.jsp" %>