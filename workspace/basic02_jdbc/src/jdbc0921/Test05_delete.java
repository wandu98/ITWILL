package jdbc0921;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class Test05_delete {
	public static void main(String[] args) {
		//sungjuk 테이블 행 삭제 연습
       
       
       
       try {
    	   	String url ="jdbc:oracle:thin:@localhost:1521:xe";
    	   	String userid="system";
    	   	String pwd ="pass";
    	    Class.forName("oracle.jdbc.OracleDriver");
    	    Connection con =DriverManager.getConnection(url, userid, pwd);
    	    System.out.println("오라클DB 서버 연결 성공!!");
    	    
    	    StringBuilder sql=new StringBuilder();
    	    sql.append(" DELETE FROM sungjuk WHERE sno=26 ");
    	    
    	    PreparedStatement pstmt=con.prepareStatement(sql.toString());
    	    
    	    int cnt=pstmt.executeUpdate();//실행 했을 때 행의 갯수가 반환
    	    if(cnt==0) {
    	    	System.out.println("행 삭제 실패!!");
    	    }else {
    	    	System.out.println("행 삭제 성공~~");
    	    }//if end
    	    
    	    //자원반납
    	    pstmt.close();
    	    con.close();
    	    
    	    
       }catch(Exception e) {
    	    e.printStackTrace();
       }
    
       
       try {	
    	        
    	       
       }catch(Exception e) {
    	   e.printStackTrace();
       }//end
       System.out.println("end");
	}
}
