package kr.or.ddit.smartware.messenger.model;

public class Chat {

	private String chat_id;	// 채팅방 아이디
	private String chat_nm;	// 채팅방 이름
	private String able; 	// 채팅방 존재 여부
	
	public Chat() { }
	
	public Chat(String chat_id, String chat_nm, String able) {
		this.chat_id = chat_id;
		this.chat_nm = chat_nm;
		this.able = able;
	}

	public String getChat_id() {
		return chat_id;
	}
	public void setChat_id(String chat_id) {
		this.chat_id = chat_id;
	}
	public String getChat_nm() {
		return chat_nm;
	}
	public void setChat_nm(String chat_nm) {
		this.chat_nm = chat_nm;
	}
	public String getAble() {
		return able;
	}
	public void setAble(String able) {
		this.able = able;
	}

	@Override
	public String toString() {
		return "Chat [chat_id=" + chat_id + ", chat_nm=" + chat_nm + ", able=" + able + "]";
	}

}
