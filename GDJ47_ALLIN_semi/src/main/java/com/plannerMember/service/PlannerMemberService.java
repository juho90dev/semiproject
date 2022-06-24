package com.plannerMember.service;


import static com.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.login.model.vo.Member;
import com.plannerMember.model.dao.PlannerMemberDao;

public class PlannerMemberService {

	private PlannerMemberDao dao = new PlannerMemberDao();
	
//	public List<Member> plannerMember(String grade){
//		Connection conn = getConnection();
//		List<Member> result = dao.plannerMember(conn, grade);
//		close(conn);
//		return result;
//	}
	
	public List<Member> selectPlannerMemberList(String grade, int cPage, int numPerpage) {
		Connection conn = getConnection();
		List<Member> result = dao.selectPlannerMemberList(conn, grade, cPage, numPerpage);
		close(conn);
		return result;
	}
	
	public int selectPlannerMemberCount() {
		Connection conn = getConnection();
		int result = dao.selectPlannerMemberCount(conn);
		close(conn);
		return result;
	}
}
