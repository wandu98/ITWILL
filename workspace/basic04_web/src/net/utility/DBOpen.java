package net.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBOpen {
	//오라클 DB 연결 메소드
	public Connection getConnection() {
		Connection con=null;
		try {
			String url ="jdbc:oracle:thin:@localhost:1521:xe";
		   	String userid="system";
		   	String pwd ="pass";
		    Class.forName("oracle.jdbc.OracleDriver");
		    con =DriverManager.getConnection(url, userid, pwd);
		    
		}catch (Exception e) {
			System.out.println("오라클 DB 연결실패 :" + e);
		}//end
		return con;
	}//getConnection() end
}//class end
