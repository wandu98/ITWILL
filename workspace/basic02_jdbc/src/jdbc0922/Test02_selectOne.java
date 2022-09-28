package jdbc0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test02_selectOne {

	public static void main(String[] args) {
		//sungjuk 테이블에서 한 행 가져오기
		int sno=28;
		
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
    	    sql.append(" WHERE sno=? ");
    	    
    	    pstmt=con.prepareStatement(sql.toString());
    	    pstmt.setInt(1, sno);
    	    
    	    rs=pstmt.executeQuery();
    	    if(rs.next()) {
    	    	System.out.println("변호사님 자료가 있습니다~!"); 
    	    	//1)칼럼순서 접근
    	    	System.out.println(rs.getInt(1)); 	 //1번칼럼. sno칼럼
    	    	System.out.println(rs.getString(2)); //2번칼럼. uname칼럼
    	    	System.out.println(rs.getInt(3)); 	 //3번칼럼. kor칼럼
    	    	System.out.println(rs.getInt(4)); 	 //4번칼럼. eng칼럼
    	    	System.out.println(rs.getInt(5)); 	 //5번칼럼. mat칼럼
    	    	System.out.println(rs.getInt(6)); 	 //6번칼럼. tot칼럼
    	    	System.out.println(rs.getInt(7)); 	 //7번칼럼. aver칼럼
    	    	System.out.println(rs.getString(8)); //8번칼럼. addr칼럼
    	    	System.out.println(rs.getString(9)); //9번칼럼. wdate칼럼
    	    	System.out.println("------------------------");
    	    	
    	    	//2)칼럼명 접근
    	    	System.out.println(rs.getInt("sno"));
       	    	System.out.println(rs.getString("uname"));
       	    	System.out.println(rs.getInt("kor"));
       	    	System.out.println(rs.getInt("eng"));
       	    	System.out.println(rs.getInt("mat"));
       	    	System.out.println(rs.getInt("tot"));
       	    	System.out.println(rs.getInt("aver"));
       	    	System.out.println(rs.getString("addr"));
       	    	System.out.println(rs.getString("wdate"));
    	    }else {
    	    	System.out.println("변호사님 자료가 없어서 섭섭하네요..");
    	    }//if end
    	    
		}catch (Exception e) {
			System.out.println("오라클 DB 연결 실패 : " + e);
		
		}//end
		System.out.println("END");
	}//main() end
}//class end
