package com.planner.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.planner.model.vo.Planner;
import com.planner.model.vo.PlannerLog;

public class PlannerDao {
	
	private Properties prop = new Properties();
	
	public PlannerDao(){
		
		String path = PlannerDao.class.getResource("/sql/planner_sql.properties").getPath();
		
		try {
			
			prop.load(new FileReader(path));
			
		} catch (IOException e){
			e.printStackTrace();
		}
		
	}

	
	public int savePlanner(Planner planner, Connection conn) { //PLANNER테이블 저장
		
		PreparedStatement pstmt = null;
		int res = 0;
		
		
		try {
			
			pstmt = conn.prepareStatement(prop.getProperty("savePlanner"));
			
			pstmt.setString(1, planner.getUserId());
			pstmt.setString(2, planner.getPlannerTitle());
			pstmt.setInt(3, planner.getTravelDays());
			pstmt.setString(4, planner.getImages());
			pstmt.setString(5,planner.getTheme());
			pstmt.setInt(6, planner.getAreacode());
			pstmt.setInt(7, planner.getSigungucode());
			pstmt.setInt(8, planner.getScore());
			
			res = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return res;
	}
	
	
	public int savePlan(PlannerLog p, Connection conn, int plannerNo) { //PLAN테이블 저장 메소드

		PreparedStatement pstmt = null;
		int res = 0;
		
		try {
			
			pstmt = conn.prepareStatement(prop.getProperty("savePlan"));
			pstmt.setString(1, "PLAN"+plannerNo);
			pstmt.setString(2, p.getDay());
			pstmt.setString(3, p.getLatitude());
			pstmt.setString(4, p.getLongitude());
			pstmt.setString(5, p.getMemo());
			pstmt.setString(6, p.getPlaceName());
			
			res = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return res;
	}


	public int selectPlannerNo(Connection conn) {

		int plannerNo=0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		
			pstmt = conn.prepareStatement(prop.getProperty("selectPlannerNo"));
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				plannerNo = rs.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return plannerNo;
	}


	public List<Planner> printList(Connection conn, String userId) {
		
		List<Planner> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			pstmt = conn.prepareStatement(prop.getProperty("selectPlannerList"));
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				Planner p = Planner.builder()
							.plannerNo(rs.getString("planner_no"))
							.userId(rs.getString("member_id"))
							.plannerTitle(rs.getString("planner_title"))
							.travelDays(rs.getInt("travel_days"))
							.writtenDate(rs.getDate("written_date"))
							.images(rs.getString("images"))
							.theme(rs.getString("theme"))
							.areacode(rs.getInt("areacode"))
							.sigungucode(rs.getInt("sigungucode"))
							.score(rs.getInt("score"))
							.build();

				list.add(p);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
	}


	public List<PlannerLog> printPlans(Connection conn, String plannerNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<PlannerLog> list = new ArrayList();
		
		try {
			
			pstmt = conn.prepareStatement(prop.getProperty("selectPlans"));
			pstmt.setString(1, plannerNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				PlannerLog p = PlannerLog.builder()
						       .planCode(rs.getString("plan_code"))
						       .plannerNo(rs.getString("planner_no"))
						       .day(rs.getString("day"))
						       .latitude(rs.getString("latitude"))
						       .longitude(rs.getString("longitude"))
						       .memo(rs.getString("memo"))
						       .placeName(rs.getString("place_name"))
						       .build();
				
				list.add(p);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
	}


}
