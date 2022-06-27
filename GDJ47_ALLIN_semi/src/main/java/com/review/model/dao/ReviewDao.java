package com.review.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.review.model.vo.Review;

public class ReviewDao {
	private Properties prop=new Properties();
	
	public ReviewDao() {
		String path=ReviewDao.class.getResource("/sql/Review_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertReview(Connection conn, Review r) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertReview"));
			pstmt.setString(1, r.getReviewTitle());
			pstmt.setString(2, r.getReviewContent());
			pstmt.setString(3, r.getReviewWriter());
			pstmt.setString(4, r.getReviewFile());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public List<Review> reviewList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Review> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("reviewList"));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Review rv = new Review();
				rv.setReviewTitle(rs.getString("review_title"));
				rv.setReviewContent(rs.getString("review_content"));
				rv.setReviewWriter(rs.getString("review_writer"));
				rv.setReviewFile(rs.getString("review_flle"));
				list.add(rv);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
		
		}
	
	
	public static Review getReview(ResultSet rs) {
		Review r =null;
		try {
			r=new Review();
			r.setReviewTitle(rs.getString("review_title"));
			r.setReviewContent(rs.getString("review_content"));
			r.setReviewWriter(rs.getString("review_writer"));
			r.setReviewFile(rs.getString("review_file"));
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return r;
	}  

}
