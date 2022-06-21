package com.admin.model.service;

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
	
	public int DeleteMember(Member m) {
		Connection conn=getConnection();
		int result=dao.deleteMember(conn, m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int updateGrade(Member m) {
		Connection conn=getConnection();
		int result=dao.updateGrade(conn, m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
}
