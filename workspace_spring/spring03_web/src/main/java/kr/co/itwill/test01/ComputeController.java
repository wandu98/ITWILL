package kr.co.itwill.test01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ComputeController {
	
	public ComputeController( ) {
		System.out.println("--------ComputeController() 객체 생성됨");
	}//end

	//요청명령어를 처리하는 메소드 매개변수의 유연성
	//@RequestParam("요청변수명") 자료형 변수명
	//->사용자가 요청한 값을 직접 변수에 저장 가능하
	
	//결과확인 http://localhost:9095/diff.do?no1=3&no2=5
	@RequestMapping("/diff.do") //GET || POST 허용
	public ModelAndView diff(@RequestParam("no1") int a, @RequestParam("no2") int b) {
		int result=Math.abs(a-b); //두수사이의 차이
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("calcResult");	// /WEB-INF/views/calcResult.jsp 뷰페이지
		
		//request영역에 값 올리기
		//req.setAttribute()와 동일한 함수
		mav.addObject("no1", a);
		mav.addObject("no2", b);
		mav.addObject("result", result);
		mav.addObject("message", "<h3>두수 사이의 차이</h3>");
		mav.addObject("img", "<img src='images/mouse.png'>");
		
		return mav;
	}//diff() end
	
	//결과확인 http://localhost:9095/max.do?no1=3&no2=5
	//사용자가 요청한 값을 매개변수로 직접 저장 가능하다
	//->단, 요청변수명과 매개변수명이 동일해야 한다
	@RequestMapping("/max.do")
	public ModelAndView max(int no1, int no2) {
		int result=Math.max(no1, no2); //큰 값 구하기
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("calcResult");
		
		mav.addObject("no1", no1);
		mav.addObject("no2", no2);
		mav.addObject("result", result);
		mav.addObject("message", "<h3>두수중 큰값</h3>");
		mav.addObject("img", "<img src='images/rupi2.jpeg'>");
		
		return mav;
	}//max() end
	
}//class end
