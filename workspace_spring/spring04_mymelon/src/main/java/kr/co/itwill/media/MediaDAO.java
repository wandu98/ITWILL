package kr.co.itwill.media;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class MediaDAO {

	@Autowired
	private JdbcTemplate jt;
	
	private ResultSet rs=null;
	private StringBuilder sql=null;

	public MediaDAO() {
		System.out.println("-----MediaDAO()객체 생성됨");
	}// end

	public List<MediaDTO> list(int mediagroupno) {
		List<MediaDTO> list = null;
		try {
			sql = new StringBuilder();
			sql.append(" SELECT mediano, title, rdate, poster, filename, filesize, mview, mediagroupno ");
			sql.append(" FROM media ");
			sql.append(" WHERE mview='Y' AND mediagroupno= " + mediagroupno);
			sql.append(" ORDER BY mediano DESC ");

			RowMapper<MediaDTO> rowMapper = new RowMapper<MediaDTO>() {
				@Override
				public MediaDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					MediaDTO dto = new MediaDTO();
					dto.setMediano(rs.getInt("mediano"));
					dto.setTitle(rs.getString("titel"));
					dto.setRdate(rs.getString("rdate"));
					dto.setPoster(rs.getString("poster"));
					dto.setFilename(rs.getString("filename"));
					dto.setFilesize(rs.getLong("filesize"));
					dto.setMview(rs.getString("mview"));
					dto.setMediagroupno(rs.getInt("mediagroupno"));
					return dto;
				}// mapRow() end
			};// fowMapper end

			list = jt.query(sql.toString(), rowMapper);

		} catch (Exception e) {
			System.out.println("media목록 실패 :" + e);
		} // end
		return list;
	}// list()end

	
	public int create(MediaDTO dto) {
		int cnt=0;
		try {
			sql=new StringBuilder();
			sql.append(" INSERT INTO media(mediano, title, poster, filename, filesize, mediagroupno, rdate) ");
			sql.append(" VALUES( media_seq.nextval, ?, ?, ?, ?, ?, sdysdate) ");
			cnt=jt.update(sql.toString(), dto.getTitle(), dto.getPoster(), dto.getFilename(), dto.getFilesize(), dto.getMediagroupno());
		
		} catch (Exception e) {
			System.out.println("음원등록실패"+e);
		}//end
		return cnt;
	}//create() end
	
	
	
}// class end
