package kr.or.ddit.smartware.messenger.model;

public class ChatEmp {

	private String chat_id;	// 사원 아이디
	private String emp_id; 	// 채팅방 아이디
	private String last_msg;
	private String invite_id;
	
	public ChatEmp() { }
	
	public ChatEmp(String chat_id, String emp_id, String last_msg, String invite_id) {
		this.chat_id = chat_id;
		this.emp_id = emp_id;
		this.last_msg = last_msg;
		this.invite_id = invite_id;
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

	public String getLast_msg() {
		return last_msg;
	}

	public void setLast_msg(String last_msg) {
		this.last_msg = last_msg;
	}

	public String getInvite_id() {
		return invite_id;
	}

	public void setInvite_id(String invite_id) {
		this.invite_id = invite_id;
	}

	@Override
	public String toString() {
		return "ChatEmp [chat_id=" + chat_id + ", emp_id=" + emp_id + ", last_id=" + last_msg + ", invite_id="
				+ invite_id + "]";
	}

}
