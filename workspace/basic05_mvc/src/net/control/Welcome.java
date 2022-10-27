package net.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 	참조 https://docs.oracle.com/javaee/7/api/
 	
 	● httpServlet 클래스
 	- http 프로토콜 기반의 요청과 응답을 처리해 주는 클래스
 	
 	● 결과확인
 	- http://localhost:8080/basic_mvc/wel.do
 	
 	● Welcome 서블릿 클래스
 	- web.xml (배치관리자)에 등록해야 한다
 */

public class Welcome extends HttpServlet {
	//나의 클래스의 부모가 class 		: extends	 상속(확장)
	//나의 클래스의 부모가 Interface : implements 상속(구현) 추상클래스 미완성..
	
	
	@Override //< 재정의(리폼)	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//전송방식 method=get방식으로 요청하면 doGet() 함수가 자동으로 호출
		//req  : 모델1방식의 내부객체 request동일한 변수 변수명이 맘에 안 들면 고쳐써도 되는데 비추
		//resp : 모델1방식의 내부객체 response와 동일
		
		try {
			
			//HTML 문서 구조로 응답
			resp.setContentType("text/html; charset=UTF-8");
			
			//단순문자열 응답(AJAX)
			//resp.setContentType("text/plain); charset=UTF-8");
			
			//요청한 사용자에게 응답하기 위한 출력 객체
			PrintWriter out=resp.getWriter();
			out.print(" <!DOCTYPE html> ");
			out.print(" <html> ");
			out.print(" <head> ");
			out.print(" 	<meta charset='UTF-8'>  ");
			out.print(" 	<title>환영합니다</title> ");
			out.print(" </head> ");
			out.print(" <body> ");
			out.print(" 	<strong>대한민국</strong> ");
			out.print(" 	<hr> ");
			out.print(" 	<span style='color:red'>오필승코리아</span> ");
			out.print(" 	<hr> ");
			out.print(" 	<table border='1'> ");
			out.print(" 	<tr> ");
			out.print(" 		<th>이름</th> ");
			out.print(" 		<td>무궁화</td> ");
			out.print(" 	</tr> ");
			out.print(" 	</table> ");			
			out.print(" </body> ");
			out.print(" </html> ");
			
			
		}catch (Exception e) {
			System.out.println("요청실패:" + e);
		}//end
		
	}//doGet() end

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//전송방식 method=post방식으로 요청하면 doPost() 함수가 자동으로 호출
	}//doPost() end
	
		
}//class end
	
