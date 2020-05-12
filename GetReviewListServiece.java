package review.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import review.DAO.ReviewDAO;
import review.model.Review;

public class GetReviewListServiece {

	private static GetReviewListServiece instance = new GetReviewListServiece();
	
	public static GetReviewListServiece getInstance() {
		return instance;
	}
	
	private GetReviewListServiece() {}
	
	private static final int REVIEW_COUNT_PER_PAGE = 5;
	
	public ReviewListView getReviewList(int pageNumber) throws Exception {
		Connection conn = null;
		int currentPageNumber = pageNumber;
		
		try {
			conn = ConnectionProvider.getConnection();
			ReviewDAO reviewDAO = ReviewDAO.getInstance();
			
			int reviewTotalCount = reviewDAO.selectCount(conn);
			
			List<Review> reviewList = null;
			int firstRow = 0;
			int endRow = 0;
			
			if(reviewTotalCount>0) {
				firstRow = (pageNumber-1)*REVIEW_COUNT_PER_PAGE+1;
				endRow=firstRow+REVIEW_COUNT_PER_PAGE-1;
				
				reviewList=reviewDAO.selectList(conn, firstRow, endRow);
			}else {
				currentPageNumber=0;
				reviewList = Collections.emptyList();
			}
			return new ReviewListView(reviewList,reviewTotalCount,currentPageNumber,
					REVIEW_COUNT_PER_PAGE,firstRow,endRow);
		}catch(SQLException e) {
			throw new ServiceException("목록 구하기 실패: "+e.getMessage(),e);
		}finally {
			JdbcUtil.close(conn);
		}
	}
}
