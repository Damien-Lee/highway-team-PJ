package review.service;

public class ServiceException extends RuntimeException {

	public ServiceException(String review, Exception cause) {
		super(review, cause);
	}

	public ServiceException(String review) {
		super(review);
	}

}