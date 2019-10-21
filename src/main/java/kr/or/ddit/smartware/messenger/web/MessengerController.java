package kr.or.ddit.smartware.messenger.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import kr.or.ddit.smartware.employee.service.IEmployeeService;
import kr.or.ddit.smartware.messenger.model.Chat;
import kr.or.ddit.smartware.messenger.model.ChatEmp;
import kr.or.ddit.smartware.messenger.model.Message;
import kr.or.ddit.smartware.messenger.service.IMessengerService;
import oracle.sql.DATE;

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
		ChatEmp chatEmp = new ChatEmp();
		chatEmp.setChat_id(chat_id);
		chatEmp.setEmp_id(employee.getEmp_id());
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("chat_id", chat_id);		
		map.put("emp_id", employee.getEmp_id());		
		
		String emp_nm = "";
		String chat_nm = messengerService.getChatNm(chat_id);
		List<Employee> chatEmpList = messengerService.getChatEmp(map);
		List<Map> messageList = messengerService.getMessageList(chatEmp); 
		List<Map> empList1 = messengerService.getEmpList(emp_nm);
		List<Employee> chatList = messengerService.getChatInfo(chat_id);
		
		List<Map> empList = new ArrayList<Map>();
		for(Map emp : empList1) {
			boolean flag = false;
			for(Employee chat : chatList) {
				String emp_id=(String) emp.get("EMP_ID");
				if(emp_id.equals(chat.getEmp_id()))
				flag = true;
			}
			if(flag == false) {
				empList.add(emp);
			}
		}
		
		model.addAttribute("chat_id", chat_id);
		model.addAttribute("chat_nm", chat_nm);
		model.addAttribute("chatEmpList", chatEmpList);
		model.addAttribute("messageList", messageList);
		model.addAttribute("empList", empList);
		model.addAttribute("chatList", chatList);
		
		employee.setC_use("true");
		employee.setChat_id(chat_id);
		session.setAttribute("S_EMPLOYEE", employee);
		
		return "messenger/chatView";
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
		String msg_id = messengerService.insertMessage(message);
		
		//채팅방 리스트 업데이트
		List<Map> map = messengerService.getChatList(employee.getEmp_id());
		request.getServletContext().setAttribute("A_CHATLIST", map);
		
		session.setAttribute("S_EMPLOYEE", employee);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("chat_id", message.getChat_id());
		resultMap.put("msg_cont", message.getMsg_cont());
		resultMap.put("msg_id", msg_id);
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
	public void empPicture(String emp_id, HttpServletResponse response, HttpSession session) {
		Employee employee = employeeService.getEmployee(emp_id);
		
		ServletOutputStream sos = null;
		FileInputStream fis = null;
		File picture = null;
		String path = session.getServletContext().getRealPath("/img/emp");
		
		try {
			sos = response.getOutputStream();
				picture = new File(path+"/"+employee.getEmp_pic());
			try {
				fis = new FileInputStream(picture);
			} catch (Exception e) {
				picture = new File(path+"/no_img.png");
				fis = new FileInputStream(picture);
			}
			byte[] buff = new byte[512];
			int len = 0;
			
			while((len = fis.read(buff, 0, 512)) != -1) {
				sos.write(buff,0,len);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fis.close();
				sos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
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
	
	@PostMapping("updateLastMsg")
	@ResponseBody
	public Map<String, Object> updateLastMsg(@RequestBody Message message, HttpSession session, HttpServletRequest request) {
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		message.setEmp_id(employee.getEmp_id());
		
		int cnt = messengerService.updateLastMsg(message);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("cnt", cnt);
		
		return resultMap;
	}
	
	/**
	* Method : searchList
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param emp_nm
	* @param chat_id
	* @param model
	* @return
	* Method 설명 : 초대리스트 검색
	*/
	@GetMapping("searchInviteList")
	public String searchList(String emp_nm, String chat_id, Model model) {
		
		List<Employee> chatList = messengerService.getChatInfo(chat_id);
		List<Map> empList = messengerService.getEmpList(emp_nm);
			
		model.addAttribute("chatList", chatList);
		model.addAttribute("empList", empList);
		
		return "jsonView";
	}
	
	/**
	* Method : insertCahtEmp
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chat_id
	* @param emp_id
	* @param model
	* @param session
	* @return
	* Method 설명 : 메신저 사원 초대
	*/
	@GetMapping("insertChatEmp")
	public String insertCahtEmp(String chat_id, String[] emp_id, String msg_id, Model model, HttpSession session){
		
		ChatEmp chatEmp = new ChatEmp();
		chatEmp.setChat_id(chat_id);
		Message message = new Message();
		message.setChat_id(chat_id);
		message.setMsg_id(msg_id);
		for(String e : emp_id) {
			chatEmp.setEmp_id(e);
			message.setEmp_id(e);
			messengerService.insertChatEmp(chatEmp);
			messengerService.updateInviteId(message);
		}
		
		String emp_nm = "";
		List<Map> empList1 = messengerService.getEmpList(emp_nm);
		List<Employee> chatList = messengerService.getChatInfo(chat_id);
		
		List<Map> empList = new ArrayList<Map>();
		for(Map emp : empList1) {
			boolean flag = false;
			for(Employee chat : chatList) {
				String emp_id1=(String) emp.get("EMP_ID");
				if(emp_id1.equals(chat.getEmp_id()))
				flag = true;
			}
			if(flag == false) {
				empList.add(emp);
			}
		}
		
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		List<Employee> countList = new ArrayList<Employee>();
		for(Employee chat : chatList) {
			if(chat.getEmp_id().equals(employee.getEmp_id())) {
				continue;
			}
			countList.add(chat);
		}
		int cnt = countList.size()-1;
			
		model.addAttribute("countList", countList);
		model.addAttribute("cnt", cnt);
		model.addAttribute("chatList", chatList);
		model.addAttribute("empList", empList);
		
		return "jsonView";
	}
	
	/**
	* Method : getChatList
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @return
	* Method 설명 : chatList 갱신
	*/
	@GetMapping("getChatList")
	public String getChatList(Model model, HttpSession session, HttpServletRequest request) {
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		
		if(employee==null) {
			
		}else {
			List<Map> mapList = messengerService.getChatList(employee.getEmp_id());
			int cnt = messengerService.getChatTotleCnt(employee.getEmp_id());
			
			request.getServletContext().setAttribute("A_CHATLIST", mapList);
			request.getServletContext().setAttribute("A_CNT", cnt);
			
			model.addAttribute("chatList", mapList);
			model.addAttribute("totalCnt", cnt);
		}
		
		return "jsonView";
	}
	
	@GetMapping("getLastMsg")
	public String getLastMsg(String chat_id, Model model) {
		
		String msg_id = messengerService.getLastMsg(chat_id);
		
		if(msg_id.equals("msg")) msg_id = "";

		model.addAttribute("msg_id", msg_id);
		
		return "jsonView";
	}
	
	@GetMapping("getChatInfo")
	public String getChatInfo(String chat_id, Model model, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");
		String emp_nm = "";
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("chat_id", chat_id);		
		map.put("emp_id", employee.getEmp_id());	
		
		List<Employee> chatEmpList = messengerService.getChatEmp(map);
		List<Employee> chatList = messengerService.getChatInfo(chat_id);
		List<Map> empList1 = messengerService.getEmpList(emp_nm);
		
		List<Map> empList = new ArrayList<Map>();
		for(Map emp : empList1) {
			boolean flag = false;
			for(Employee chat : chatList) {
				String emp_id=(String) emp.get("EMP_ID");
				if(emp_id.equals(chat.getEmp_id()))
				flag = true;
			}
			if(flag == false) {
				empList.add(emp);
			}
		}
		
		model.addAttribute("cnt", chatEmpList.size()-1);
		model.addAttribute("chatEmpList", chatEmpList);
		model.addAttribute("empList", empList);
		
		return "jsonView";
	}
}
