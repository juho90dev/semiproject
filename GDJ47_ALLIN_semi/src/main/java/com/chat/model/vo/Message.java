package com.chat.model.vo;

public class Message {
	private String type;
	private String sender;
	private String receiver;
	private String msg;
	private String room;
	
	public Message() {
		// TODO Auto-generated constructor stub
	}
	
	

	public Message(String type, String sender, String receiver, String msg, String room) {
		super();
		this.type = type;
		this.sender = sender;
		this.receiver = receiver;
		this.msg = msg;
		this.room = room;
	}



	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}



	@Override
	public String toString() {
		return "Message [type=" + type + ", sender=" + sender + ", receiver=" + receiver + ", msg=" + msg + ", room="
				+ room + "]";
	}
	
	

}
