package com.admin.model.service;

import com.login.model.vo.Member;
import static com.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.List;

import com.admin.model.dao.adminDao;
import com.login.model.vo.Member;

public class adminService {
	
	private adminDao dao=new adminDao();

//	public List<Member> selectMemberList() {
//		Connection conn=getConnection();
//		List<Member> result=dao.selectMemberList(conn);
//		close(conn);
//		return result;
//	}
	
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

	public List<Member> selectPlannerList() {
		Connection conn=getConnection();
		List<Member> result=dao.selectPlannerList(conn);
		close(conn);
		return result;
	}

	public List<Member> selectNormalList() {
		Connection conn=getConnection();
		List<Member> result=dao.selectNormalList(conn);
		close(conn);
		return result;
	}

	public int downGrade(Member m) {
		Connection conn=getConnection();
		int result=dao.downGrade(conn, m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public List<Member> selectMemberList(int cPage ,int numPerpage) {
		Connection conn=getConnection();
		List<Member> result=dao.selectMemberList(conn,cPage, numPerpage);
		close(conn);
		return result;
	}

	public int selectMemberCount() {
		Connection conn=getConnection();
		int result=dao.selectMemberCount(conn);
		close(conn);
		return result;
	}

	public List<Member> searchMemberList(String type, String keyword, int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<Member> result=dao.searchMemberList(conn,type,keyword,cPage,numPerpage);
		close(conn);
		return result;
	}

	public int searchMemberCount(String type, String keyword) {
		Connection conn=getConnection();
		int result=dao.searchMemberCount(conn,type,keyword);
		close(conn);
		return result;
	}
	
//	public List<Member> selectMemberList() {
//		Connection conn=getConnection();
//		List<Member> result=dao.selectMemberList(conn);
//		close(conn);
//		return result;
//
//	}

	
}
