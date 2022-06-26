package com.review.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

}
