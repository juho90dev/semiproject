package com.plannerMember.model.dao;


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


import com.login.model.dao.LoginDao;
import com.login.model.vo.Member;

public class PlannerMemberDao {
	
	private Properties prop=new Properties();
	
	public PlannerMemberDao() {
		String path=PlannerMemberDao.class.getResource("/sql/PlannerMember_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
//	public List<Member> plannerMember(Connection conn, String grade) {
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		List<Member> result = new ArrayList();
//		try {
//			pstmt=conn.prepareStatement(prop.getProperty("selectPlannerMember"));
//			pstmt.setString(1, grade);
//			rs=pstmt.executeQuery();
//			while(rs.next()) {
////				Member m = new Member();
////				m.setUserId(rs.getString("MEMBER_ID"));
////				m.setImage(rs.getString("IMAGE"));
////				result.add(m);
//				result.add(LoginDao.getLogin(rs));
//			}
//			
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//		}return result;
//	}
	
	
	public List<Member> selectPlannerMemberList(Connection conn,String grade, int cPage, int numPerpage) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		List<Member> list = new ArrayList();
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectMemberList"));
			pstmt.setString(1, grade);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
//				Member m = MemberDao.getMember(rs);
//				list.add(m);
				list.add(LoginDao.getLogin(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int selectPlannerMemberCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMemberCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	
	
	
}
