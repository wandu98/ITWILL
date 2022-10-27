package net.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
	● HttpServlet 클래스의 계층도
	  class GenericServlet {}
	  class HttpServlet extends GenericServlet {}
	  class LifeCycle extends HttpServlet {}

	● HttpServlet 생명주기----------------------------
		init() 서블릿이 호출되면 1번만 호출
			-> service()
			-> service()
			-> service()  사용자가 요청할 때 마다 계속 호출 (doGet(), doPost() 구분하는 역할)
			-> service()
			-> service()
		destroy() 서버가 중지되면 1번만 호출
	
	------------------------------------------------
	
	● LifceCycle 서블릿을 /WEB-INF/web.xml에 등록해야 함
	● 결과확인 http://localhost:8080/basic05_mvc/life.do
	
*/

public class LifeCycle extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//method=get방식으로 요청하면 service()함수가 호출함
		super.doGet(req, resp);
		System.out.println("doGet()호출...");
	}//doGet() end

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//method=post방식으로 요청하면 service()함수가 호출함
		super.doPost(req, resp);
		System.out.println("doPost()호출...");
	}//doPost() end

	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		//URL를 통해서 요청이 들어오면, 전송방식 method=get 또는 method=post 방식으로 서비스를 요청했는지를 판단해서
		//doGet()과 doPost() 함수를 구분해서 호출해 주는 함수
		super.service(arg0, arg1);
		System.out.println("service()호출...");
	}//service() end

	@Override
	public void destroy() {
		//서버가 중지되면 1번만 호출
		super.destroy();
		System.out.println("destroy()호출...");
	}//destroy() end

	@Override
	public void init() throws ServletException {
		//서블릿이 최초로 호출될 때 1번만 호출
		//초기 환경 설정할 때 사용
		super.init();
		System.out.println("init()호출...");
	}//init() end


	


}//class end
