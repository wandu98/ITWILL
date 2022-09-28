package jdbc0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test07_selectPaging {

	public static void main(String[] args) {
		//페이징
		//문제) sungjuk 테이블에서 이름순으로 정렬후 행번호 4~6만 조회하시오
		int start=4;	//시작 행번
		int end=6;		//끝 행번호
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		 try {
	    	   String url ="jdbc:oracle:thin:@localhost:1521:xe";
			   String userid="system";
			   String pwd ="pass";
			   Class.forName("oracle.jdbc.OracleDriver");
			   con=DriverManager.getConnection(url, userid, pwd);
			   System.out.println("오라클DB 서버 연결 성공!!");
		     
			 StringBuilder sql = new StringBuilder();
			 sql.append(" ");
			 sql.append(" select * ");
		 	 sql.append(" from ( ");
			 sql.append("		select rownum as rnum, uname, aver, addr ");
			 sql.append("		from( ");
			 sql.append("				select uname, aver, addr ");
			 sql.append("				from sungjuk ");
		 	 sql.append("				order by uname ");
		 	 sql.append("		) ");
			 sql.append("			 ) ");
			 sql.append(" where rnum>=? and rnum<=? ");         
	         
	         pstmt=con.prepareStatement(sql.toString());
	         pstmt.setInt(1, start);
	         pstmt.setInt(2, end);
	         
	         rs=pstmt.executeQuery();
	         if(rs.next()) {
	        	 System.out.println("변호사님 여기 자료 있습니다!");
	        	 do {
	        		 System.out.print(rs.getInt("rnum") + " ");
	        		 System.out.print(rs.getString("uname") + " ");
	        		 System.out.print(rs.getInt("aver") + " ");
	        		 System.out.print(rs.getString("addr") + " ");
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
