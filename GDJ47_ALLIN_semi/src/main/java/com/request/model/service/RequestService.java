package com.request.model.service;

import static com.common.JDBCTemplate.*;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.request.model.dao.RequestDao;
import com.request.model.vo.RequestPlan;

public class RequestService {

	private RequestDao dao = new RequestDao();
	
	public int insertRequest(RequestPlan rp) {
		Connection conn=getConnection();
		int result=dao.insertRequest(conn,rp);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	public List<RequestPlan> selectRequestList(String plannerId) {
		
		Connection conn=getConnection();
		List<RequestPlan> result=dao.selectRequestList(conn, plannerId);
		close(conn);
		return result;
	}
	
	public int acceptUpdate(int orderNum) {
		Connection conn = getConnection();
		int result=dao.acceptUpdate(conn, orderNum);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int updatePay(int orderNum) {
		Connection conn = getConnection();
		int result=dao.updatePay(conn, orderNum);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int deleteRequest(int orderNum) {
		Connection conn = getConnection();
		int result=dao.deleteRequest(conn, orderNum);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<RequestPlan> selectOrderList(String memberId) {
		
		Connection conn=getConnection();
		List<RequestPlan> result=dao.selectOrderList(conn, memberId);
		close(conn);
		return result;
	}
	
}
