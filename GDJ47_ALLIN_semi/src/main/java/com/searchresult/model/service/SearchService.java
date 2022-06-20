package com.searchresult.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.searchresult.model.dao.SearchDao;
import com.searchresult.model.vo.Search;


public class SearchService {
	
private SearchDao dao=new SearchDao();
	
	public Search searchMember(String firstImage, String title) {
		Connection conn=getConnection();
		Search s=dao.SearchService(conn,firstImage,title);
		close(conn);
		return s;
	}
}
