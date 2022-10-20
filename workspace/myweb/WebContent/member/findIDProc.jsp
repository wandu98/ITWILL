<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
 <!-- 본문시작 findIDProc.jsp -->
 <h3>* 아이디/비번 찾기 결과*</h3>
 <%
	 String mname=request.getParameter("mname").trim();
	 String email=request.getParameter("email").trim();
	 
	 dto.setMname(mname);
	 dto.setEmail(email);
	 
	 boolean flag =dao.findID(dto);
	 if(flag==false){
		 out.println("<p>이름/이메일을 다시 한 번 확인해주세요!!</p>");
		 out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	 }else{
		 String message="";
		 message += "아이디/임시 비밀번호가 이메일로 전송되었습니다\\n";
		 message += "임시 비밀번호는 로그인 후 회원정보 수정에서 수정하시기 바랍니다";
		 out.println("<script>");
		 out.println("	alert('" + message + "');");
		 out.println("	location.href='loginForm.jsp'");
		 out.println("</script>");
	 }//if end
 
 
 %>
 <!--  본문끝 -->
 <%@ include file="../footer.jsp" %>