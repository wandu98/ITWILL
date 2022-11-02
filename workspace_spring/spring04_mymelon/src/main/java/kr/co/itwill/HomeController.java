package kr.co.itwill;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	public HomeController() {
		System.out.println("-----HomeCOntroller()객체 생성 됨");
	}
	
	//mymelon 프로젝트의 첫 페이지 호출 명령어 등록
	//결과확인 http://localhost:9095/home.do
	
	@RequestMapping("/home.do")
	public ModelAndView home() {
		ModelAndView mav=new ModelAndView();
		//redirect : 등록한 명령어를 호출할 수 있다
		mav.setViewName("redirect:/mediagroup/list.do");
		return mav;
	}//home() end
	
}//class end
