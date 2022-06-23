package com.request.model.dao;

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

	public List<RequestPlan> selectRequestList(Connection conn, String plannerId) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		List<RequestPlan> result = new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectRequestList"));
			pstmt.setString(1, plannerId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				RequestPlan rp = new RequestPlan();
				rp.setMemberId(rs.getString("MEMBER_ID"));
				rp.setPlannerId(rs.getString("PLANNER_ID"));
				rp.setContent(rs.getString("CONTENT"));
				rp.setStartDay(rs.getString("STARTDAY"));
				rp.setEndDay(rs.getString("ENDDAY"));
				rp.setTransport(rs.getString("TRANSPORT"));
				rp.setTheme(rs.getString("THEME"));
				rp.setApproval(rs.getString("APPROVAL"));
				rp.setRequestPay(rs.getString("REQUEST_PAY"));
				result.add(rp);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	
}
