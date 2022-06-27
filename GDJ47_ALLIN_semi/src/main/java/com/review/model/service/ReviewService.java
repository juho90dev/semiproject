package com.review.model.service;


import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.login.model.vo.Member;
import com.review.model.dao.ReviewDao;
import com.review.model.vo.Review;

public class ReviewService {
	
	
	private ReviewDao dao=new ReviewDao();
	
	
	
	public int insertReview(Review r) {
		Connection conn = getConnection();
		int result = dao.insertReview(conn, r);
		close(conn);
		return result;
		
	}
	
	public List<Review> reviewList() {
		Connection conn = getConnection();
		List<Review> result = dao.reviewList(conn);
		close(conn);
		return result;
	}

}
