<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="ssi.jsp" %>    
 <%@ include file="../header.jsp" %>
 <!-- 본문시작 loginProc.jsp -->
 <h3>* 로 그 인 결과 *</h3>
 <%
 	String id		=request.getParameter("id").trim();
 	String passwd	=request.getParameter("passwd").trim();
 	dto.setId(id);
 	dto.setPasswd(passwd);
 	
 	String mlevel=dao.loginProc(dto);
 	if(mlevel==null){
 		out.println("<p>아이디/비밀번호 다시 한 번 확인해주세요!!</p>");
 		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
 	}else{
 		//로그인성공
 		out.print("로그인성공~~");
 		out.print("회원등급:" + mlevel);
 	}//if end
 %>
 <!--  본문끝 -->
 <%@ include file="../footer.jsp" %>