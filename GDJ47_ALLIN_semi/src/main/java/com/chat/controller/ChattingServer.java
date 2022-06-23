package com.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.websocket.EncodeException;
import javax.websocket.EndpointConfig;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.chat.model.vo.Message;

@ServerEndpoint(value="/chatting",
		encoders= {MessageEncoder.class},
		decoders= {MessageDecoder.class})
public class ChattingServer {
	
	private class User{
		Session session;
		String key;
	}
	
//	private static List<User> sessionUsers = Collections.synchronizedList(new ArrayList<>());
//	private static User getUser(Session session) {
//		return searchUser(x -> s.session == session);
//	}
//	private static User getUser(String key) {
//		return searchUser(x -> x.key.equals(key));
//	}
//	
//	private static User searchUser(SearchExpression func) {
//		Optional<User> op = sessionUsers.stream().filter(x -> func.expression(x).findFirst());
//	
//	if (op.isPresent()) {
//		return op.get();
//	}
//	return null;
//	}
	
	
	@OnOpen
	public void accessClient(Session session, EndpointConfig config) {
		System.out.println("클라이언트 접속");
		System.out.println(session.getId());
//		sessionList.add(session);

		//Thread t = new Thread();
		try {
//			t.sleep(3000);			
			session.getBasicRemote().sendText("admin,채팅방에 접속하였습니다");
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	@OnMessage
	public void message(Session session, Message msg) {
		session.getUserProperties().put("msg", msg);
		Set<Session> clients = session.getOpenSessions();
		System.out.println("현재 접속자 수 : " + clients.size());
		
		try{
			for(Session client : clients) {
				Message cm=(Message)client.getUserProperties().get("msg");
				if(msg.getRoom().equals(cm.getRoom())) {
//				client.getBasicRemote().sendText(msg);
					client.getBasicRemote().sendObject(msg);
				}
			}
//			session.getBasicRemote().sendText(msg);
		}catch(IOException | EncodeException | NullPointerException e) {
			e.printStackTrace();
		}
	} 

}
