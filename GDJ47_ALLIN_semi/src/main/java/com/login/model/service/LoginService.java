package com.login.model.service;

import static com.common.JDBCTemplate.close;

import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;
import static com.common.JDBCTemplate.*;

import java.sql.Connection;

import com.login.model.dao.LoginDao;
import com.login.model.vo.Member;

public class LoginService {
	
	private LoginDao dao=new LoginDao();
	
	

	public int insertLogin(Member l) {
		// TODO Auto-generated method stub
		Connection conn=getConnection();
		int result=dao.insertLogin(conn,l);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public Member selectLoginId(String userId) {
		Connection conn=getConnection();
		Member l=dao.selectLoginId(conn,userId);
		close(conn);
		return l;
	}

	public String selectLoginEmail(String email) {
		Connection conn=getConnection();
		String id=dao.selectLoginEmail(conn,email);
		close(conn);
		return id;
	}

	public Member searchLogin(String userId, String password) {
		Connection conn=getConnection();//db연결
		Member l=dao.searchLogin(conn, userId, password);
		close(conn);
		return l;
	}

	public int checkLoginId(String userId) {
		Connection conn=getConnection();
		int idCheck=dao.checkLoginId(conn,userId);
		close(conn);
		return idCheck;
	}

	public int checkLoginEmail(String email) {
		Connection conn=getConnection();
		int emailCheck=dao.checkLoginEmail(conn,email);
		close(conn);
		return emailCheck;
	}

	public int updateMember(Member m) {
		Connection conn=getConnection();
		int result=dao.updateMember(conn, m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int updateMemberr(Member m) {
		Connection conn=getConnection();
		int result=dao.updateMemberr(conn, m);
		if(result>0) commit(conn);
		else rollback(conn);
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


	

}
