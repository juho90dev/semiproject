package com.search.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.search.model.dao.SearchDao;
import com.search.model.vo.Search;


public class SearchService {
	
private SearchDao dao=new SearchDao();
	
	public List<Search> search(String cat1, String cat2,int areacode, int sigungucode) {
		Connection conn=getConnection();
		List<Search> s=dao.searchService(conn,cat1,cat2, areacode, sigungucode);
		
		close(conn);
		return s;
	}
}
