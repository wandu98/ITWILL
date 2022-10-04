package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn;	//자바와 데이터베이스를 연결
	private PreparedStatement pstmt;	//쿼리문 대기 및 설정
	private ResultSet rs;	//결과값 받아오기
	
	//기본 생성자
	//UserDAO가 실행되면 자동으로 생성되는 부
	//메소드마다 반복되는 코드를 이곳에 넣으면 코드가 간소화된다
	public UserDAO() {
		try {
				String  dbURL = "jdbc:mysqldb://localhost:3306/bbs";
		}catch
	}//UserDAO end
}//UserDAO end
