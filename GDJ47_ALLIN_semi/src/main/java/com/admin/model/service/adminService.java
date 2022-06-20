package com.admin.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;
import com.login.model.vo.Member;
import static com.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.List;

import com.admin.model.dao.adminDao;
import com.login.model.vo.Member;

public class adminService {
	
	private adminDao dao=new adminDao();

	public List<Member> selectMemberList() {
		Connection conn=getConnection();
		List<Member> result=dao.selectMemberList(conn);
		close(conn);
		return result;
	}
	
	
	
	
	
}
