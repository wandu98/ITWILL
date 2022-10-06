<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

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
	<title>sungjukRead.jsp</title>
</head>
<body>
	
	<h3>* 성적 상세보기 *</h3>
	<p>
		<a href="sungjukForm.jsp">[성적쓰기]</a>
		<a href="sungjukList.jsp">[성적목록]</a>
	</p>

<%
	//예) sungjukRead.jsp?sno=3
	int sno=Integer.parseInt(request.getParameter("sno"));
	
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
	    sql.append(" SELECT sno, uname, kor, eng, mat, aver, addr, wdate ");
	    sql.append(" FROM sungjuk ");
	    sql.append(" WHERE sno=? ");
	    
	    pstmt=con.prepareStatement(sql.toString());
	    pstmt.setInt(1, sno);
	    
	    rs=pstmt.executeQuery();
	    if(rs.next()){
%>
			<table class="table">
			<tr>
				<th class="info">이름</th>
				<td><%=rs.getString("uname")%></td>
			</tr>
			<tr>
				<th class="info">국어</th>
				<td><%=rs.getInt("kor")%></td>
			</tr>
			<tr>
				<th class="info">영어</th>
				<td><%=rs.getInt("eng")%></td>
			</tr>
			<tr>
				<th class="info">수학</th>
				<td><%=rs.getInt("mat")%></td>
			</tr>
			<tr>
				<th class="info">평균</th>
				<td><%=rs.getInt("aver")%></td>
			</tr>
			<tr>
				<th class="info">주소</th>
				<td>
					<%=rs.getString("addr")%>
<% 			
					//주소를 한글로 출력
					String addr=rs.getString("addr");
					if(addr.equals("Seoul")){
						out.print("서울");
					}else if(addr.equals("Jeju")){
						out.print("제주");
					}else if(addr.equals("Suwon")){
						out.print("수원");
					}else if(addr.equals("Busan")){
						out.print("부산");
					}//if end
%>
				</td>
			</tr>
			<tr>
				<th class="info">작성일</th>
				<td><%=rs.getString("wdate") %></td>
			</tr>
			</table>
			<br><br>
			<a href="sungjukUpdate.jsp?sno=<%=sno%>">[수정]</a>
			&nbsp;&nbsp;
			<a href="sungjukDel.jsp?sno=<%=sno%>">[삭제]</a>

<%	    	
	    }else{
	    	out.println("해당 글 없음!!");
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
</body>
</html>