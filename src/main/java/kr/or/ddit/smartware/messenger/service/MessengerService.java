package kr.or.ddit.smartware.messenger.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.messenger.model.Chat;
import kr.or.ddit.smartware.messenger.model.ChatEmp;
import kr.or.ddit.smartware.messenger.model.Message;
import kr.or.ddit.smartware.messenger.repository.IMessengerDao;

@Service
public class MessengerService implements IMessengerService{

	@Resource(name = "messengerDao")
	private IMessengerDao messengerDao; 
	
	/**
	* Method : getChatList
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chat_id
	* @return
	* Method 설명 : 채팅창 리스트 조회 (채팅방 이름, 참가인원, 마지막 메시지 내용)
	*/
	@Override
	public List<Map> getChatList(String chat_id) {
		return messengerDao.getChatList(chat_id);
	}

	/**
	* Method : getChatNm
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chat_id
	* @return
	* Method 설명 : 채팅방 이름 조회
	*/
	@Override
	public String getChatNm(String chat_id) {
		return messengerDao.getChatNm(chat_id);
	}

	/**
	* Method : getChatEmp
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chat_id
	* @return
	* Method 설명 : 채팅방 접속인원 조회
	*/
	@Override
	public List<Employee> getChatEmp(Map<String, String> map) {
		return messengerDao.getChatEmp(map);
	}

	/**
	* Method : getMessageList
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chat_id
	* @return
	* Method 설명 : 채팅방 메시지 조회
	*/
	@Override
	public List<Map> getMessageList(ChatEmp chatEmp) {
		return messengerDao.getMessageList(chatEmp);
	}

	/**
	* Method : getMessage
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param message
	* @return
	* Method 설명 : 메시지 전송
	*/
	@Override
	public String insertMessage(Message message) {
		
		messengerDao.insertMessage(message);
		
		return message.getMsg_id();
	}

	/**
	* Method : insertChat
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chat_nm
	* @param chatEmp
	* @return
	* Method 설명 : 채팅방 추가
	*/
	@Override
	public String insertChat(Chat chat, ChatEmp chatEmp) {
		String chat_id = messengerDao.insertChat(chat);
		
		chatEmp.setChat_id(chat.getChat_id());
		
		int cnt = 0;
		if(chat_id==null || chat_id.equals("")) {
			cnt = 0;
		}else {
			cnt = messengerDao.insertChatEmp(chatEmp);
		}
		
		return chat.getChat_id();
	}

	/**
	* Method : deleteChat
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chatEmp
	* @return
	* Method 설명 : 채팅방 나가기
	*/
	@Override
	public int deleteChat(ChatEmp chatEmp) {
		return messengerDao.deleteChat(chatEmp);
	}

	@Override
	public int getChatCnt(String chat_id) {
		return messengerDao.getChatCnt(chat_id);
	}

	@Override
	public int updateChat(String chat_id) {
		return messengerDao.updateChat(chat_id);
	}

	@Override
	public List<Map> getEmpList(String emp_nm) {
		return messengerDao.getEmpList(emp_nm);
	}

	public int insertChatEmp(ChatEmp chatEmp) {
		return messengerDao.insertChatEmp(chatEmp);
	}

	@Override
	public List<Employee> getChatInfo(String chat_id) {
		return messengerDao.getChatInfo(chat_id);
	}

	@Override
	public int updateLastMsg(Message message) {
		return messengerDao.updateLastMsg(message);
	}

	@Override
	public int getChatListCount(Message message) {
		return messengerDao.getChatListCount(message);
	}

	/**
	* Method : getChatTotleCnt
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : 채팅방 토탈 카운트 조회
	*/
	@Override
	public int getChatTotleCnt(String emp_id) {
		return messengerDao.getChatTotleCnt(emp_id);
	}

	@Override
	public String getLastMsg(String chat_id) {
		return messengerDao.getLastMsg(chat_id);
	}

	@Override
	public int updateInviteId(Message message) {
		return messengerDao.updateInviteId(message);
	}
	
}
