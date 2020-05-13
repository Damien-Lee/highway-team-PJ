package husik;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import husik.member;
import jdbc.JdbcUtil;
public class memberDAO {
	
	public member selectById(Connection conn, String id)throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("Select * from husiktable where husikid = ?"); //쿼리문 준비
			pstmt.setString(1, id); //1번째 물음표는 id 
			rs = pstmt.executeQuery(); // 쿼리 실행 변수.
			member member = null;
			if(rs.next()) {
				member=new member(
						rs.getString("husikid"),
						rs.getString("name"),
						rs.getString("password"),
						toData(rs.getTimestamp("birthday")),
						rs.getString("hobby")
						);
			}
			return member;
		}finally {//값 반환.
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}//end of member method

	private Date toData(Date date) {
		return date==null? null:new Date(date.getTime());
	}
	
	public void insert(Connection conn,member mem) throws SQLException{
		try {
			PreparedStatement pstmt =conn.prepareStatement("insert into husiktable value(?,?,?,?,?)");
					{
				pstmt.setString(1, mem.getId());
				pstmt.setString(2, mem.getName());
				pstmt.setString(3, mem.getPassword());
				pstmt.setString(4, mem.getGender());
				pstmt.setTimestamp(5, new Timestamp(mem.getBirthday().getTime()));
				pstmt.executeUpdate();
			}
		}finally {
			
		}
	}
	
}
