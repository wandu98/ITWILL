package net.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBOpen {
 
  public Connection getConnetion() {
		
		
			String url      = "jdbc:mysql://localhost/wnadu98";
		    String user     = "wnadu98";
		    String password = "rlawndhks!";
		    String driver   = "org.gjt.mm.mysql.Driver";
		    
		    Connection con = null;
		    
		    try {
		     
		      Class.forName(driver);
		      con = DriverManager.getConnection(url, user, password);
		     
		    }catch (Exception e) {
		      System.out.println("DB 연결 실패: "+e);
		    }
		   
		    return con;   
		    
		  }//end
	
		}//class end


