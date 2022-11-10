package kr.co.itwill;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	public HomeController() {
		System.out.println("-----HomeController() 객체 생성됨");
	}
	
	/*
		spring07_myshop 프로젝트의 첫 페이지 호출
		http://localhost:9095
	*/
	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		//redirect : 등록한 명령어를 호출할 수 있다
		mav.setViewName("redirect:/product/list");
		return mav;
	}//home() end
	
}//class end