<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="ssi.jsp" %>    
 <%@ include file="../header.jsp" %>
 <!-- 본문시작 template.jsp -->
 <!-- 수정 요청한 정보를 가져와서,DB에 가서 행 수정하기  -->
 <h3>* 수정 페이지 *</h3>
 <p>
 	<a href="pdsForm.jsp">[글쓰기]</a>
 	&nbsp;&nbsp;
 	<a href="pdsList.jsp">[글목록]</a>
 </p>
 <div class="container">
 <%
 	//수정 요청한 정보 가져오기
 	int pdsno=Integer.parseInt(request.getParameter("pdsno"));
    String wname    =request.getParameter("wname").trim();
	String subject  =request.getParameter("subject").trim();
	String passwd   =request.getParameter("passwd").trim();
	String filename =request.getParameter("filename").trim();
	Long   filesize =Long.parseLong(request.getParameter("filesize"));
	
	
 	//dto에 담기
 	dto.setPdsno(pdsno);
 	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setPasswd(passwd);
	dto.setFilename(filename);
	dto.setFilesize(filesize);
	
	int cnt=dao.updateproc(dto);
	if(cnt==0){
	    out.println("<p>비밀번호가 일치하지 않습니다</p>");
        out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{
        out.println("<script>");
        out.println("    alert('게시글이 수정 되었습니다');");
        out.println("    location.href='pdsList.jsp ");//목록페이지 이동
        out.println("</script>");
	}//if end
	
 %>
 </div>
  
 <!--  본문끝 -->
 <%@ include file="../footer.jsp" %>