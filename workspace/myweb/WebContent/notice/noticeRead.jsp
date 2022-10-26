<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %> 
<%@ include file="../member/auth.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문시작 noticeRead.jsp -->
<h3>* 공지사항 상세보기 *</h3>
<p>
	<% if(s_mlevel.equals("A1")){ %><a href="noticeForm.jsp">[글쓰기]</a><% }//if end %>
	&nbsp;&nbsp;
	<a href="noticeList.jsp?col=<%=col%>&word=<%=word%>">[글목록]</a>
</p>
<div class="container">
<% 
	int noticeno=Integer.parseInt(request.getParameter("noticeno"));	
	dto=dao.read(noticeno);
	if(dto==null){
		out.println("해당 글 없음!!");
	}else{ 
		dao.incrementCnt(noticeno);	//조회수 증가
%>
		<table class="table">
		<tr>
			<th class="success">제목</th>
			<td><%=dto.getSubject()%></td>
		</tr>
		<tr>
			<th class="success">내용</th>
			<td style="text-align: left">
<%		
				//특수문자 치환하기
				//사용자가 입력한 엔터(\n)를 <br>태그로 바꾸기
				String content=Utility.convertChar(dto.getContent());
				out.print(content);
%>
			</td>
		</tr>
		<tr>
			<th class="success">조회수</th>
			<td><%=dto.getReadcnt()%></td>
		</tr>
		<tr>
			<th class="success">작성일</th>
			<td><%=dto.getRegdt()%></td>
		</tr>
		</table>
		<br>
<%      if(s_mlevel.equals("A1")){ %>
		<input type="button" value="답변쓰기" class="btn btn-info" 	onclick="location.href='noticeReply.jsp?noticeno=<%=noticeno%>'">
		<input type="button" value="수정" 	class="btn btn-warning" onclick="location.href='noticeUpdate.jsp?noticeno=<%=noticeno%>&col=<%=col%>&word=<%=word%>'">
			<input type="button" value="삭제" 	class="btn btn-danger"	onclick="location.href='noticeDel.jsp?noticeno=<%=noticeno%>'">
<%      }//if end
	}//if end
%>

</div>

   

 <!--  본문끝 -->
 <%@ include file="../footer.jsp" %>