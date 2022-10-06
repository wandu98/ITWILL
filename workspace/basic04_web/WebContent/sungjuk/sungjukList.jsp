<%@page import="java.sql.ResultSet"%>
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
	<title>sungjukIns.jsp</title>
</head>
<body>
	<h3>* 성적 목록 *</h3>
	<p><a href="sungjukForm.jsp">[성적쓰기]</a></p>
	<table class="table">
	<tr>
		<th class="info">이름</th>
		<th class="info">국어</th>
		<th class="info">영어</th>
		<th class="info">수학</th>
		<th class="info">등록일</th>
	</tr>
<%
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
	   	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	   	String userid="system";
	   	String pwd ="pass";
	    Class.forName("oracle.jdbc.OracleDriver");
	    con =DriverManager.getConnection(url, userid, pwd);
	  	//out.println("오라클DB 서버 연결 성공!!");
	  	
	    StringBuilder sql=new StringBuilder();
	    sql.append(" SELECT sno, uname, kor, eng, mat, wdate ");
	    sql.append(" FROM sungjuk ");
	    sql.append(" ORDER BY sno DESC ");
	    
	    pstmt=con.prepareStatement(sql.toString());
	    rs=pstmt.executeQuery();
	    if(rs.next()){
	    	do{
%>
				<tr>
					<td><a href="sungjukRead.jsp?sno=<%=rs.getInt("sno")%>"><%=rs.getString("uname")%></a></td>
					<td><%=rs.getInt("kor")%></td>
					<td><%=rs.getInt("eng")%></td>
					<td><%=rs.getInt("mat")%></td>
					<td><%=rs.getString("wdate").substring(0, 10)%></td>
				</tr>
<% 	    		
	    	}while(rs.next());
	    }else{
	    	out.println("<tr>");
	    	out.println("   <td colspan='5'>글없음!!</td>");
	    	out.println("</tr>");
	    }//if end
	    
	}catch (Exception e) {
		out.println("오라클DB 연결 실패 :" + e);
	}finally {//자원반납 (순서주의)
		try {
			if(rs!=null) {rs.close();}
		}catch (Exception e) {}
		try {
			if(pstmt!=null) {pstmt.close();}
		}catch (Exception e) {}
	   try {
		   if(con!=null) {con.close();}
	   }catch (Exception e) {}
   }//end
%>	
	</table>
</body>
</html>