package com.choa.chat;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.PongMessage;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.choa.member.MemberDTO;
import com.choa.room.roomuser.RoomUserDTO;

@Repository
public class EchoHandler extends TextWebSocketHandler{

	//세션을 모두 저장한다.
	//방법 1 :  1:1 채팅
	//    private Map<String, WebSocketSession> sessions = new HashMap<String, WebSocketSession>();

	//방법 2 : 전체 채팅
	private List<List<WebSocketSession>> sessionList;	
	private List<RoomUserDTO> roomUserlist;
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	private String id;
		
	public void setId(String id) {
		this.id = id;
	}

	//user room세팅
	public void setRoomUserDTO(List<RoomUserDTO> list){
		this.roomUserlist=list;
	}
	
	public void setRoomCount(int count){
		for(int i=0;i<count;i++){
			List<WebSocketSession> sessionroom = new ArrayList<WebSocketSession>();
			sessionList.add(sessionroom);
		}
	}


	/**
	 * 클라이언트 연결 이후에 실행되는 메소드
	 */	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session)
			throws Exception {
		//맵을 쓸때 방법
		//        sessions.put(session.getId(), session);
		//List쓸때 방법
		for(int i=0;i<sessionList.size();i++){
			String str[]=roomUserlist.get(i).getUser_array().split("/");
			for(int j=0;j<str.length;j++){
				if(this.id.equals(str[j])){
				sessionList.get(i).add(session);
				//0번째 중괄호에 session.getId()을 넣으라는뜻		
				logger.info("{} 연결됨1", session.getId()); 
				}
			}	
		}
	}
	/**
	 * 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행되는 메소드
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session,
			TextMessage message) throws Exception {
		if(this.room_num.equals("1")){
		//0번째에 session.getId() 1번째에 message.getPayload() 넣음
		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		//    logger.info("{}로부터 {}받음", new String[]{session.getId(),message.getPayload()});

		//연결된 모든 클라이언트에게 메시지 전송 : 리스트 방법
		for(WebSocketSession sess : sessionList1){
			sess.sendMessage(new TextMessage(session.getId()+" : " + message.getPayload()));
		}		

		// 맵 방법.
		/*Iterator<String> sessionIds = sessions.ketSet().iterator();
        String sessionId = "";
        while (sessionIds.hasNext()) {
            sessionId = sessionIds.next();
            sessions.get(sessionId).sendMessage(new TextMessage("echo:" + message.getPayload()));

        }*/

		//연결되어 있는 모든 클라이언트들에게 메시지를 전송한다.
		//session.sendMessage(new TextMessage("echo:" + message.getPayload()));
	}

	/**
	 * 클라이언트 연결을 끊었을 때 실행되는 메소드
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		if(this.room_num.equals("1")){
		//List 삭제
		sessionList1.remove(session);

		//Map 삭제
		//sessions.remove(session.getId());

		logger.info("{} 연결 끊김.", session.getId());
		}
	}	
}

/*@Repository
public class EchoHandler extends TextWebSocketHandler{

	//세션을 모두 저장한다.
	//방법 1 :  1:1 채팅
	//private Map<String, WebSocketSession> sessions = new HashMap<String, WebSocketSession>();
	private Map<String,HashMap<String,WebSocketSession>> sessions;
	//방법 2 : 전체 채팅
	//private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	//private List<WebSocketSession> sessionList2 = new ArrayList<WebSocketSession>();
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	private String id;
	private String room_num="0";
	
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getRoom_num() {
		return room_num;
	}


	public void setRoom_num(String room_num) {
		this.room_num = room_num;
	}
	public void roomsetting(String[] str,WebSocketSession session) {
		//clientMap = new HashMap<String,DataOutputStream>(); //클라이언트의 출력스트림을 저장할 해쉬맵 생성.
       // Collections.synchronizedMap(sessions); //해쉬맵 동기화 설정.
        
        HashMap<String,WebSocketSession> room;
        
        for(int i=0;i<str.length;i++){
        room= new HashMap<String, WebSocketSession>();
        Collections.synchronizedMap(room); //해쉬맵 동기화 설정.       
        sessions.put(str[i],(HashMap<String, WebSocketSession>) session);
        }
		
	} 

	*//**
	 * 클라이언트 연결 이후에 실행되는 메소드
	 *//*	
	
	@SuppressWarnings("unchecked")
	@Override
	public void afterConnectionEstablished(WebSocketSession session)
			throws Exception {		
		//맵을 쓸때 방법
		sessions.put("a", (HashMap<String, WebSocketSession>) session);
		
	}
	*//**
	 * 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행되는 메소드
	 *//*
	@Override
	protected void handleTextMessage(WebSocketSession session,
			TextMessage message) throws Exception {
		// 맵 방법.
		Iterator<String> sessionIds = sessions.keySet().iterator();
        String sessionId = "";
        while (sessionIds.hasNext()) {
            sessionId = sessionIds.next();
            ((WebSocketSession) sessions.get(sessionId)).sendMessage(new TextMessage("echo:" + message.getPayload()));

        }

		//연결되어 있는 모든 클라이언트들에게 메시지를 전송한다.
		//session.sendMessage(new TextMessage("echo:" + message.getPayload()));
	}

	*//**
	 * 클라이언트 연결을 끊었을 때 실행되는 메소드
	 *//*
	@Override
	public void afterConnectionClosed(WebSocketSession session,
			CloseStatus status) throws Exception {
		if(this.room_num.equals("1")){
		//List 삭제
		//sessionList2.remove(session);

		//Map 삭제
		sessions.remove(session.getId());

		logger.info("{} 연결 끊김.", session.getId());
		}else{
			//List 삭제
			//sessionList.remove(session);

			//Map 삭제
			sessions.remove(session.getId());

			logger.info("{} 연결 끊김.", session.getId());
		}
	}



	
	
		
}*/

