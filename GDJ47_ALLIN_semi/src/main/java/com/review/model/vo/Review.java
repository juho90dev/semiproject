package com.review.model.vo;

public class Review {
	private String reviewTitle;
	private String reviewContent;
	private String reviewWriter;
	private String reviewFile;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(String reviewTitle, String reviewContent, String reviewWriter, String reviewFile) {
		super();
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewWriter = reviewWriter;
		this.reviewFile = reviewFile;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public String getReviewFile() {
		return reviewFile;
	}

	public void setReviewFile(String reviewFile) {
		this.reviewFile = reviewFile;
	}

	@Override
	public String toString() {
		return "Review [reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent + ", reviewWriter="
				+ reviewWriter + ", reviewFile=" + reviewFile + "]";
	}
	
	

}
