package review.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import review.DAO.ReviewDAO;
import review.model.Review;

public class WriteReviewService {

	private static WriteReviewService instance = new WriteReviewService();
	
	public static WriteReviewService getInstance() {
		return instance;
	}
	
	private WriteReviewService() {}
	
	public void write(Review review) {
		Connection conn = null;
		
		try {
			ReviewDAO instance = ReviewDAO.getInstance();
			instance.insert(conn, review);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}
		
	}
	
	


}
