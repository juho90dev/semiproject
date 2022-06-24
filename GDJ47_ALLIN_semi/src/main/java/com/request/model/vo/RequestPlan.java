package com.request.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class RequestPlan {
	
	private int orderNum;
	private String memberId;
	private String plannerId;
	private String content;
	private String startDay;
	private String endDay;
	private String transport;
	private String theme;
	private String approval;
	private String requestPay;
	
	
	
	public RequestPlan(int orderNum, String memberId, String plannerId, String content, String startDay, String endDay,
			String transport, String theme, String approval, String requestPay) {
		super();
		this.orderNum = orderNum;
		this.memberId = memberId;
		this.plannerId = plannerId;
		this.content = content;
		this.startDay = startDay;
		this.endDay = endDay;
		this.transport = transport;
		this.theme = theme;
		this.approval = approval;
		this.requestPay = requestPay;
	}



	public RequestPlan() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
