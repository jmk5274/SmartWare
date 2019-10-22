package kr.or.ddit.smartware.messenger.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.messenger.model.Chat;
import kr.or.ddit.smartware.messenger.model.ChatEmp;
import kr.or.ddit.smartware.messenger.model.Message;

public interface IMessengerService {

	/**
	* Method : getChatList
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chat_id
	* @return
	* Method 설명 : 채팅창 리스트 조회 (채팅방 이름, 참가인원, 마지막 메시지 내용)
	*/
	List<Map> getChatList(String chat_id);

	/**
	* Method : getChatNm
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chat_id
	* @return
	* Method 설명 : 채팅방 이름 조회
	*/
	String getChatNm(String chat_id);

	/**
	* Method : getChatEmp
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chat_id
	* @return
	* Method 설명 : 채팅방 접속인원 조회
	*/
	List<Employee> getChatEmp(Map<String, String> map);

	/**
	* Method : getMessageList
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chat_id
	* @return
	* Method 설명 : 채팅방 메시지 조회
	*/
	List<Map> getMessageList(ChatEmp chatEmp);

	
	/**
	* Method : getMessage
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param message
	* @return
	* Method 설명 : 메시지 전송
	*/
	String insertMessage(Message message);
	
	/**
	* Method : insertChat
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chat_nm
	* @return
	* Method 설명 : 채팅방 추가
	*/
	String insertChat(Chat chat, ChatEmp chatEmp);

	/**
	* Method : deleteChat
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chatEmp
	* @return
	* Method 설명 : 채팅방 나가기
	*/
	int deleteChat(ChatEmp chatEmp);
	
	/**
	* Method : getChatCnt
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chat_id
	* @return
	* Method 설명 : 채팅방 인원수 얻어오기
	*/
	int getChatCnt(String chat_id);
	
	/**
	* Method : updateChat
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chat_id
	* @return
	* Method 설명 : 채팅방 상태 변경
	*/
	int updateChat(String chat_id);
	
	/**
	* Method : getEmpList
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @return
	* Method 설명 : 사원리스트 조회
	*/
	List<Map> getEmpList(String emp_nm);
	
	int insertChatEmp(ChatEmp chatEmp);
	
	/**
	* Method : getChatInfo
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chat_id
	* @return
	* Method 설명 : 채팅방에 접속 인원 불러오기
	*/
	List<Employee> getChatInfo(String chat_id);
	
	/**
	* Method : updateLastMsg
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param last_msg
	* @return
	* Method 설명 : 마지막 읽은 메시지 수정
	*/
	int updateLastMsg(Message message);
	
	/**
	* Method : getChatListCount
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param message
	* @return
	* Method 설명 : 안읽은 메시지 갯수
	*/
	int getChatListCount(Message message);
	
	/**
	* Method : getChatTotleCnt
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param emp_id
	* @return
	* Method 설명 : 채팅방 토탈 카운트 조회
	*/
	int getChatTotleCnt(String emp_id);
	
	/**
	* Method : getLastMsg
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chat_id
	* @return
	* Method 설명 : 채팅방 마지막 메시지 가져오기
	*/
	String getLastMsg(String chat_id);
	
	/**
	* Method : updateInviteId
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param message
	* @return
	* Method 설명 : 초대시점 메시지 정보 업데이트
	*/
	int updateInviteId(Message message);
	
	/**
	* Method : getChatEmpList
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 채팅창에 없는 사원 목록 조회
	*/
	List<Map> getChatEmpList(Map map);
}
