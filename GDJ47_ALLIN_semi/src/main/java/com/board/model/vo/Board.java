package com.board.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Board {
	
	private int boardNum;
	private String memberId;
	private String plannerId;
	private String title;
	private String content;
	private Date boardDate;
	
	

	
	
}