package com.chat.model.vo;

public class Alarm {
	
	private String memberId;
	private String planID;
	private String content;
	
	public Alarm() {
		// TODO Auto-generated constructor stub
	}

	public Alarm(String memberId, String planID, String content) {
		super();
		this.memberId = memberId;
		this.planID = planID;
		this.content = content;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPlanID() {
		return planID;
	}

	public void setPlanID(String planID) {
		this.planID = planID;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Alarm [memberId=" + memberId + ", planID=" + planID + ", content=" + content + "]";
	}
	
	
	
}
