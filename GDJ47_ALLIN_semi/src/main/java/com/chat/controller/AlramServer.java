package com.chat.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.EndpointConfig;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

@ServerEndpoint("/alram")
public class AlramServer {
	
	private static Set<String> rooms=new HashSet();
	
	@OnOpen
	public void open(Session session, EndpointConfig config) {
		System.out.println("open"+rooms);
		try {
			session.getBasicRemote().sendText("room@"+new Gson().toJson(rooms));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@OnMessage
	public void message(Session session, String msg) {
		System.out.println("message"+rooms);
		String[] data=msg.split("@");
		switch(data[0]) {
			case "room" : addRoom(session,data[1]);break;
		}
		
	}
	private void addRoom(Session session,String roomName) {
		System.out.println(rooms);	
		rooms.add(roomName);
		System.out.println("after "+rooms);
		for(Session client : session.getOpenSessions()) {
			try {
				client.getBasicRemote().sendText("room@"+new Gson().toJson(rooms));
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
}
