package com.weather.controller;

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

import com.request.model.dao.RequestDao;

public class WeatherDao {
	
	private Properties prop=new Properties();
	
	public WeatherDao() {
		String path=RequestDao.class.getResource("/sql/Weather_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<WeatherRegion> selectWeatherRegion(Connection conn, String addressDo, String addressDogun) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		List<WeatherRegion> result = new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectWeatherRegion"));
			pstmt.setString(1, addressDo);
			pstmt.setString(2, addressDogun);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				WeatherRegion wr = new WeatherRegion();
				wr.setAddressDo(addressDo);
				wr.setAddressDogun(addressDogun);
				wr.setNx(rs.getInt("NX"));
				System.out.println(wr.getNx());
				wr.setNy(rs.getInt("NY"));
				result.add(wr);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
}
