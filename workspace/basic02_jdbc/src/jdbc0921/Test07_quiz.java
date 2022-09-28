package jdbc0921;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class Test07_quiz {
	public static void main(String[] args) {
		//문제)sno=28 행의 데이터를 아래의 내용으로 수정하시오
       
       
       try {
    	   	String url ="jdbc:oracle:thin:@localhost:1521:xe";
    	   	String userid="system";
    	   	String pwd ="pass";
    	    Class.forName("oracle.jdbc.OracleDriver");
    	    Connection con =DriverManager.getConnection(url, userid, pwd);
    	    System.out.println("오라클DB 서버 연결 성공!!");
    	    
    	    
    	    String uname="JSPark";
    	    int kor=90, eng=85, mat=100;
    	    String addr="Suwon";
    	    int tot=kor+eng+mat;
    	    int aver=(kor+eng+mat)/3;
    	    int sno=28;
    	  
    	    //이 방법이 수정하기 더 편하다
    	    StringBuilder sql=new StringBuilder();
    	    sql.append(" UPDATE sungjuk ");
    	    sql.append(" SET uname=? ");
    	    sql.append(" ,kor=? ");
    	    sql.append(" ,eng=? ");
    	    sql.append(" ,mat=? ");
    	    sql.append(" ,tot=? ");
    	    sql.append(" ,aver=? ");
    	    sql.append(" ,addr=? ");
    	    sql.append(" ,wdate=sysdate ");
    	    sql.append(" WHERE sno=? ");
    	    
    	    /*
    	    내가 푼 문제
    	    sql.append(" UPDATE sungjuk ");
    	    sql.append(" SET  uname='JSPark' ");
    	    sql.append(", kor=90 " );
    	    sql.append(", eng=85 " );
    	    sql.append(", mat=100 " );
    	    sql.append(", tot=(kor+eng+mat) ");
    	    sql.append(", aver=tot/3 " );
    	    sql.append(", addr='Suwon' ");
    	    sql.append(" WHERE sno=28" );
    	     */
    	    
    
    	    PreparedStatement pstmt=con.prepareStatement(sql.toString());
    	    pstmt.setString(1, uname);
    	    pstmt.setInt(2,  kor);
    	    pstmt.setInt(3,  eng);
    	    pstmt.setInt(4,  mat);
    	    pstmt.setInt(5,  tot);
    	    pstmt.setInt(6,  aver);
    	    pstmt.setString(7,  addr);
    	    pstmt.setInt(8,  sno);
    	    
    	    
    	    
    	    int cnt=pstmt.executeUpdate();
    	    if(cnt==0) {
    	    	System.out.println("행 추가 실패!!");
    	    }else {
    	    	System.out.println("행 추가 성공~~");
    	    }// if end
    	    
    	    pstmt.close();
    	    con.close();
    	    
    	    
    	    
      }catch(Exception e) {
    	  System.out.println("실패:" + e);
       }//end
       
       System.out.println("END");
	}
}
