<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="ssi.jsp" %>
 <%@ include file="../member/auth.jsp" %>
 <%@ include file="../header.jsp" %>
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
<!-- 본문시작 noticeList.jsp -->
<h3>* 공지사항 *</h3>
<% if(s_mlevel.equals("A1")){ %><p><a href="noticeForm.jsp">[글쓰기]</a></p> <% }//if end %>

<table class="table table-hover">
<thead>
	<tr class="success">
		<th>제목</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>
</thead>
<tbody>
<%
	//한페이지당 출력할 행의 갯수
	int recordPerPage=5;

	ArrayList<NoticeDTO> list=dao.list(col, word, nowPage, recordPerPage);
	if(list==null){
	    out.println("<tr>");
	    out.println("  <td colspan='4'>");
	    out.println("    <strong>관련자료 없음!!</strong>");
	    out.println("  </td>");
	    out.println("</tr>");
	}else{
	    
	    //오늘 날짜를 문자열 "2022-10-22" 만들기
	    String today=Utility.getDate();	    
	    
		for(int i=0; i<list.size(); i++){
		    dto=list.get(i);
%>
			<tr>
				<td style="text-align: left">
<% 
					//답변이미지 출력
					for(int n=1; n<=dto.getIndent(); n++){
					    out.println("<img src='../images/reply.gif'>");
					}//for end
%>				
					<a href="noticeRead.jsp?noticeno=<%=dto.getNoticeno()%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>"><%=dto.getSubject()%></a>					
<%
					//오늘 작성한 글제목 뒤에 new 이미지 출력
					//작성일(regdt)에서 "년월일"만자르기
					String regdt=dto.getRegdt().substring(0, 10);
					if(regdt.equals(today)){//작성일과 오늘날짜가 같다면
					    out.println("<img src='../images/new.gif'>");
					}//if end

					//조회수가 10이상이면 hot이미지 출력
					if(dto.getReadcnt()>=10){
					    out.println("<img src='../images/hot.gif'>");
					}//if end 
%>					
				</td>
				<td style="text-align: left"><%=dto.getReadcnt()%></td>
				<td style="text-align: left"><%=dto.getRegdt().substring(0, 10)%></td>
			</tr>
<%		    
		}//for end
		 
		//글갯수
		int totalRecord=dao.count(col, word); 
	    out.println("<tr>");
	    out.println("	<td colspan='4' style='text-align:center;'>");
	    out.println("		글갯수:<strong> " + totalRecord +" </strong>");
	    out.println("	</td>");
	    out.println("</tr>");	
	    
	    //페이지 리스트	    
	    out.println("<tr>");
	    out.println("	<td colspan='4' style='text-align:center; height: 50px'>");
	    
		String paging=new Paging().paging3(totalRecord, nowPage, recordPerPage, col, word, "noticeList.jsp");
		out.print(paging);
	    
		out.println("	</td>");
	    out.println("</tr>");
%>

		<!-- 검색시작 -->
		<tr>
			<td colspan="4" style='text-align:center; height: 50px;'>
				<form action="noticeList.jsp" onsubmit="return searchCheck()"><!-- myscript.js 함수 작성함 -->
					<select name="col">
						<option value="subject_content">제목+내용					
						<option value="subject">제목
						<option value="content">내용
					</select>
					<input type="text" name="word" id="word">
					<input type="submit" value="검색" class="btn btn-primary">					
				</form>			
			</td>
		</tr>
		<!-- 검색끝 -->
<%	    
	}//if end
%>	
</tbody>
</table>

<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>







