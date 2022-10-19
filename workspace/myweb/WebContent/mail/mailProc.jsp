<%@page import="java.util.Date"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="net.utility.Utility"%>
<%@page import="net.utility.MyAuthenticator"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../header.jsp" %>
 <!-- 본문시작 mailProc.jsp -->
 <h3>* 메일 보내기 결과 *</h3>
 <%
 	try{
 		//1)사용하고자 하는 메일서버에서 인증받은 계정과 비번 등록하기
		//->MyAuthenticator클래스 생성

		//2)메일서버(POP3/SMTP) 지정하기
		String mailServer="mw-002.cafe24.com"; //cafe24 메일서버
		Properties props=new Properties();
		props.put("mail.smtp.host", mailServer);
		props.put("mail.smtp.auth", true);
		 
		
		//3)메일서버에서 인증받은 계정+비번 
		Authenticator myAuth=new MyAuthenticator();		
	
		//4) 2)와 3)이 유효한지 검증
	 	Session sess=Session.getInstance(props, myAuth);
		//out.print("메일 서버 인증 성공!!");
		
		//5)메일 보내기
		request.setCharacterEncoding("UTF-8");
		String to		=request.getParameter("to").trim();
		String from		=request.getParameter("from").trim();
		String subject	=request.getParameter("subject").trim();
		String content	=request.getParameter("content").trim();
		
		//엔터 및 특수문자 변경
		content=Utility.convertChar(content);
		
		content+="<hr>";
		content+="<table border='1'>";
		content+="<tr>";
		content+="	  <th>상품명</th>";
		content+="	  <th>상품가격</th>";
		content+="</tr>";
		content+="<tr>";
		content+="	  <td>운동화</td>";
		content+="	  <td><span style='color:red; font-weight: bold; '>15,000</span></td>";
		content+="</tr>";
		content+="</table>";
		
		//이미지 출력하기
		content+="<hr>";
		content+="<img src='http://localhost:8080/myweb/images/agumon.png'>";
		
		//받는 사람 이메일 주소
		InternetAddress[] address={ new InternetAddress(to) };
		/*
			수신인이 여러명인 경우
			InternetAddress[] address={ new InternetAddress(to1),
										new InternetAddress(to2),
										new InternetAddress(to3), ~~~};
			}
		*/
		
		//메일 관련 정보 작성
		Message msg=new MimeMessage(sess);
		
		//받는사람
		msg.setRecipients(Message.RecipientType.TO, address);
		//참조    Message.RecipientType.CC
		//숨은참조 Message.RecipientType.BCC
		
		//보내는 사람
		msg.setFrom(new InternetAddress(from));
		
		//메일 제목
		msg.setSubject(subject);
		
		//메일 내용
		msg.setContent(content, "text/html; charset=UTF-8");
		
	 	//메일 보낸날짜
		 msg.setSentDate(new Date());
	 	   
	 	//메일 전송 
	 	Transport.send(msg);
	 	
	 	out.print(to+"님에세 메일이 발송되었습니다!!");
	 	
 	}catch(Exception e){
 		out.println("<p>메일 전송 실패!!" + e + "</p>");
 		out.println("<p><a href='javascript:history.back();'>[다시시도]</a></p>");
 	}//end
 %>
 <!--  본문끝 -->
 <%@ include file="../footer.jsp" %>