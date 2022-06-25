package com.board.model.service;


import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.board.model.dao.BoardDao;
import com.board.model.vo.Board;



public class BoardService {
	
	private BoardDao dao = new BoardDao();
	
	public List<Board> selectBoardList(int cPage, int numPerpage){
		Connection conn = getConnection();
		List<Board> result = dao.selectBoardList(conn, cPage,numPerpage);
		close(conn);
		return result;
	}
	public int insertBoard(Board b) {
		Connection conn = getConnection();
		int result = dao.insertBoard(conn, b);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
	public int selectBoardCount() {
		Connection conn = getConnection();
		int result = dao.selectBoardCount(conn);
		close(conn);
		return result;
	}
	
}
