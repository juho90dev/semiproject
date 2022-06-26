package com.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import static com.common.JDBCTemplate.*;
import com.board.model.vo.Board;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		String path = BoardDao.class.getResource("/sql/board_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Board> selectBoardList(Connection conn,String id, int cPage, int numPerpage){
		PreparedStatement pstmt = null;
		List<Board> result  = new ArrayList();
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectBoardList"));
			pstmt.setString(1, id);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(getBoard(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	public int insertBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertBoard"));
			pstmt.setString(1, b.getMemberId());
			pstmt.setString(2, b.getPlannerId());
			pstmt.setString(3, b.getTitle());
			pstmt.setString(4, b.getContent());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int selectBoardCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectBoardCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) result = rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	
	public List<Board> contentBoard(Connection conn, int no){
		PreparedStatement pstmt = null;
		List<Board> result  = new ArrayList();
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("contentBoard"));
			pstmt.setInt(1, no);

			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(getBoard(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	private Board getBoard(ResultSet rs) throws SQLException{
		return Board.builder()
				.boardNum(rs.getInt("board_num"))
				.memberId(rs.getString("member_id"))
				.plannerId(rs.getString("Planner_Id"))
				.title(rs.getString("title"))
				.content(rs.getString("content"))
				.boardDate(rs.getDate("Board_date"))
				.build();
	}

}
