package net.pds;

import java.sql.Connection;
import java.sql.PreparedStatement;

import net.utility.DBClose;
import net.utility.DBOpen;

public class PdsDAO {

    private DBOpen dbopen = null;
    private Connection con = null;
    private PreparedStatement pstmt = null;
    private StringBuilder sql = null;
    
    public PdsDAO() {
        dbopen = new DBOpen();
    }//end
    
    public int create(PdsDTO dto) {
        int cnt=0;
        try {
            con=dbopen.getConnection();//DB연결
            sql=new StringBuilder();
            sql.append(" insert into tb_pds(pdsno, wname, subject, passwd, filename, filesize, regdate) ");
            sql.append(" values(pds_req.nextval, ?,?,?,?,?, sysdate) ");
            
            pstmt=con.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getWname());
            pstmt.setString(2, dto.getSubject());
            pstmt.setString(3, dto.getPasswd());
            pstmt.setString(4, dto.getFilename());
            pstmt.setLong(5, dto.getFilesize());
            
            cnt=pstmt.executeUpdate();
            
        }catch (Exception e) {
            System.out.println("추가실패:"+e);
        }finally {
            DBClose.close(con, pstmt);
        }//end
        return cnt;
    }//create() end
    
}//class end
