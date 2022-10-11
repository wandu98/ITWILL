<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>sungjukUpdateProc.jsp</title>
</head>
<body>
    <h3>*성적 수정 페이지*</h3>
    <p>
    	<a href="sungjukForm.jsp">[성적쓰기]</a>
    	<a href="sungjukList.jsp">[성적목록]</a>
<%
	request.setCharacterEncoding("UTF-8");	
	//사용자가 입력한 정보 가져와서 변수에 담기
	int sno 	=Integer.parseInt(request.getParameter("sno").trim());	//글번호
	String uname=request.getParameter("uname").trim();
	int kor     =Integer.parseInt(request.getParameter("kor").trim());
	int eng     =Integer.parseInt(request.getParameter("eng").trim());
	int mat     =Integer.parseInt(request.getParameter("mat").trim());
	String addr =request.getParameter("addr");	
	int aver=(kor+eng+mat)/3;
	
	//1)dto객체를 사용하기 전
	//int cnt=dao.insert(uname, kor, eng, mat, aver, addr);
	
	//2)dto객체를 사용한 경우
    //  전달값을 모두 dto 객체에 담기
    dto.setUname(uname);
	dto.setKor(kor);
	dto.setEng(eng);
	dto.setMat(mat);
	dto.setAver(aver);
	dto.setAddr(addr);
    
    int cnt=dao.create(dto);    
    
    if(cnt==0){
        out.println("<p>성적 입력이 실패했습니다</p>");
        out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
    }else{
        out.println("<script>");
        out.println("    alert('성적이 입력되었습니다');");
        out.println("    location.href='sungjukList.jsp';");//목록페이지 이동
        out.println("</script>");
    }//if end	        
%>
</body>
</html>