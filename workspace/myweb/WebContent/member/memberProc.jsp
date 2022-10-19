<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 memberProc.jsp-->
<h3>* 회원가입 결과 *</h3>
<%
	//1) 사용자가 입력 요청한 정보 가져오기
	String id = request.getParameter("id").trim();
	String passwd = request.getParameter("passwd").trim();
	String mname = request.getParameter("mname").trim();
	String tel = request.getParameter("tel").trim();
	String email = request.getParameter("email").trim();
	String zipcode = request.getParameter("zipcode").trim();
	String address1 = request.getParameter("address1").trim();
	String address2 = request.getParameter("address2").trim();
	String job = request.getParameter("job").trim();

	//2) 1)의 내용을 dto 객체에 담기
	dto.setId(id);
	dto.setPasswd(passwd);
	dto.setMname(mname);
	dto.setTel(tel);
	dto.setEmail(email);
	dto.setZipcode(zipcode);
	dto.setAddress1(address1);
	dto.setAddress2(address2);
	dto.setJob(job);

	int cnt = dao.create(dto);
	if (cnt == 1) {
		out.println("<script>");
		out.println("	alert('회원 가입이 되었습니다! \\n 로그인 페이지로 이동합니다.') ");
		out.println("	location.href='loginForm.jsp' ");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("	alert('회원 가입 실패 T.T \\n 다시 한 번 시도해주십시오.' )");
		out.println("	window.history.back(); ");
		out.println("</script>");
	} //if end
%>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>
