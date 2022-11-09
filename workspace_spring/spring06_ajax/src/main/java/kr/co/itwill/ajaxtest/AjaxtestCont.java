package kr.co.itwill.ajaxtest;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AjaxtestCont {

	public AjaxtestCont() {
		System.out.println("----------AjaxtestCont() 객체 생성됨");
	}//end

	//결과확인 http://localhost:9095/ajaxtest01.do
	@RequestMapping("ajaxtest01.do")
	public String ajaxTest01() {
		return "ajax/ajaxTest01";
	}//ajaxTest01() end
	
	//결과확인 http://localhost:9095/ajaxtest02.do
	@RequestMapping("ajaxtest02.do")
	public String ajaxTest02() {
		return "ajax/ajaxTest02";
	}//ajaxTest02() end
	
	
	//1)
	/*
	@RequestMapping(value = "message.do", method = RequestMethod.GET)
	public void message(HttpServletRequest res, HttpServletResponse resp) {
		try {
			//단순 문자열과 UTF-8 인코딩 방식
			resp.setContentType("text/html; charset=UTF-8");
			
			//요청한 사용자에게 응답하기 위한 출력 객체
			PrintWriter out = resp.getWriter();
			out.println("서버에서 응답해준 메세지 : ");
			out.println("무궁화 꽃이 피었습니다~");
			out.flush();	//out객체에 남아 있는 버퍼의 내용을 클리어
			out.close();
			
		}catch (Exception e) {
			System.out.println("응답실패:" + e);
		}//end
	}//message() end
	*/
	
	
	//2)@ResponseBody를 활용한 메세지 전송
	//->jsp view를 이용하여 출력하지 않고 response 객체에 직접 출력한다
	//->return값 그대로 브라우저에 전송
	@ResponseBody
	@RequestMapping(value = "message.do", method = RequestMethod.GET)
	public String message() {
		return "서버에서 응답해준 메세지 : 무궁화 꽃이 피었습니다~";
	}//message() end
	
	
}// class end
