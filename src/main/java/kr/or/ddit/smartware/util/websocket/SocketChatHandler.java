package kr.or.ddit.smartware.util.websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.ddit.smartware.employee.model.Employee;

public class SocketChatHandler extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(SocketChatHandler.class);
	
	@Resource(name = "eventMap")
	private Map<String, WebSocketSession> sessionMap;	// 소켓에 연결된 세션정보

	private Map<String, WebSocketSession> chatMap;
	
	public SocketChatHandler() {
		chatMap = new HashMap<String, WebSocketSession>();
	}

	// 클라이언트가 웹소켓에 접속하여 연결이 맺어진 후에 호출
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Employee employee = getEmployee(session);
		
		chatMap.put(employee.getEmp_id(), session);
		logger.debug("채팅 접속 : {}", employee.getEmp_id());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Employee employee = getEmployee(session);
		logger.debug("메세지전송 = {} : {}", employee, message.getPayload());

		//채팅메시지 : str[0]type, str[1]유저이름, str[2]메시지내용, str[3]msg_id
		String[] str = message.getPayload().split(":");
		String type = str[0];
		
		for (WebSocketSession currentSession : chatMap.values()) {
			Employee employeee = getEmployee(currentSession);
			logger.debug("map : {}", employeee.getC_use());
			if(employeee != employee && employeee.getC_use().equals("true") && type.equals("msg")) {
				currentSession.sendMessage(new TextMessage(type + ":" + employee.getEmp_id() + ":" + str[1] + ":" + str[2]));
			}else if(employeee != employee && employeee.getC_use().equals("false") && type.equals("msg")){
				currentSession.sendMessage(new TextMessage(type + ":" + employee.getEmp_id() + ":" + str[1] + ":" + str[2]));
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			Employee employee = getEmployee(session);
				
//			chatMap.remove(employee.getEmp_id());
			
			logger.debug("연결 끊김 : {}", employee);
	}
		
	//webSocketSession으로부터 userId 정보 조회
		private Employee getEmployee(WebSocketSession session) {
			return ((Employee) session.getAttributes().get("S_EMPLOYEE"));
		}
		
		// 서버측에서 모든 websocket session으로 보내는 메세지
		public void serverToClient() throws IOException {
			for(WebSocketSession wSession : sessionMap.values())
				wSession.sendMessage(new TextMessage("서버 전송 메세지"));				
		}
	}

