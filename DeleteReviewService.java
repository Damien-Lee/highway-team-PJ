package review.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import review.DAO.ReviewDAO;
import review.model.Review;

public class DeleteReviewService {

	private static DeleteReviewService instance = new DeleteReviewService();
	
	public static DeleteReviewService getInstacne() {
		return instance;
	}
	
	public void deleteReview(int reno, String repw) throws Exception{
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			ReviewDAO reviewDAO = ReviewDAO.getInstance();
			Review review = reviewDAO.select(conn, reno);
			
			if(review==null) {
				throw new ReviewNotFoundException("리뷰없음");
			}
			if(!review.matchPassword(repw)) {
				throw new InvalidPasswordException("bad password");
			}
			reviewDAO.delete(conn, reno);
			conn.commit();
		}catch(SQLException ex) {
			JdbcUtil.rollback(conn);
			throw new ServiceException("삭제실패: "+ex.getMessage(),ex);
		}catch(InvalidPasswordException | ReviewNotFoundException ex) {
			JdbcUtil.rollback(conn);
			throw ex;
		}finally {
			JdbcUtil.close(conn);
		}
	}
}
