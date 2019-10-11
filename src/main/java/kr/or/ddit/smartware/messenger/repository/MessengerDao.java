package kr.or.ddit.smartware.messenger.repository;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.messenger.model.Chat;
import kr.or.ddit.smartware.messenger.model.ChatEmp;
import kr.or.ddit.smartware.messenger.model.Message;

@Repository
public class MessengerDao implements IMessengerDao{

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
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
		return sqlSession.selectList("chat.getChatList", chat_id);
	}

	/**
	* Method : getChatNm
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chat_id
	* @return
	* Method 설명 : 채팅방 이름 조회
	@Override
	 */
	public String getChatNm(String chat_id) {
		return sqlSession.selectOne("chat.getChatNm", chat_id);
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
		return sqlSession.selectList("chat.getChatEmp", map);
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
	public List<Map> getMessageList(String chat_id) {
		return sqlSession.selectList("chat.getMessageList", chat_id);
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
	public int insertMessage(Message message) {
		return sqlSession.insert("chat.insertMessage", message);
	}

	/**
	* Method : insertChat
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chat_nm
	* @return
	* Method 설명 : 채팅방 추가
	*/
	@Override
	public String insertChat(Chat chat) {
		return sqlSession.insert("chat.insertChat", chat) + "";
	}

	/**
	* Method : insertChatEmp
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chatEmp
	* @return
	* Method 설명 : 채팅방 사원 추가
	*/
	@Override
	public int insertChatEmp(ChatEmp chatEmp) {
		return sqlSession.insert("chat.insertChatEmp", chatEmp);
	}

	/**
	* Method : deleteChat
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chatEmp
	* @return
	* Method 설명 : 채티방 나가기
	*/
	@Override
	public int deleteChat(ChatEmp chatEmp) {
		return sqlSession.delete("chat.deleteChat", chatEmp);
	}

	/**
	* Method : getChatCnt
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chat_id
	* @return
	* Method 설명 : 채팅방 인원수 얻어오기
	*/
	@Override
	public int getChatCnt(String chat_id) {
		return sqlSession.selectOne("chat.getChatCnt", chat_id);
	}

	/**
	* Method : updateChat
	* 작성자 : JEON MIN GYU
	* 변경이력 :
	* @param chat_id
	* @return
	* Method 설명 : 채팅방 상태 변경
	*/
	@Override
	public int updateChat(String chat_id) {
		return sqlSession.update("chat.updateChat", chat_id);
	}

}
