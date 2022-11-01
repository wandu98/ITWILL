<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>loginResult.jsp</title>
</head>
<body>
	<h3>로그인 결과</h3>
	
		1)JSP<br>
		<%=request.getAttribute("message")%><br>
		아이디(세션) : <%=session.getAttribute("s_id")%><br>
		비번(세션) : <%=session.getAttribute("s_pw")%><br>
		<hr>
		
		2)EL<br>
		${requestScope.message}<br>
		아이디(세션) : ${sessionScope.s_id}<br>
		비번(세션)  : ${sessionScope.s_pw}<br>
		
		${message}<br>
		아이디(세션) : ${s_id}<br>
		비번(세션) : ${s_pw}<br>
		
</body>
</html>