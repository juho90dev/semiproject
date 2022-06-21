package com.plannerMember.model.dao;

import static com.common.JDBCTemplate.close;

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
	
	
	public List<Member> plannerMember(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Member> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty(""));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
}
