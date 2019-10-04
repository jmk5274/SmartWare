package kr.or.ddit.smartware.messenger.model;

public class ChatEmp {

	private String chat_id;	// 사원 아이디
	private String emp_id; 	// 채팅방 아이디
	
	public ChatEmp() { }
	
	public ChatEmp(String chat_id, String emp_id) {
		this.chat_id = chat_id;
		this.emp_id = emp_id;
	}

	public String getChat_id() {
		return chat_id;
	}
	public void setChat_id(String chat_id) {
		this.chat_id = chat_id;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	
	@Override
	public String toString() {
		return "ChatEmp [chat_id=" + chat_id + ", emp_id=" + emp_id + "]";
	}
	
}
