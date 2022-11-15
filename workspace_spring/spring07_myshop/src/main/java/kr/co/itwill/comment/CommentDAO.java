package kr.co.itwill.comment;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAO {
	
	public CommentDAO() {
		System.out.println("-----CommentDAO() 객체생성됨");
	}//end

	@Autowired
	SqlSession sqlSession;
	
	public int commentInsert(CommentDTO comment) {
		return sqlSession.insert("comment.insert", comment);
	}//insert() end
	
	
	public List<CommentDTO> commentlist(int pno){
		return sqlSession.selectList("comment.list", pno);
	}//list() end
	
	
	public int commentDelete(int cno) throws Exception{
		return sqlSession.delete("comment.delete", cno);
	}//delete() end
	
	public int commentUpdate(CommentDTO comment) {
		return sqlSession.update("comment.update", comment);
	}//update() end
	
}//class end
