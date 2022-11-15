package kr.co.itwill.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/comment")
public class CommentCont {

	public CommentCont() {
		System.out.println("------CommentCont() 객체생성됨");
	}//end
	
	@Autowired
	CommentDAO commentDao;
	
	@RequestMapping("/insert")
	@ResponseBody
	private int mCommentServiceInsert(@RequestParam int pno, @RequestParam String content) throws Exception {
		CommentDTO comment=new CommentDTO();
		comment.setPno(pno);
		comment.setContent(content);
		//로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 된다 -> session.setAttribute()
		//따로 폼을 구현하지 않았기 때문에 임시로 "test"
		comment.setWname("test"); //
		return commentDao.commentInsert(comment);
		
	}//mCommentServiceInsert() end
	
	@RequestMapping("/list")
	@ResponseBody
	private List<CommentDTO> mCommentServiceList(@RequestParam int pno, Model model) throws Exception {
		return commentDao.commentlist(pno);
	}//list() end
	
	@RequestMapping("/delete/{cno}")
	@ResponseBody
	private int mCommentServiceDelete(@PathVariable int cno) throws Exception {
		return commentDao.commentDelete(cno);
	}//mCommentServiceDelete() end
	
	
	@RequestMapping("/update")
	@ResponseBody
	private int mCommentServiceUpdateProc(@RequestParam int cno, @RequestParam String content) throws Exception {
		CommentDTO comment=new CommentDTO();
		comment.setCno(cno);
		comment.setContent(content);
		return commentDao.commentUpdate(comment);
	}//update() end
	
}//class end
