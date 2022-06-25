package com.weather.controller;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

public class WeatherService {

	private WeatherDao wd = new WeatherDao();
	
	public List<WeatherRegion> selectWeatherRegion(String addressDo, String addressDogun) {
		
		Connection conn=getConnection();
		List<WeatherRegion> result=wd.selectWeatherRegion(conn, addressDo, addressDogun);
		close(conn);
		return result;
	}
}
