package net.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginProc extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//method=post방식이면 service()함수가 doPost() 함수를 호출함
		try {
			
			req.setCharacterEncoding("UTF-8");
			String uid=req.getParameter("uid").trim();
			String upw=req.getParameter("upw").trim();
			
			if(uid.equals("itwill") && upw.equals("1234")) {
				//로그인 성공
				req.setAttribute("r_uid", uid);
				req.setAttribute("r_upw", upw);
			}else {
				//로그인 실패
				req.setAttribute("r_uid", "guest");
				req.setAttribute("r_upw", "guest");
			}//if end
			
			
			//뷰페이지 이동
			String view="control/loginResult.jsp";
			RequestDispatcher rd=req.getRequestDispatcher(view);
			rd.forward(req, resp);

			
		}catch (Exception e) {
			System.out.println("요청실패:" + e);
		}//end
	}//doPost() end
}//class end
