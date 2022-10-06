<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<title>sungjukRead.jsp</title>
</head>
<body>
	
	<h3>* 성적 수정 *</h3>
	<p>
		<a href="sungjukForm.jsp">[성적쓰기]</a>
		<a href="sungjukList.jsp">[성적목록]</a>
	</p>

<%
	//수정하고자 하는 행 번호 sungjukRead.jsp?sno=3
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
	  	
	  	
	  	//1단계. select문을 이용해서 수정할 행을 가져온다(sungjukRead.jsp참조)
	    StringBuilder sql=new StringBuilder();
	    sql.append(" SELECT sno, uname, kor, eng, mat, aver, addr, wdate ");
	    sql.append(" FROM sungjuk ");
	    sql.append(" WHERE sno=? ");
	    
	    pstmt=con.prepareStatement(sql.toString());
	    pstmt.setInt(1, sno);
	    
	    rs=pstmt.executeQuery();
	    if(rs.next()){
	    	//2단계. 1의 내용을 폼에 출력 sungjukForm.jsp참
	    		    	
%>
			<form name="sungjukfrm" id="sungjukfrm" action="sungjukUpdateProc.jsp">
				<input type="hidden" name="sno" value="<%=sno %>">
				<table class="table">
				<tr class="success">
				  <th class="info">이름</th>
				  <td><input type="text" name="uname" value="<%=rs.getString("uname")%>" maxlength="20" required autofocus></td>
				</tr> 
				<tr>
				  <th class="info">국어</th>
				  <td><input type="number" name="kor" value="<%=rs.getString("kor")%>" size="5" min="0" max="100" placeholder="숫자입력"></td>
				</tr>
				<tr>
				  <th class="info">영어</th>
				  <td><input type="number" name="eng" value="<%=rs.getString("eng")%>" size="5" min="0" max="100" placeholder="숫자입력"></td>
				</tr> 
				<tr>
				  <th class="info">수학</th>
				  <td><input type="number" name="mat" value="<%=rs.getString("mat")%>" size="5" min="0" max="100" placeholder="숫자입력"></td>
				</tr>
				<tr>
				  <th class="info">주소</th>
				  <td>
				  	<% String addr=rs.getString("addr"); %>
				      <select name="addr" class="form-control">
			              <option value="Seoul" <%if (addr.equals("Seoul")) {out.print("selected");}%>>서울</option>
			              <option value="Jeju"  <%if (addr.equals("Jeju"))  {out.print("selected");}%>>제주</option>
			              <option value="Suwon" <%if (addr.equals("Suwon")) {out.print("selected");}%>>수원</option>
			              <option value="Busan" <%if (addr.equals("Busan")) {out.print("selected");}%>>부산</option>
				      </select> 
				  </td>
				</tr>
				<tr>
				  <td colspan="2" align="center">
				     <input type="submit" value="수정" class="btn btn-success">
				     <input type="reset"  value="취소" class="btn btn-danger">
				  </td>
				</tr>
				</table>
				</form>
					
					
					
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