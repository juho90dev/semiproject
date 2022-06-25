package com.search.model.dao;

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

import com.search.model.vo.Search;

public class SearchDao {

	private Properties prop = new Properties();

	public SearchDao() {
		String path = SearchDao.class.getResource("/sql/search_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}



	public List<Search> searchService(Connection conn, String cat1, String cat2,  int areacode, int sigungucode) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Search s = null;
		List<Search> result = new ArrayList(); //  새로운 배열 리스트 객체 생성 // DB의 row을 저장하는 것
		try {
			pstmt=conn.prepareStatement(prop.getProperty("SearchSelect"));
			
			pstmt.setString(1, cat1);
			pstmt.setString(2, cat2);
			pstmt.setInt(3, areacode);
			pstmt.setInt(4, sigungucode);
			rs = pstmt.executeQuery(); //DB Select문에서 결과값을 반환할 때 사용(executeQuery)
			
			while(rs.next()){
				s = getSearch(rs);
				result.add(s);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		return result;

	}
	
	
	public static Search getSearch(ResultSet rs) {
		Search s=null;
		try {
			s = new Search();// 만들어야지 오류 해결 - 럼복 적용x해서 해보기
			s.setAddress(rs.getString("address"));
			s.setAreacode(rs.getInt("areacode"));
			s.setSigungucode(rs.getInt("sigungucode"));
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