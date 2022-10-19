package net.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.utility.DBClose;
import net.utility.DBOpen;

public class MemberDAO { // Data Access Object
                         // DB 접근 객체

    private DBOpen dbopen = null;
    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private StringBuilder sql = null;

    public MemberDAO() {
        dbopen = new DBOpen();
    }// end

    // 비지니스 로직 구현
    public String loginProc(MemberDTO dto) {
        String mlevel = null;
        try {
            con = dbopen.getConnection();

            sql = new StringBuilder();
            sql.append(" SELECT mlevel ");
            sql.append(" FROM member ");
            sql.append(" WHERE id=? AND passwd=? ");
            sql.append(" AND mlevel in ('A1', 'B1', 'C1', 'D1') ");

            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getPasswd());

            rs = pstmt.executeQuery();
            if (rs.next()) {
                mlevel = rs.getString("mlevel");
            } // if end

        } catch (Exception e) {
            System.out.println("로그인실패:" + e);
        } finally {
            DBClose.close(con, pstmt, rs);
        } // end
        return mlevel;
    }// loginProc() end

    public int duplecateID(String id) {
        int cnt = 0;
        try {
            con = dbopen.getConnection();

            sql = new StringBuilder();
            sql.append(" SELECT COUNT(id) as cnt ");
            sql.append(" FROM member ");
            sql.append(" WHERE id=? ");

            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, id);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                cnt = rs.getInt("cnt");
            } // if end

        } catch (Exception e) {
            System.out.println("아이디 중복 확인 실패:" + e);
        } finally {
            DBClose.close(con, pstmt, rs);
        } // end
        return cnt;

    }// duplecateID() end

    public int duplecateEmail(String email) {
        int cnt = 0;
        try {
            con = dbopen.getConnection();

            sql = new StringBuilder();
            sql.append(" SELECT COUNT(email) as cnt ");
            sql.append(" FROM member ");
            sql.append(" WHERE email=? ");

            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, email);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                cnt = rs.getInt("cnt");
            } // if end

        } catch (Exception e) {
            System.out.println("이메일 중복 확인 실패:" + e);
        } finally {
            DBClose.close(con, pstmt, rs);
        } // end
        return cnt;

    }// duplecateID() end

    public int create(MemberDTO dto) {
        int cnt = 0;

        try {
            con = dbopen.getConnection();

            sql = new StringBuilder();
            sql.append(
                    " INSERT INTO MEMBER(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate) ");
            sql.append(" VALUES (?,?,?,?,?,?,?,?,?,'D1', sysdate) ");

            pstmt = con.prepareStatement(sql.toString());

            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getPasswd());
            pstmt.setString(3, dto.getMname());
            pstmt.setString(4, dto.getTel());
            pstmt.setString(5, dto.getEmail());
            pstmt.setString(6, dto.getZipcode());
            pstmt.setString(7, dto.getAddress1());
            pstmt.setString(8, dto.getAddress2());
            pstmt.setString(9, dto.getJob());

            cnt = pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("회원가입 실패:" + e);
        } finally {
            DBClose.close(con, pstmt, rs);
        } // end
        return cnt;

    }// create end

}// class end
