<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="ssi.jsp" %>    
 <%@ include file="../header.jsp" %>
 <!-- 본문시작 noticeUpdateProc.jsp -->
 <!-- 수정 요청한 정보를 가져와서,DB에 가서 행 수정하기  -->
 <h3>* 수정 페이지 *</h3>
 <p>
 	<a href="noticeForm.jsp">[글쓰기]</a>
 	&nbsp;&nbsp;
 	<a href="noticeList.jsp">[글목록]</a>
 </p>
 <div class="container">
 <%
 	//수정 요청한 정보 가져오기
 	int noticeno=Integer.parseInt(request.getParameter("noticeno"));
	String subject=request.getParameter("subject").trim();
	String content=request.getParameter("content").trim();
	
 	//dto에 담기
 	dto.setNoticeno(noticeno);
	dto.setSubject(subject);
	dto.setContent(content);
	  
	int cnt=dao.updateproc(dto);
	if(cnt==0){
	    out.println("<p>비밀번호가 일치하지 않습니다</p>");
        out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{
        out.println("<script>");
        out.println("    alert('게시글이 수정 되었습니다');");
        //http://localhost:8080/myweb/bbs/bbsList.jsp?col=subject_content&word=명원아
        out.println("    location.href='noticeList.jsp ");//목록페이지 이동
        out.println("</script>");
	}//if end
	
 %>
 </div>
  
 <!--  본문끝 -->
 <%@ include file="../footer.jsp" %>