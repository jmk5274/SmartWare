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
		
		//채팅메시지 : str[0]type, str[1]메시지, str[2]chat_id, str[3]msg_id, str[4...]채팅방 인원 정보
		String[] str = message.getPayload().split("\\^");
		String type = str[0];
		
		// 메시지전송에 대한 send 이벤트
		if(type.equals("msg")) {
			for(int i=0; i<str.length; i++) {
				String chat_id = str[2];
				if(chatMap.get(str[i])!=null && i>3) {
					WebSocketSession webSession = chatMap.get(str[i]);
					Employee employeee = getEmployee(webSession);
					
					if(employeee.getC_use().equals("true") && employeee.getChat_id().equals(chat_id)) {
						webSession.sendMessage(new TextMessage(type + "^" + employee.getEmp_id() + "^" + employee.getEmp_nm() + "^" + str[1] + "^" + str[2] + "^" + str[3]));
					}else if(employeee.getC_use().equals("false")) {
						webSession.sendMessage(new TextMessage(type + "^" + employee.getEmp_id() + "^" + str[1] + "^" + str[2] + "^" + str[3]));
					}
				}
			}
		}
		
		//프로젝트 관련 send 이벤트
		if(type.equals("project")) {
			for(int i=0; i<str.length; i++) {
				if(chatMap.get(str[i])!=null && !str[i].equals("project")) {
					WebSocketSession webSession = chatMap.get(str[i]);
					
					webSession.sendMessage(new TextMessage(type + "^temp"));
				}
			}
		}
		
		//결재문서 반려 관련 send 이벤트
		if(type.equals("refer")) {
			String[] employees = str[1].split(", ");
			for(int i=0; i<employees.length; i++) {
				if(chatMap.get(employees[i].trim())!=null) {
					WebSocketSession webSession = chatMap.get(employees[i].trim());
					
					if(i==0) {
						webSession.sendMessage(new TextMessage(type + "^기안한 결재문서가 반려되었습니다."));
					}else {
						webSession.sendMessage(new TextMessage(type + "^승인한 결재문서가 반려되었습니다."));
					}
				}
			}
		}
		
		//결재문서 기안 관련 send 이벤트
		if(type.equals("appr")) {
			if(chatMap.get(str[1].trim())!=null){
				WebSocketSession webSession = chatMap.get(str[1].trim());
				
				webSession.sendMessage(new TextMessage(type + "^결재문서가 도착했습니다."));
			}
		}
		
		
		for (WebSocketSession currentSession : chatMap.values()) {
			Employee employeee = getEmployee(currentSession);
			if(employeee.getC_use().equals("true") && type.equals("close")) {
				currentSession.sendMessage(new TextMessage(type + "^" + employee.getEmp_nm()));
			}else if(employeee.getC_use().equals("true") && type.equals("invite")) {
				String employees = "";
				for(int i=0; i<str.length; i++) {
					if(!str[i].equals("invite")) {
						employees += str[i];
						if(i!=str.length-1) {
							employees += ", ";
						}
					}
				}
				currentSession.sendMessage(new TextMessage(type + "^" + employees));
			}else if(employee.getEmp_id().equals(employeee.getEmp_id()) && type.equals("mail")) {
				currentSession.sendMessage(new TextMessage(type + "^" + employee.getEmp_nm()));
			}else if(employeee.getEmp_id().equals(str[1]) && type.equals("video")) {
				currentSession.sendMessage(new TextMessage(type + "^" + employee.getEmp_nm()));
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

