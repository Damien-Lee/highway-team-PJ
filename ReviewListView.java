package review.service;

import java.util.List;

import review.model.Review;

public class ReviewListView {

	private int reviewTotalCount;
	private int currentPageNumber;
	private List<Review> reviewList;
	private int pageTotalCount;
	private int reviewCountPerPage;
	private int firstRow;
	private int endRow;
	
	public ReviewListView(List<Review> reviewList,int reviewTotalCount,int currentPageNumber,
			int reviewCountPerPage,int fristRow,int endRow) {
		this.reviewList=reviewList;
		this.reviewTotalCount=reviewTotalCount;
		this.currentPageNumber=currentPageNumber;
		this.reviewCountPerPage=reviewCountPerPage;
		this.firstRow=firstRow;
		this.endRow=endRow;
		
		calculatePageTotalCount();
	}
	
	private void calculatePageTotalCount() {
		if(reviewTotalCount==0) {
			pageTotalCount=0;
		}else {
			pageTotalCount=pageTotalCount/reviewCountPerPage;
			if(reviewTotalCount % reviewCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}

	public int getReviewTotalCount() {
		return reviewTotalCount;
	}

	public void setReviewTotalCount(int reviewTotalCount) {
		this.reviewTotalCount = reviewTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}

	public List<Review> getReviewList() {
		return reviewList;
	}

	public void setReviewList(List<Review> reviewList) {
		this.reviewList = reviewList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public int getReviewCountPerPage() {
		return reviewCountPerPage;
	}

	public void setReviewCountPerPage(int reviewCountPerPage) {
		this.reviewCountPerPage = reviewCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	public boolean isEmpty() {
		return reviewTotalCount==0;
	}
}
