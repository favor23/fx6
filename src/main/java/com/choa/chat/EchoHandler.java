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

@Repository
public class EchoHandler extends TextWebSocketHandler{

	//세션을 모두 저장한다.
	//방법 1 :  1:1 채팅
	//    private Map<String, WebSocketSession> sessions = new HashMap<String, WebSocketSession>();

	//방법 2 : 전체 채팅
	private List<WebSocketSession> sessionList1 = new ArrayList<WebSocketSession>();
	private List<WebSocketSession> sessionList2 = new ArrayList<WebSocketSession>();
	private List<WebSocketSession> sessionList3 = new ArrayList<WebSocketSession>();
	private List<WebSocketSession> sessionList4 = new ArrayList<WebSocketSession>();
	private List<WebSocketSession> sessionList5 = new ArrayList<WebSocketSession>();
	
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	private String id=null;
	private String room_num="0";


	public void setId(String id) {
		this.id = id;
	}

	public void setRoom_num(String room_num) {
		this.room_num = room_num;
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
		if(this.room_num.equals("1")){
		sessionList1.add(session);
		//0번째 중괄호에 session.getId()을 넣으라는뜻		
		logger.info("{} 연결됨1", session.getId()); 
		}
		else if(this.room_num.equals("2")){
			sessionList2.add(session);
			//0번째 중괄호에 session.getId()을 넣으라는뜻		
			logger.info("{} 연결됨2", session.getId()); 
			}
		else if(this.room_num.equals("3")){
			sessionList3.add(session);
			//0번째 중괄호에 session.getId()을 넣으라는뜻		
			logger.info("{} 연결됨3", session.getId()); 
			}
		else if(this.room_num.equals("4")){
			sessionList4.add(session);
			//0번째 중괄호에 session.getId()을 넣으라는뜻		
			logger.info("{} 연결됨4", session.getId()); 
			}
		else if(this.room_num.equals("5")){
			sessionList5.add(session);
			//0번째 중괄호에 session.getId()을 넣으라는뜻		
			logger.info("{} 연결됨5", session.getId()); 
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
		}
		else if(this.room_num.equals("2")){
			//0번째에 session.getId() 1번째에 message.getPayload() 넣음
			logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
			//    logger.info("{}로부터 {}받음", new String[]{session.getId(),message.getPayload()});

			//연결된 모든 클라이언트에게 메시지 전송 : 리스트 방법
			for(WebSocketSession sess : sessionList2){
				sess.sendMessage(new TextMessage(session.getId()+" : " + message.getPayload()));
			}
		}
		else if(this.room_num.equals("3")){
			//0번째에 session.getId() 1번째에 message.getPayload() 넣음
			logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
			//    logger.info("{}로부터 {}받음", new String[]{session.getId(),message.getPayload()});

			//연결된 모든 클라이언트에게 메시지 전송 : 리스트 방법
			for(WebSocketSession sess : sessionList3){
				sess.sendMessage(new TextMessage(session.getId()+" : " + message.getPayload()));
			}
		}
		else if(this.room_num.equals("4")){
			//0번째에 session.getId() 1번째에 message.getPayload() 넣음
			logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
			//    logger.info("{}로부터 {}받음", new String[]{session.getId(),message.getPayload()});

			//연결된 모든 클라이언트에게 메시지 전송 : 리스트 방법
			for(WebSocketSession sess : sessionList4){
				sess.sendMessage(new TextMessage(session.getId()+" : " + message.getPayload()));
			}
		}
		else if(this.room_num.equals("5")){
			//0번째에 session.getId() 1번째에 message.getPayload() 넣음
			logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
			//    logger.info("{}로부터 {}받음", new String[]{session.getId(),message.getPayload()});

			//연결된 모든 클라이언트에게 메시지 전송 : 리스트 방법
			for(WebSocketSession sess : sessionList5){
				sess.sendMessage(new TextMessage(session.getId()+" : " + message.getPayload()));
			}
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
		else if(this.room_num.equals("2")){
			//List 삭제
			sessionList2.remove(session);

			//Map 삭제
			//sessions.remove(session.getId());

			logger.info("{} 연결 끊김.", session.getId());
		}
		else if(this.room_num.equals("3")){
			//List 삭제
			sessionList3.remove(session);

			//Map 삭제
			//sessions.remove(session.getId());

			logger.info("{} 연결 끊김.", session.getId());
		}
		else if(this.room_num.equals("4")){
			//List 삭제
			sessionList4.remove(session);

			//Map 삭제
			//sessions.remove(session.getId());

			logger.info("{} 연결 끊김.", session.getId());
		}
		else if(this.room_num.equals("5")){
			//List 삭제
			sessionList5.remove(session);

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

