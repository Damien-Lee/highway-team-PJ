package review.service;

public class ReviewNotFoundException extends ServiceException {
	
	public ReviewNotFoundException (String review) {
		super(review);
	}
}
