package jdbc0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test04_selectAvg {

	public static void main(String[] args) {
		// 주소가 서울인 행들의 국영수 평균값을 구하시오
		// (단, 소수점은 반올림해서 둘째 자리값까지 표현)
		String addr="Seoul";
		
		
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
    	    sql.append(" SELECT Round(AVG(kor), 2) AS avg_kor ");
    	    sql.append(" 	   ,ROUND(AVG(eng), 2) AS avg_eng");
    	    sql.append(" 	   ,ROUND(AVG(mat), 2) AS avg_mat");
    	    sql.append(" FROM sungjuk ");
    	    sql.append(" WHERE addr=? ");
    	        	
    	    pstmt=con.prepareStatement(sql.toString());
    	    pstmt.setString(1, addr);
    	    
    	    rs=pstmt.executeQuery();
    	    if(rs.next()) {
    	    	System.out.println("변호사님 자료가 있습니다~!");
    	    	//1)칼럼순서 접근
    	    	System.out.printf("국어평균:%.2f\n", rs.getDouble(1));
    	    	System.out.printf("영어평균:%.2f\n", rs.getDouble(2));
    	    	System.out.printf("수학평균:%.2f\n", rs.getDouble(3));
    	    	System.out.println("--------------------------");
    	    	
    	    	//2)칼럼명 접근
    	    	System.out.printf("국어평균:%.2f\n", rs.getDouble("avg_kor"));
    	    	System.out.printf("국어평균:%.2f\n", rs.getDouble("avg_eng"));
    	    	System.out.printf("국어평균:%.2f\n", rs.getDouble("avg_mat"));
    	    	
    	    }else {
    	    	System.out.println("변호사님 자료가 없어서 섭섭하네요..");
    	    }//if end
    	    
		}catch (Exception e) {
			System.out.println("실패 : " + e);
		
		}//end
		System.out.println("END");
	}//main() end
}//class end
