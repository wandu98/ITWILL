package jdbc0921;

import java.sql.Connection;
import java.sql.DriverManager;

public class Test02_DBopen {

	public static void main(String[] args) {
		// window 버전
		// Oracle DB 자신이 설치한 버전 연결 
		
		try {
			String url ="jdbc:oracle:thin:@localhost:1521:xe";
    	   	String userid="system";
    	   	String pwd ="pass";
    	    Class.forName("oracle.jdbc.OracleDriver");
    	    Connection con =DriverManager.getConnection(url, userid, pwd);
    	    System.out.println("오라클DB 서버 연결 성공!!");
			
			
		}catch (Exception e) {
			System.out.println("오라클 DB 연결 실패 : " + e);
		
		}//end

	}//main() end
}//class end
