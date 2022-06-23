package com.board.model.vo;

import java.sql.Date;

public class Board {
	
	private int boardNo;
	private String userId;
	private String plannerId;
	private String title;
	private String content;
	private Date enrollDate;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(int boardNo, String userId, String plannerId, String title, String content, Date enrollDate) {
		super();
		this.boardNo = boardNo;
		this.userId = userId;
		this.plannerId = plannerId;
		this.title = title;
		this.content = content;
		this.enrollDate = enrollDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPlannerId() {
		return plannerId;
	}

	public void setPlannerId(String plannerId) {
		this.plannerId = plannerId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", userId=" + userId + ", plannerId=" + plannerId + ", title=" + title
				+ ", content=" + content + ", enrollDate=" + enrollDate + "]";
	}
	
}
	
	

	