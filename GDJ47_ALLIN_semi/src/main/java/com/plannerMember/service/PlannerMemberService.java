package com.plannerMember.service;

import static com.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.login.model.vo.Member;
import com.plannerMember.model.dao.PlannerMemberDao;

public class PlannerMemberService {

	private PlannerMemberDao dao = new PlannerMemberDao();
	
	public List<Member> plannerMember(){
		Connection conn = getConnection();
		List<Member> result = dao.plannerMember(conn);
		close(conn);
		return result;
	}
}