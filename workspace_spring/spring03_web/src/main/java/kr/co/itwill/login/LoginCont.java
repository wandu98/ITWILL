package kr.co.itwill.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginCont {

	public LoginCont( ) {
		System.out.println("------LoginCont() 객체 생성됨 ");
	}//end
	
	//결과확인 http://localhost:9095/login.do
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginForm() {
		return "login/loginForm"; // /WEB-INF/views/login/loginForm.jsp
	}//loginForm() end
	
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView loginProc(@ModelAttribute LoginDTO dto, HttpServletRequest req, HttpServletRequest resp, HttpSession session) {
		
		String id=dto.getId();
		String pw=dto.getPw();
		
		ModelAndView mav=new ModelAndView();
		if(id.equals("itwill") && pw.equals("1234")) {
			mav.setViewName("login/loginResult");
			session.setAttribute("s_id", id);
			session.setAttribute("s_pw", pw);
			req.setAttribute("message", "<h3>로그인 성공</h3>");
		}else {
			mav.setViewName("login/msgView");
			req.setAttribute("message", "<p>아이디와 비번이 일치하지 않습니다<p>");
			req.setAttribute("link", "<a href='javascript:history.back()'>[다시시도]</a>");
		}//if end
		
	
		
		return mav;
	}//loginProc() end
}//class end
