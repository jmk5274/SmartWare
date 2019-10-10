package kr.or.ddit.smartware.messenger.web;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.smartware.util.websocket.SocketChatHandler;

@Controller
public class SocketChatController {
	@Autowired
	private SocketChatHandler socketHandler;	// SocketChantHandelr
	
	// 채팅 화면 요청(파리미터로 userId를 전송) : http://localhost/socketView?userId=brown
	@RequestMapping("/socket/view")
	public String socketView(HttpSession session) {		
		return "messenger/chat";
	}

	// 소켓에 연결된 모든 사용자에게 메세지 전달
	@RequestMapping("/socket/serverToClient")
	public void serverToClient() throws IOException {
		socketHandler.serverToClient();	
	}
}

