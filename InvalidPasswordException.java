package review.service;

public class InvalidPasswordException extends ServiceException {

	public InvalidPasswordException (String review) {
		super(review);
	}
}
