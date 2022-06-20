package com.searchresult.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.searchresult.model.vo.Search;

public class SearchDao {

	private Properties prop = new Properties();

	public SearchDao() {
		String path = SearchDao.class.getResource("/sql/board_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}



	public Search SearchService(Connection conn, String FirstImage, String Title) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Search s = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectSearch"));
			pstmt.setString(1, FirstImage);
			pstmt.setString(2, Title);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				s = getSearch(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return s;

	}
	
	
	public static Search getSearch(ResultSet rs) {
		Search s=null;
		try {
			s = new Search();// 만들어야지 오류 해결 - 럼복 적용x해서 해보기
			s.setAddress(rs.getString("address"));
			s.setAreaCode(rs.getInt("areaCode"));
			s.setSigunguCode(rs.getInt("sigunguCode"));
			s.setCat1(rs.getString("cat1"));
			s.setCat2(rs.getString("cat2"));
			s.setContentId(rs.getString("contentId"));
			s.setContentTypeId(rs.getString("contentTypeId"));
			s.setFirstImage(rs.getString("firstImage"));
			s.setMapx(rs.getString("mapx"));
			s.setMapy(rs.getString("mapy"));
			s.setTitle(rs.getString("title"));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return s;
	}



}