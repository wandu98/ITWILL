<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<meta charset="UTF-8">
	<title>sungjukDel.jsp</title>
</head>
<body>
	<h3>*성적 삭제*</h3>
	<p>
		<a href="sungjukForm.jsp">[성적쓰기]</a>
		<a href="sungjukList.jsp">[성적목록]</a>
	
<%
	int sno=Integer.parseInt(request.getParameter("sno"));
	
	Connection con=null;
	PreparedStatement pstmt=null;
	
	try{
   	String url ="jdbc:oracle:thin:@localhost:1521:xe";
   	String userid="system";
   	String pwd ="pass";
    Class.forName("oracle.jdbc.OracleDriver");
    con =DriverManager.getConnection(url, userid, pwd);
    //out.println("오라클DB 서버 연결 성공!!");
    
    StringBuilder sql=new StringBuilder();
    sql.append(" DELETE FROM sungjuk ");
    sql.append(" WHERE sno=? ");
    
    pstmt=con.prepareStatement(sql.toString());
    pstmt.setInt(1, sno);
    
    int cnt=pstmt.executeUpdate();
    if(cnt==0){
    	out.println("<p>성적 삭제 실패했습니다!!</p>");
    	out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
   	}else{
   		out.println("<script>");
   		out.println("	 alert('성적이 삭제되었습니다~');");
   		out.println("	 location.href='sungjukList.jsp';");	//목록페이지 이동
   		out.println("</script>");
	}//if end
    
  }catch (Exception e) {
		out.println("오라클DB 연결 실패 :" + e);
	}finally {//자원반납 (순서주의)
		try {
			if(pstmt!=null) {pstmt.close();}
		}catch (Exception e) {}
	   try {
		   if(con!=null) {con.close();}
	   }catch (Exception e) {}
 }//end
%>



</body>
</html>