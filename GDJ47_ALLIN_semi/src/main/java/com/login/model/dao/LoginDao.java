package com.login.model.dao;


import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.login.model.vo.Member;


public class LoginDao {
	private Properties prop=new Properties();
	
	public LoginDao() {
		String path=LoginDao.class.getResource("/sql/login_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
		
	

		
	
	
		public int insertLogin(Connection conn, Member l) {
			PreparedStatement pstmt=null;
			int result=0;
			try {
				pstmt=conn.prepareStatement(prop.getProperty("insertMember"));
				pstmt.setString(1, l.getUserId());
				pstmt.setString(2, l.getEmail());
				pstmt.setString(3, l.getPassword());
				pstmt.setString(4, l.getPhone());
				pstmt.setString(5, l.getCity());
				pstmt.setString(6, l.getCountry());
				
				result=pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}return result;
		}


		public Member selectLoginId(Connection conn, String userId) {
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			Member l=null;
			try {
				pstmt=conn.prepareStatement(prop.getProperty("selectMemberId"));
				pstmt.setString(1, userId);
				rs=pstmt.executeQuery();
				if(rs.next()) l=getLogin(rs);
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return l;
		}
		
		
		
//		public Login selectLoginEmail(Connection conn, String email) {
//			PreparedStatement pstmt=null;
//			ResultSet rs=null;
//			Login l=null;
//			try {
//				pstmt=conn.prepareStatement(prop.getProperty("selectMemberEmail"));
//				pstmt.setString(1, email);
//				rs=pstmt.executeQuery();
//				if(rs.next()) l=getLogin(rs);
//			}catch(SQLException e) {
//				e.printStackTrace();
//			}finally {
//				close(rs);
//				close(pstmt);
//			}return l;
//		}
		
		
		public String selectLoginEmail(Connection conn, String email) {
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String id=null;
			try {
				pstmt=conn.prepareStatement(prop.getProperty("findMemberId"));
				pstmt.setString(1, email);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					id=rs.getString("member_ID");
				} 
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return id;
		}
		
		
		
		
		
		
		
		public static Member getLogin(ResultSet rs) {
			Member l=null;
			try {
				l=new Member();
				l.setUserId(rs.getString("member_ID"));
				l.setPassword(rs.getString("member_PWD"));
				l.setEmail(rs.getString("email"));
				l.setEnrollDate(rs.getDate("enroll_Date"));
				l.setIntroduce(rs.getString("introduce"));
				l.setGrade(rs.getString("grade"));
				l.setCity(rs.getString("city"));
				l.setCountry(rs.getString("country"));
				l.setPhone(rs.getString("phone"));
				l.setImage(rs.getString("image"));
				l.setAvgscore(rs.getInt("avgscore"));
				l.setPay(rs.getString("pay"));
				
			}catch(SQLException e) {
				e.printStackTrace();
			}
			return l;
		}  






		public Member searchLogin(Connection conn, String userId, String password) {
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			Member l=null;
			try {
				pstmt=conn.prepareStatement(prop.getProperty("selectMember"));
				pstmt.setString(1, userId);
				pstmt.setString(2, password);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					l=getLogin(rs);
				}
				
			}catch(SQLException e) {
				e.printStackTrace();
				
			}finally {
				close(rs);
				close(pstmt);
			}
			return l;
		}






		public int checkLoginId(Connection conn, String userId) {
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int idCheck=0;
			try {
				
				pstmt=conn.prepareStatement(prop.getProperty("selectMemberId"));
				pstmt.setString(1, userId);
				rs=pstmt.executeQuery();
				if(rs.next()|| userId.equals("")) {
					idCheck=0;
				}else {
					idCheck=1;
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return idCheck;
		}

		
		
		public int checkPwd(Connection conn, String userPwd) {
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int pwdCheck=0;
			try {
				
				pstmt=conn.prepareStatement(prop.getProperty("selectMemberPwd"));
				pstmt.setString(1, userPwd);
				rs=pstmt.executeQuery();
				if(rs.next()|| userPwd.equals("")) {
					pwdCheck=0;
				}else {
					pwdCheck=1;
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return pwdCheck;
		}
		
		
		
		
		





		public int checkLoginEmail(Connection conn, String email) {
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int emailCheck=0;
			try {
				
				pstmt=conn.prepareStatement(prop.getProperty("selectMemberEmail"));
				pstmt.setString(1, email);
				rs=pstmt.executeQuery();
				if(rs.next()|| email.equals("")) {
					emailCheck=0;
				}else {
					emailCheck=1;
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return emailCheck;
		}






		public int updateMember(Connection conn, Member m) {
			PreparedStatement pstmt=null;
			int result=0;
			try {
				pstmt=conn.prepareStatement(prop.getProperty("updateMember"));
				pstmt.setString(1, m.getPhone());
				pstmt.setString(2, m.getCity());
				pstmt.setString(3, m.getCountry());
				pstmt.setString(4, m.getIntroduce());
				pstmt.setString(5, m.getImage());
				pstmt.setString(6, m.getUserId());
				result=pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}return result;
			
		}






		public int updateMemberr(Connection conn, Member m) {
			PreparedStatement pstmt=null;
			int result=0;
			try {
				pstmt=conn.prepareStatement(prop.getProperty("updateMemberr"));
				pstmt.setString(1, m.getPhone());
				pstmt.setString(2, m.getCity());
				pstmt.setString(3, m.getCountry());
				pstmt.setString(4, m.getUserId());
				result=pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}return result;
		}






		public int updatePay(Connection conn, Member m) {
			PreparedStatement pstmt=null;
			int result=0;
			try {
				pstmt=conn.prepareStatement(prop.getProperty("updatePay"));
				pstmt.setString(1, m.getUserId());
				result=pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}return result;
		}






		public int updatePassword(Connection conn, String userId, String newPw) {
			PreparedStatement pstmt=null;
			int result=0;
			try {
				pstmt=conn.prepareStatement(prop.getProperty("updatePassword"));
				pstmt.setString(1,newPw);
				pstmt.setString(2, userId);
				result=pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}return result;
		}















		
	
		
		
	
	
	
}
