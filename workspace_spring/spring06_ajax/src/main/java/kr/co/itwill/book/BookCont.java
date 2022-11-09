package kr.co.itwill.book;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BookCont {
	
	public BookCont() {
		System.out.println("---------BookCont()객체 생성됨");
	}//end
	
	//결과확인 http://localhost:9095/book/book/do
	
	@RequestMapping("book/book.do")
	public String bookTest() {
		return "book/bookTest";
	}//bookTest() end
	
	
	@RequestMapping("book/booksend.do")
	@ResponseBody
	public String bookSend(HttpServletRequest req) {
		//요청한 정보 가져오기
		int bookIndex=Integer.parseInt(req.getParameter("book"));
		
		String img[]= {"spring.jpg","android.jpg","jquery.jpg","jsmasterbook.jpg"};
		
		return img[bookIndex];	//응답메세지
	}//bookSend() end
	
}//class end
