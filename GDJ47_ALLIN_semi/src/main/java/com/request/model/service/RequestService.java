package com.request.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;

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
}
