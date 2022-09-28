package jdbc0921;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class Test03_insert {
	public static void main(String[] args) {
		//sungjuk 테이블 행 추가 연습
       String url ="jdbc:oracle:thin:@localhost:1521:xe";
       String userid="system";
       String pwd ="pass";
       
       
       try {
    	    Class.forName("oracle.jdbc.OracleDriver");
       }catch(Exception e) {
    	    e.printStackTrace();
       }
    
       
       try {	
    	       Connection con =DriverManager.getConnection(url, userid, pwd);   
    	     //4)SQL작성
    	       //->주의사항)SQL 종결문자 ; 를 쓰면 오류남
    	       StringBuilder sql=new StringBuilder();
    	       sql.append("INSERT INTO sungjuk(sno, uname, kor, eng, mat, addr, wdate)");
    	       sql.append("VALUES (sungjuk_seq.nextval, '손흥민', 99, 98, 97, 'Seoul', sysdate)");
    	      
    	       
    	       //5)SQL형식으로 변환
    	       PreparedStatement pstmt=con.prepareStatement(sql.toString());
    	       
    	       //6)SQL문 실행
    	       int cnt=pstmt.executeUpdate();	//INSERT, UPDATE, DELETE문 실행
    	       
    	       System.out.println("실형결과 : " + cnt);
    	       
       }catch(Exception e) {
    	   e.printStackTrace();
       }//end
       System.out.println("end");
	}
}
