package kr.or.ddit.smartware.messenger.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.messenger.model.ChatEmp;
import kr.or.ddit.smartware.messenger.model.Message;
import kr.or.ddit.smartware.messenger.service.IMessengerService;

@Controller
public class MessengerController {

	@Resource(name = "messengerService")
	private IMessengerService messengerService;
	
	/**
	* Method : chatRoom
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param model
	* @param chat_id
	* @param session
	* @return
	* Method 설명 : 채팅방 열기
	*/
	@RequestMapping("chatRoom")
	public String chatRoom(Model model, String chat_id, HttpSession session) {
		
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("chat_id", chat_id);		
		map.put("emp_id", employee.getEmp_id());		
		
		String chat_nm = messengerService.getChatNm(chat_id);
		List<Employee> chatEmpList = messengerService.getChatEmp(map);
		List<Map> messageList = messengerService.getMessageList(chat_id); 
		
		model.addAttribute("chat_id", chat_id);
		model.addAttribute("chat_nm", chat_nm);
		model.addAttribute("chatEmpList", chatEmpList);
		model.addAttribute("messageList", messageList);
		
		return "messenger/chat";
	}
	
	/**
	* Method : insertMessage
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param model
	* @param message
	* @param session
	* @return
	* Method 설명 : 메시지 전송
	*/
	@PostMapping("insertMessage")
	public String insertMessage(Model model, Message message, HttpSession session) {
		Employee employee = (Employee)session.getAttribute("S_EMPLOYEE");
		
		message.setEmp_id(employee.getEmp_id());
		
		//메시지 저장
		messengerService.insertMessage(message);
		
		model.addAttribute("chat_id", message.getChat_id());
		
		return "redirect:/chatRoom";
	}
	
}
