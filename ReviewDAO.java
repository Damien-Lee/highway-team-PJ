package review.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import jdbc.JdbcUtil;
import review.model.Review;

public class ReviewDAO {
	
	private static ReviewDAO instacne = new ReviewDAO();
	
	public static ReviewDAO getInstance(){
		return instacne;
	}
	
	private ReviewDAO() {}
	
	public int insert(Connection conn, Review review) throws Exception{
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into restarea.review (name,repw,resatis,recontent) values(?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, review.getName());
			pstmt.setString(2, review.getRepw());
			pstmt.setInt(3, review.getResatis());
			pstmt.setString(4, review.getRecontent());
			
			return pstmt.executeUpdate();
		}finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	
	public Review select(Connection conn, int reno) throws Exception{
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from restarea where reno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, reno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return makeReviewFromResultSet(rs);
			}else {
				return null;
			}
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	private Review makeReviewFromResultSet(ResultSet rs) throws Exception{
		Review review = new Review();
		review.setName(rs.getString("name"));
		review.setRepw(rs.getString("repw"));
		review.setResatis(rs.getInt("resatis"));
		review.setRecontent(rs.getString("recontent"));
		
		return review;
	}
	
	public int selectCount(Connection conn) throws Exception{
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt=conn.createStatement();
			String sql = "select * from restarea";
			rs = stmt.executeQuery(sql);
			rs.next();
			return rs.getInt(1);
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	public List<Review> selectList(Connection conn, int firstRow, int endRow) throws Exception{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from restarea order by reno limit ?,?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, firstRow-1);
			pstmt.setInt(1, endRow-firstRow+1);
			
			if(rs.next()) {
				List<Review> reviewList = new ArrayList<Review>();
				do {
					reviewList.add(makeReviewFromResultSet(rs));
				}while(rs.next());
				return reviewList;
			}else {
				return Collections.emptyList();
			}
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int delete(Connection conn, int reno) throws Exception{
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from restarea where reno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reno);
			return pstmt.executeUpdate();
		}finally {
			JdbcUtil.close(pstmt);
		}
	}
}





















