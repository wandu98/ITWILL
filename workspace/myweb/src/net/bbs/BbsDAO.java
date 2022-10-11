package net.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.utility.DBClose;
import net.utility.DBOpen;

public class BbsDAO { //전송객체
	
	private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	public BbsDAO() {
		dbopen=new DBOpen();
	}//end
	
	
	public int create(BbsDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection(); //DB연결
			
			sql=new StringBuilder();
			sql.append(" INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno) ");
			sql.append(" VALUES (bbs_seq.nextval, ?, ?, ?, ?, ?, (SELECT NVL(MAX(bbsno), 0)+1 FROM tb_bbs ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1,  dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getIp());
			
			cnt=pstmt.executeUpdate();
			
			
		}catch (Exception e) {
			System.out.println("추가실패:" + e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
		return cnt;
	}//create() end
	
}//class end