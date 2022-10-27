package net.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginForm extends HttpServlet{

	//결과확인 http://localhost:9090/basic05_mvc/login.do
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//전송방식 method=get 요청
		
		//페이지 이동
		
		//1)resp.sendRedirect("control/loginForm.jsp");
		//resp.sendRedirect("control/loginForm.jsp");
		
		//2)http://localhost:8080/basic05_mvc/login.do
		String view="control/loginForm.jsp";
		RequestDispatcher rd=req.getRequestDispatcher(view);
		rd.forward(req, resp);
		
		
	}//doGet() end
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//전송방식 method=post 요청
		super.doPost(req, resp);
	}//doPost() end
	
}//class end
