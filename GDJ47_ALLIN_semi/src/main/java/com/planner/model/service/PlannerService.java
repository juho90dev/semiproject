package com.planner.model.service;

import java.sql.Connection;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import com.planner.model.dao.PlannerDao;
import com.planner.model.vo.Planner;
import com.planner.model.vo.PlannerLog;

import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.*;

public class PlannerService {

	private PlannerDao dao = new PlannerDao();


	//플래너 및 플랜 저장
	public int savePlanner(Planner planner, PlannerLog[][] plans) {
		
		Connection conn = getConnection();
		
		int res = 0;
		
		res = dao.savePlanner(planner,conn); //1. PLANNER테이블에, PLANNER정보 저장하기
		
		if(res>0) { //planner > DB저장을 성공했다면
			
			System.out.println("플래너 DB저장 완료!");
			int plannerNo = dao.selectPlannerNo(conn); //plannerNo 가져오기
			int result = 0;
			
			for (PlannerLog[] p : plans) {
				
				for (PlannerLog plan : p) {

					result = dao.savePlan(plan, conn, plannerNo);
					
					if(result>0) {
						System.out.println("플랜저장 완료!");
						commit(conn);
					} else rollback(conn);					
				}
			}
		
			commit(conn);

		} else {
			rollback(conn);
		}
		
		close(conn);
		return res;
	}

	public int selectPlannerNo() {
		
		Connection conn = getConnection();
		int plannerNo = dao.selectPlannerNo(conn);
		close(conn);
		return plannerNo;
	}

	public List<Planner> printList(String userId) { //MEMBER_ID를 기준으로, "PLANNER"의 LIST가져오기
		
		Connection conn = getConnection();
		List<Planner> list = dao.printList(conn,userId);
		close(conn);
		return list;
	}


	public List<PlannerLog> printPlans(String plannerNo) {
		
		Connection conn = getConnection();
		List<PlannerLog> plans = dao.printPlans(conn, plannerNo);
		close(conn);
		return plans;
	}

	public String selectTitle(String plannerNo) {
		
		Connection conn = getConnection();
		String title = dao.selectTitle(conn,plannerNo);
		close(conn);
		
		return title;
	}

//	public int removePlanners(List<String> planners) { //다수의 플래너 삭제
//		
//		Connection conn = getConnection();
//		int res = 0;
//		
//		for (String p : planners) {
//			
//			res = dao.removePlanners(conn, p);
//
//			if(res>0) {
//				commit(conn);
//			} else rollback(conn);
//			
//		}
//		
//		return res;
//	}

	public int removePlans(List<String> plans) {
		
		
		Connection conn = getConnection();
		int res = 0;

		for (String pNo : plans) {

			res = dao.removePlans(conn, pNo); // 1. 자식 테이블에서 삭제

			if (res > 0) {

				res = dao.removePlanners(conn, pNo); // 2. 부모 테이블에서 삭제

				if (res > 0) {

					commit(conn);

				} else {
					rollback(conn);
				}

			} else {
				rollback(conn);
			}

		}
		
		
		return res;
	}

}
