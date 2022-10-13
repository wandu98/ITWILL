package net.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

public class BbsDAO { //데이터베이스 관련 작업
    
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
            con=dbopen.getConnection();//DB연결
            
            sql=new StringBuilder();
            sql.append(" INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno) ");
            sql.append(" VALUES (bbs_seq.nextval, ?, ?, ?, ?, ?, (SELECT NVL(MAX(bbsno), 0)+1 FROM tb_bbs)) ");
            
            pstmt=con.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getWname());
            pstmt.setString(2, dto.getSubject());
            pstmt.setString(3, dto.getContent());
            pstmt.setString(4, dto.getPasswd());
            pstmt.setString(5, dto.getIp());
            
            cnt=pstmt.executeUpdate();
            
        }catch (Exception e) {
            System.out.println("추가실패:"+e);
        }finally {
            DBClose.close(con, pstmt);
        }//end
        return cnt;
    }//create() end
    
    public ArrayList<BbsDTO> list(){
    	ArrayList<BbsDTO> list=null;
    	try {
    		con=dbopen.getConnection();
    		
    		sql=new StringBuilder();
    		sql.append(" SELECT bbsno, wname, subject, readcnt, regdt, indent ");
    		sql.append(" FROM tb_bbs ");
    		sql.append(" ORDER BY grpno DESC, ansnum ASC ");
    		
    		pstmt=con.prepareStatement(sql.toString());
    		rs=pstmt.executeQuery();
    		if(rs.next()) {
    			list=new ArrayList<>();
    			do {
    				BbsDTO dto=new BbsDTO();//한줄담기
    				dto.setBbsno(rs.getInt("bbsno"));
    				dto.setWname(rs.getString("wname"));
    				dto.setSubject(rs.getString("subject"));
    				dto.setReadcnt(rs.getInt("readcnt"));
    				dto.setRegdt(rs.getString("regdt"));
    				dto.setIndent(rs.getInt("indent"));
    				list.add(dto);//list에 모으기
    			}while(rs.next());
    		}//if end
    		
    	}catch (Exception e) {
    		System.out.println("전체목록실패:" + e);
    	}finally {
    		DBClose.close(con, pstmt, rs);
    	}//end
    	return list;
    }//list() end
    
    public int count() {
    	int cnt=0;
    	try {
    		con=dbopen.getConnection();
    		
    		sql=new StringBuilder();
    		sql.append(" SELECT COUNT(*) as cnt ");
    		sql.append(" FROM tb_bbs ");
    		
    		pstmt=con.prepareStatement(sql.toString());
    		rs=pstmt.executeQuery();
    		if(rs.next()) {
    			cnt=rs.getInt("cnt");
    		}//if end
    		
    		
    	}catch (Exception e) {
    		System.out.println("글 개수:" + e);
    	}finally {
    		DBClose.close(con, pstmt, rs);
    	}//end
    	return cnt;
    }//count() end
    
    
    public BbsDTO read(int bbsno) {
    	BbsDTO dto=null;
    	try {
    		con=dbopen.getConnection();
    		
    		sql=new StringBuilder();
    		sql.append(" SELECT bbsno, wname, subject, content, readcnt, regdt, ip, grpno, indent, ansnum ");
    		sql.append(" FROM tb_bbs ");
    		sql.append(" WHERE bbsno=? ");
    		
    		pstmt=con.prepareStatement(sql.toString());
    		pstmt.setInt(1,  bbsno);
    		
    		rs=pstmt.executeQuery();
    		if(rs.next()) {
    			dto=new BbsDTO();
    			dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setRegdt(rs.getString("regdt"));
				dto.setIp(rs.getString("ip"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
    		}//end
		}catch (Exception e) {
    		System.out.println("상세보기 실패:" + e);
    	}finally {
    		DBClose.close(con, pstmt, rs);
    	}//end
    	return dto;
    }//read() end
    
    
    public void incrementCnt(int bbsno) {
    	try {
    		con=dbopen.getConnection();
    		
    		sql=new StringBuilder();
    		sql.append(" UPDATE tb_bbs ");
    		sql.append(" SET readcnt=readcnt+1 ");
    		sql.append(" WHERE bbsno=? ");
    		
    		pstmt=con.prepareStatement(sql.toString());
    		pstmt.setInt(1,  bbsno);
    		pstmt.executeUpdate();
    		
    	}catch (Exception e) {
    		System.out.println("조회수 증가 실패: "+e );
    	}finally {
    		DBClose.close(con,pstmt);
    	}//end
    }//incrementCnt() end
    
   
    public int delete(BbsDTO dto) {
    	int cnt=0;
    	try {
    		con=dbopen.getConnection();
    		
    		sql=new StringBuilder();
    		sql.append(" DELETE FROM tb_bbs ");
    		sql.append(" WHERE bbsno=? AND passwd=? ");
    		
    		pstmt=con.prepareStatement(sql.toString());
    		pstmt.setInt(1, dto.getBbsno());
    		pstmt.setString(2,  dto.getPasswd());
    		cnt=pstmt.executeUpdate();
    		
    	}catch (Exception e) {
    		System.out.println("삭제 실패: "+e );
    	}finally {
    		DBClose.close(con, pstmt);
    	}//end
    	return cnt;
    }//delete end

  public int updateproc(BbsDTO dto) {
	  int cnt=0;
	  try {
		  con=dbopen.getConnection();
		  
		  sql=new StringBuilder();
		  sql.append(" UPDATE tb_bbs ");
		  sql.append(" SET wname=? ");
		  sql.append(" , subject=? ");
		  sql.append(" , content=? ");
		  sql.append(" , ip=? ");
		  sql.append(" WHERE bbsno=? AND passwd=? ");
		  
		 pstmt=con.prepareStatement(sql.toString());
  		 pstmt.setString(1, dto.getWname());
  		 pstmt.setString(2, dto.getSubject());
  		 pstmt.setString(3, dto.getContent());
  		 pstmt.setString(4, dto.getIp());
  		 pstmt.setInt(5, dto.getBbsno());
  		 pstmt.setString(6, dto.getPasswd());
  		 
  		 cnt=pstmt.executeUpdate();
  		 
	  }catch (Exception e) {
  		System.out.println("수정 실패: "+e );
  	}finally {
  		DBClose.close(con, pstmt);
  	}//end
  	return cnt;
  }//updateproc() end
  
  
  public int reply(BbsDTO dto) {
	  int cnt=0;
	  try {
		  con=dbopen.getConnection();
		  sql=new StringBuilder();
		  
		  //1)부모글 정보 가져오기(select문)
		  int grpno=0;
		  int indent=0;
		  int ansnum=0;
		  sql.append(" SELECT grpno, indent, ansnum ");
		  sql.append(" FROM tb_bbs ");
		  sql.append(" WHERE bbsno=? ");
		  pstmt=con.prepareStatement(sql.toString());
		  pstmt.setInt(1,  dto.getBbsno());
		  rs=pstmt.executeQuery();
		  if(rs.next()) {
			  
		  }//if end
		  
		  //2)글순서 재조정하기(update문)
		  
		  //3)답변글 추가하기(insert문)
		  sql.delete(0, sql.length());																																																																																																																																								
	  }catch (Exception e) {
		  System.out.println("답변쓰기 실패:" + e);
	  }finally {
		  DBClose.close(con, pstmt, rs);
	  }//end
  	  return cnt;
  }//reply() end
  
  public int count2(String col, String word) {
	  int cnt=0;
	  try {
		  con=dbopen.getConnection();
		  
		  sql=new StringBuilder();
		  sql.append(" SELECT COUNT(*) as cnt ");
		  sql.append(" FROM tb_bbs ");
		  
		  if(word.length()>=1) { //검색어가 존재한다면
			  String search="";
			  if(col.equals("subject_content")) {
				  search += "WHERE subject LIKE '%" + word + "%'";
				  search += "OR    content LIKE '%" + word + "%'";
			  }else if(col.equals("subject")) {
				  search += "WHERE subject LIKE '%" + word + "%'";
			  }else if(col.equals("content")) {
				  search += "WHERE content LIKE '%" + word + "%'";
			  }else if(col.equals("wname")) {
				  search += "WHERE wname LIKE '%" + word + "%'";
			  }//if end
			  sql.append(search);
		  }//if end
		  
		  pstmt=con.prepareStatement(sql.toString());
		  rs=pstmt.executeQuery();
		  if(rs.next()) {
			  cnt=rs.getInt("cnt");
		  }//if end
		  
	  }catch (Exception e) {
		  System.out.println("검색 글 갯수 실패:" +e);
	  }finally {
		  DBClose.close(con, pstmt, rs);
	  }//end
	  return cnt;
  }//count2() end
  
  
  
  
}//BbsDAO() end
