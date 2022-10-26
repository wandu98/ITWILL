package net.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.bbs.BbsDTO;
import net.notice.NoticeDTO;
import net.utility.DBClose;
import net.utility.DBOpen;

public class NoticeDAO {
   
    private DBOpen dbopen=null;
    private Connection con=null;
    private PreparedStatement pstmt=null;
    private ResultSet rs=null;
    private StringBuilder sql=null;

    public NoticeDAO() {
        dbopen=new DBOpen();    
    }//end
    
    public ArrayList<NoticeDTO> list(String col, String word, int nowPage, int recordPerPage){
        ArrayList<NoticeDTO> list=null;
        
        //페이지당 출력할 행의 갯수(10개를 기준)
        //1 페이지 : WHERE r>=1  AND r<=10;
        //2 페이지 : WHERE r>=11 AND r<=20;
        //3 페이지 : WHERE r>=21 AND r<=30;
        int startRow = ((nowPage-1) * recordPerPage) + 1 ;
        int endRow   = nowPage * recordPerPage;
        
        try {
            con=dbopen.getConnection();            
            sql=new StringBuilder();
            
            word=word.trim(); //검색어 좌우 공백 제거
            
            if(word.length()==0) { //검색하지 않는 경우    -> 6)
                sql.append(" SELECT * ");
                sql.append(" FROM ( ");
                sql.append("         SELECT noticeno,subject,readcnt,indent,regdt, rownum as r ");
                sql.append("         FROM ( ");
                sql.append("                 SELECT noticeno,subject,readcnt,indent,regdt ");
                sql.append("                 FROM tb_notice ");
                sql.append("                 ORDER BY grpno DESC, ansnum ASC ");
                sql.append("              ) ");
                sql.append("      ) ");
                sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow) ;
                
            }else { //검색 하는 경우  -> 7)
                sql.append(" SELECT * ");
                sql.append(" FROM ( ");
                sql.append("         SELECT noticeno,subject,readcnt,indent,regdt, rownum as r ");
                sql.append("         FROM ( ");
                sql.append("                 SELECT noticeno,subject,readcnt,indent,regdt ");
                sql.append("                 FROM tb_notice ");
                
                String search="";
                if(col.equals("subject_content")) {
                    search += " WHERE subject LIKE '%" + word + "%' ";
                    search += " OR    content LIKE '%" + word + "%' ";
                }else if(col.equals("subject")) {
                    search += " WHERE subject LIKE '%" + word + "%' ";
                }else if(col.equals("content")) {
                    search += " WHERE content LIKE '%" + word + "%' ";
                }//if end 
                sql.append(search);                
                
                sql.append("                 ORDER BY grpno DESC, ansnum ASC ");
                sql.append("              ) ");
                sql.append("      ) ");
                sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow) ;
            }//if end   
            
            
            pstmt=con.prepareStatement(sql.toString());
            rs=pstmt.executeQuery();
            if(rs.next()) {
                list=new ArrayList<>();
                do {
                    NoticeDTO dto=new NoticeDTO();//한줄담기
                    dto.setNoticeno(rs.getInt("noticeno"));
                    dto.setSubject(rs.getString("subject"));
                    dto.setReadcnt(rs.getInt("readcnt"));
                    dto.setRegdt(rs.getString("regdt"));
                    dto.setIndent(rs.getInt("indent"));
                    list.add(dto); //list에 모으기
                }while(rs.next());
            }//if end
            
        }catch (Exception e) {
            System.out.println("목록 페이징 실패:"+e);
        }finally {
            DBClose.close(con, pstmt, rs);
        }//end
        return list;
    }//list() end
    
    
    public int count(String col, String word) {
        int cnt=0;
        try {
            con=dbopen.getConnection();
            
            sql=new StringBuilder();
            sql.append(" SELECT COUNT(*) as cnt ");
            sql.append(" FROM tb_notice ");
            
            if(word.length()>=1) { //검색어가 존재한다면
                String search="";
                if(col.equals("subject_content")) {
                    search += " WHERE subject LIKE '%" + word + "%' ";
                    search += " OR    content LIKE '%" + word + "%' ";
                }else if(col.equals("subject")) {
                    search += " WHERE subject LIKE '%" + word + "%' ";
                }else if(col.equals("content")) {
                    search += " WHERE content LIKE '%" + word + "%' ";
                }//if end 
                sql.append(search);
            }//if end
            
            pstmt=con.prepareStatement(sql.toString());
            rs=pstmt.executeQuery();
            if(rs.next()) {
                cnt=rs.getInt("cnt");
            }//if end
            
        }catch (Exception e) {
            System.out.println("검색 글갯수 실패:"+e);
        }finally {
            DBClose.close(con, pstmt, rs);
        }//end
        return cnt;
    }//count() end
    
    
    public int create(NoticeDTO dto) {
        int cnt=0;
        try {
            con=dbopen.getConnection();//DB연결
            
            sql=new StringBuilder();
            sql.append(" INSERT INTO tb_notice(noticeno, subject, content, grpno) ");
            sql.append(" VALUES (noticeno_seq.nextval, ?, ?, (SELECT NVL(MAX(noticeno), 0)+1 FROM tb_notice)) ");
            
            pstmt=con.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getSubject());
            pstmt.setString(2, dto.getContent());
            
            cnt=pstmt.executeUpdate();
            
        }catch (Exception e) {
            System.out.println("추가실패:"+e);
        }finally {
            DBClose.close(con, pstmt);
        }//end
        return cnt;
    }//create() end
    
    
    public NoticeDTO read(int noticeno) {
        NoticeDTO dto=null;
        try {
            con=dbopen.getConnection();
            
            sql=new StringBuilder();
            sql.append(" SELECT noticeno, subject, content, readcnt, regdt, grpno, indent, ansnum ");
            sql.append(" FROM tb_notice ");
            sql.append(" WHERE noticeno=? ");
            
            pstmt=con.prepareStatement(sql.toString());
            pstmt.setInt(1, noticeno);
            
            rs=pstmt.executeQuery();
            if(rs.next()) {
                dto=new NoticeDTO();
                dto.setNoticeno(rs.getInt("Noticeno"));
                dto.setSubject(rs.getString("subject"));
                dto.setContent (rs.getString("content"));
                dto.setReadcnt(rs.getInt("readcnt"));
                dto.setRegdt(rs.getString("regdt"));
                dto.setGrpno(rs.getInt("grpno"));
                dto.setIndent(rs.getInt("indent"));
                dto.setAnsnum(rs.getInt("ansnum"));
            }//end
            
        }catch (Exception e) {
            System.out.println("상세보기실패:"+e);
        }finally {
            DBClose.close(con, pstmt, rs);
        }//end
        return dto;
    }//read() end
    
    
    public void incrementCnt(int noticeno) {
        try {
            con=dbopen.getConnection();
            
            sql=new StringBuilder();
            sql.append(" UPDATE tb_notice ");
            sql.append(" SET readcnt=readcnt+1 ");
            sql.append(" WHERE noticeno=? ");
            
            pstmt=con.prepareStatement(sql.toString());
            pstmt.setInt(1, noticeno);
            pstmt.executeUpdate();
            
        }catch (Exception e) {
            System.out.println("조회수 증가 실패:"+e);
        }finally {
            DBClose.close(con, pstmt);
        }//end
    }//incrementCnt() end    
    
    public int reply(NoticeDTO dto) {
        int cnt=0;
        try {
            con=dbopen.getConnection();
            sql=new StringBuilder();
            
            //1)부모글 정보 가져오기(select문)
            int grpno=0;   //부모글 그룹번호
            int indent=0;  //부모글 들여쓰기
            int ansnum=0;  //부모글 글순서
            sql.append(" SELECT grpno, indent, ansnum ");
            sql.append(" FROM tb_notice ");
            sql.append(" WHERE noticeno=? ");
            pstmt=con.prepareStatement(sql.toString());
            pstmt.setInt(1, dto.getNoticeno());
            rs=pstmt.executeQuery();
            if(rs.next()) {
                //그룹번호 : 부모글 그룹번호 그대로 가져오기
                grpno=rs.getInt("grpno");
                //들여쓰기 : 부모글 들여쓰기 + 1
                indent=rs.getInt("indent")+1;
                //글순서   : 부모글 글순서 +1
                ansnum=rs.getInt("ansnum")+1;
            }//if end
            
            
            //2)글순서 재조정하기(update문)
            sql.delete(0, sql.length()); //1)단계에서 사용했던 sql값 지우기
            sql.append(" UPDATE tb_notice ");
            sql.append(" SET ansnum=ansnum+ 1 ");
            sql.append(" WHERE grpno=? AND ansnum>=? ");
            pstmt=con.prepareStatement(sql.toString());
            pstmt.setInt(1, grpno);
            pstmt.setInt(2, ansnum);
            pstmt.executeUpdate();            
            
            
            //3)답변글 추가하기(insert문)
            sql.delete(0, sql.length());
            sql.append(" INSERT INTO tb_notice(noticeno, subject, content, grpno, indent, ansnum) ");
            sql.append(" VALUES(noticeno_seq.nextval, ?, ?, ?, ?, ?) ");
            
            pstmt=con.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getSubject());
            pstmt.setString(2, dto.getContent());
            pstmt.setInt(3, grpno);  //1)단계에서 만든 그룹번호
            pstmt.setInt(4, indent); //1)단계에서 만든 들여쓰기
            pstmt.setInt(5, ansnum); //1)단계에서 만들 글순서
            
            cnt=pstmt.executeUpdate();
            
        }catch (Exception e) {
            System.out.println("답변쓰기 실패:"+e);
        }finally {
            DBClose.close(con, pstmt,rs);
        }//end
        return cnt;
    }//reply() end
    
    
    public int updateproc(NoticeDTO dto) {
        int cnt=0;
        try {
            con=dbopen.getConnection();
            
            sql=new StringBuilder();
            sql.append(" UPDATE tb_notice ");
            sql.append(" SET subject=? ");
            sql.append(" , content=? ");
            sql.append(" WHERE noticeno=? ");
            
            pstmt=con.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getSubject());
            pstmt.setString(2, dto.getContent());
            pstmt.setInt(3, dto.getNoticeno());
            
            cnt=pstmt.executeUpdate();
            
        }catch (Exception e) {
            System.out.println("수정 실패:"+e);
        }finally {
            DBClose.close(con, pstmt);
        }//end
        return cnt;
    }//updateproc() end
    
    
    public int delete(NoticeDTO dto) {
        int cnt=0;
        try {
            
            con=dbopen.getConnection();
            sql=new StringBuilder();
            sql.append(" DELETE FROM tb_notice ");
            sql.append(" WHERE noticeno=? ");
            
            pstmt=con.prepareStatement(sql.toString());
            pstmt.setInt(1, dto.getNoticeno());
            cnt=pstmt.executeUpdate();
            
        }catch (Exception e) {
            System.out.println("삭제 실패:"+e);
        }finally {
            DBClose.close(con, pstmt);
        }//end
        return cnt;
    }//delete() end    
    
    
}//class end
