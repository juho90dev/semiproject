package com.request.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.request.model.vo.RequestPlan;

public class RequestDao {

	private Properties prop=new Properties();
	
	public RequestDao() {
		String path=RequestDao.class.getResource("/sql/RequestPlan_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertRequest(Connection conn, RequestPlan rp) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertRequest"));
			pstmt.setString(1, rp.getMemberId());
			pstmt.setString(2, rp.getPlannerId());
			pstmt.setString(3, rp.getContent());
			pstmt.setString(4, rp.getStartDay());
			pstmt.setString(5, rp.getEndDay());
			pstmt.setString(6, rp.getTransport());
			pstmt.setString(7, rp.getTheme());
			//pstmt.setString(8, rp.getApproval());
			//pstmt.setString(9, rp.getRequestPay());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	
}
