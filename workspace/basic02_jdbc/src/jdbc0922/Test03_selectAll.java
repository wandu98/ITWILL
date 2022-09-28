package jdbc0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test03_selectAll {

	public static void main(String[] args) {
		//sungjuk 테이블 전체 가져오기
		
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
    	    
    	    StringBuilder sql=new StringBuilder();
    	    sql.append(" SELECT sno, uname, kor, eng, mat, tot, aver, addr, wdate ");
    	    sql.append(" FROM sungjuk ");
    	    sql.append(" ORDER BY sno DESC ");
    	        	
    	    pstmt=con.prepareStatement(sql.toString());
    	    rs=pstmt.executeQuery();
    	    
    	    if(rs.next()) {
    	    	System.out.println("변호사님 자료가 있습니다~!");
    	    	do {
    	    		System.out.print(rs.getInt("sno") + " ");
    	    		System.out.print(rs.getString("uname") + " ");
    	    		System.out.print(rs.getInt("kor") + " ");
    	    		System.out.print(rs.getInt("eng") + " ");
    	    		System.out.print(rs.getInt("mat") + " ");
    	    		System.out.print(rs.getInt("tot") + " ");
    	    		System.out.print(rs.getInt("aver") + " ");
    	    		System.out.print(rs.getString("addr") + " ");
    	    		System.out.print(rs.getString("wdate") + " ");
    	    		System.out.println(); //한 사람이 끝나면 줄바꿈
    	    	}while(rs.next());	//다음 cursor가 있는지?
    	    	
    	    }else {
    	    	System.out.println("변호사님 자료가 없어서 섭섭하네요..");
    	    }//if end
    	    
		}catch (Exception e) {
			System.out.println("실패 : " + e);
		
		}//end
		System.out.println("END");
	}//main() end
}//class end
