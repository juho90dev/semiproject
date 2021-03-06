package com.admin.model.dao;

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

public class adminDao {
	
	private Properties prop=new Properties();

	
	public adminDao() {
		String path=adminDao.class.getResource("/sql/admin_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}


	public List<Member> selectMemberList(Connection conn, int cPage, int  numPerpage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Member> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMemberList"));
			pstmt.setInt(1, (cPage-1)* numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(LoginDao.getLogin(rs));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	
	
//	public List<Member> selectMemberList(Connection conn) {
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		List<Member> list=new ArrayList();
//		try {
//			pstmt=conn.prepareStatement(prop.getProperty("selectMemberList"));
//			rs=pstmt.executeQuery();
//			while(rs.next()) {
//				list.add(LoginDao.getLogin(rs));
//			}
//			
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//		}return list;
//	}
	
	
	
	
	
	
	
	
	public int deleteMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteMember"));
			pstmt.setString(1, m.getUserId());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}


	public int updateGrade(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateGrade"));
			pstmt.setString(1, m.getUserId());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}


	public List<Member> selectPlannerList(Connection conn, int cPage, int  numPerpage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Member> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectPlannerList"));
			pstmt.setInt(1, (cPage-1)* numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(LoginDao.getLogin(rs));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}


	public List<Member> selectNormalList(Connection conn, int cPage, int  numPerpage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Member> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectNormalList"));
			pstmt.setInt(1, (cPage-1)* numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(LoginDao.getLogin(rs));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}


	public int downGrade(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("downGrade"));
			pstmt.setString(1, m.getUserId());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}


	public int selectMemberCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
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


	public List<Member> searchMemberList(Connection conn, String type, String keyword, int cPage, int numPerpage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Member> result=new ArrayList();
		String sql=prop.getProperty("searchMember");
		sql=sql.replace("$COL", type);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, type.equals("MEMBER_ID")||type.equals("email")?"%"+keyword+"%":keyword);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(LoginDao.getLogin(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}


	public int searchMemberCount(Connection conn, String type, String keyword) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("searchMemberCount").replace("$COL",type);
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, type.equals("MEMBER_ID")||type.equals("email")?"%"+keyword+"%":keyword);
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

