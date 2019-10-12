package kr.or.ddit.smartware.messenger.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.employee.service.EmployeeService;
import kr.or.ddit.smartware.employee.service.IEmployeeService;
import kr.or.ddit.smartware.messenger.model.Chat;
import kr.or.ddit.smartware.messenger.model.ChatEmp;
import kr.or.ddit.smartware.messenger.model.Message;
import kr.or.ddit.smartware.messenger.service.IMessengerService;

@Controller
public class MessengerController {

	private static final Logger logger = LoggerFactory.getLogger(MessengerController.class);
	
	@Resource(name = "messengerService")
	private IMessengerService messengerService;
	
	@Resource(name = "employeeService")
	private IEmployeeService employeeService;
	
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
		
		employee.setC_use("true");
		session.setAttribute("S_EMPLOYEE", employee);
		
		return "messenger/chatTest";
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
	@ResponseBody
	public Map<String, Object> insertMessage(@RequestBody Message message, HttpSession session, HttpServletRequest request) {
		Employee employee = (Employee)session.getAttribute("S_EMPLOYEE");
		
		message.setEmp_id(employee.getEmp_id());
		
		//메시지 저장
		messengerService.insertMessage(message);
		
		//채팅방 리스트 업데이트
		List<Map> map = messengerService.getChatList(employee.getEmp_id());
		request.getServletContext().setAttribute("A_CHATLIST", map);
		
		session.setAttribute("S_EMPLOYEE", employee);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("chat_id", message.getChat_id());
		resultMap.put("msg_cont", message.getMsg_cont());
		resultMap.put("emp_id", message.getEmp_id());
		
		return resultMap;
	}
	
	/**
	* Method : chatAddView
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @return
	* Method 설명 : 채팅방 개설 페이지 요청
	*/
	@GetMapping("chatAdd")
	public String chatAddView() {
		return "messenger/chatAdd";
	}
	
	/**
	* Method : chatAdd
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chat
	* @param chatEmp
	* @param session
	* @param request
	* @return
	* Method 설명 : 채팅방 개설
	*/
	@PostMapping("chatAdd")
	public String chatAdd(Chat chat, ChatEmp chatEmp, HttpSession session, HttpServletRequest request) {
		
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		
		chatEmp.setEmp_id(employee.getEmp_id());
		
		String chat_id = messengerService.insertChat(chat, chatEmp);
		
		if(chat_id == null || chat_id.equals("")) {
			return "messenger/chatAdd";
		}else {
			//채팅방 리스트 업데이트
			List<Map> map = messengerService.getChatList(employee.getEmp_id());
			request.getServletContext().setAttribute("A_CHATLIST", map);
			
			return "redirect:/chatRoom?chat_id="+chat_id;
		}
	}
	
	/**
	* Method : empPicture
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param userId
	* @param response
	* @throws IOException
	* Method 설명 : 사용자 사진 출력
	*/
	@GetMapping("empPicture")
	public void empPicture(String emp_id, HttpServletResponse response) throws IOException {
		Employee employee = employeeService.getEmployee(emp_id);
		
		ServletOutputStream sos = response.getOutputStream();
		
		File picture = new File(employee.getEmp_pic());
		FileInputStream fis = new FileInputStream(picture);
		
		byte[] buff = new byte[512];
		int len = 0;
		
		while((len = fis.read(buff, 0, 512)) != -1) {
			sos.write(buff,0,len);
		}
		fis.close();
	}
	
	/**
	* Method : deleteChat
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chatEmp
	* @param session
	* Method 설명 : 채팅방 나가기
	*/
	@PostMapping("deleteChat")
	@ResponseBody
	public Map<String, Object> deleteChat(@RequestBody ChatEmp chatEmp, HttpSession session, HttpServletRequest request) {
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		chatEmp.setEmp_id(employee.getEmp_id());
		
		messengerService.deleteChat(chatEmp);
		
		List<Map> map = messengerService.getChatList(employee.getEmp_id());
		request.getServletContext().setAttribute("A_CHATLIST", map);
		
		//chat_id에 해당하는 채팅방 인원수 가져오기(select)
		int cnt = messengerService.getChatCnt(chatEmp.getChat_id());
		
		if(cnt==0)
			//conut==0일 때 해당 채팅방 상태 F로 변경(update)
			messengerService.updateChat(chatEmp.getChat_id());
		
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("chat_id", chatEmp.getChat_id());
		
		return resultMap;
	}
	
	@RequestMapping("inviteList")
	public String inviteList(String chat_id) {
		return "messenger/inviteList";
	}
}
