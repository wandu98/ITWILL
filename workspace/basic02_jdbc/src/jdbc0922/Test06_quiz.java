package jdbc0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test06_quiz {

   public static void main(String[] args) {
      //문제) 학번 g1001이 수강신청한 과목을 과목코드별로 조회하시오
	   /*
	    	g1001	p001	OOP
	    	g1001	p003	JSP
	    	g1001	d001	웹표준
	    */
       
	  String hakno="g1001";
	        
      Connection con= null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      try {
    	   String url ="jdbc:oracle:thin:@localhost:1521:xe";
		   String userid="system";
		   String pwd ="pass";
		   Class.forName("oracle.jdbc.OracleDriver");
		   con=DriverManager.getConnection(url, userid, pwd);
		   System.out.println("오라클DB 서버 연결 성공!!");
	     
		 StringBuilder sql = new StringBuilder();
         sql.append(" SELECT SU.hakno, SU.gcode, GW.gname ");
         sql.append(" FROM tb_sugang SU JOIN tb_gwamok GW ");
         sql.append(" ON SU.gcode = GW.gcode ");
         sql.append(" WHERE SU.hakno=? ");
		 sql.append(" ORDER BY SU.gcode ");         
         
         pstmt=con.prepareStatement(sql.toString());
         pstmt.setString(1, hakno);
         
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
        	 System.out.println("변호사님 여기 자료 있습니다!");
        	 do {
        		 System.out.print(rs.getString("hakno") + " ");
        		 System.out.print(rs.getString("gcode") + " ");
        		 System.out.print(rs.getString("gname") + " ");
        		 System.out.println();//한 행 불러오면 줄 바꿈
        	 }while(rs.next());	//다음 cursor가 있는지?
        	 
         }else {
        	 System.out.println("변호사님 자료가 없어서 섭섭하네요..");
         }//if end
         
      } catch (Exception e) {
         System.out.println("오라클 DB 연결 실패 : " + e);
      } finally { //자원반납(순서주의)
         try {
            if(rs!=null) {rs.close();}
         } catch (Exception e) {}
         
         try {
            if(pstmt!=null) {pstmt.close();}
         } catch (Exception e) {}
         
         try {
            if(con!=null) {con.close();}
         } catch (Exception e) {}
      }//end
      
      System.out.println("END");
      
   }//main() end
}//class end