package kr.or.ddit.smartware.messenger.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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

}
