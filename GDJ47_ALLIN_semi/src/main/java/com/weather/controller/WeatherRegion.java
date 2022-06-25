package com.weather.controller;

import lombok.Data;

@Data
public class WeatherRegion {
	
	private String addressDo;
	private String addressDogun;
	private int nx;
	private int ny;
	
	
	public WeatherRegion() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public WeatherRegion(String addressDo, String addressDogun, int nx, int ny) {
		super();
		this.addressDo = addressDo;
		this.addressDogun = addressDogun;
		this.nx = nx;
		this.ny = ny;
	}

	
	
	
}
