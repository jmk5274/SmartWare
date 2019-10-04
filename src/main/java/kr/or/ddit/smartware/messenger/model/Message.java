package kr.or.ddit.smartware.messenger.model;

import java.util.Date;

public class Message {

	private Date send_dt;   	// 메세지 내용
	private String chat_id; 	// 메세지 아이디
	private String emp_id;  	// 사원 아이디
	private String msg_cont;	// 전송 날짜
	private String msg_id;		// 채팅방 아이디
	
	public Message() { }
	
	public Message(Date send_dt, String chat_id, String emp_id, String msg_cont, String msg_id) {
		this.send_dt = send_dt;
		this.chat_id = chat_id;
		this.emp_id = emp_id;
		this.msg_cont = msg_cont;
		this.msg_id = msg_id;
	}

	public Date getSend_dt() {
		return send_dt;
	}
	public void setSend_dt(Date send_dt) {
		this.send_dt = send_dt;
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
	public String getMsg_cont() {
		return msg_cont;
	}
	public void setMsg_cont(String msg_cont) {
		this.msg_cont = msg_cont;
	}
	public String getMsg_id() {
		return msg_id;
	}
	public void setMsg_id(String msg_id) {
		this.msg_id = msg_id;
	}
	
	@Override
	public String toString() {
		return "Message [chat_id=" + chat_id + ", emp_id=" + emp_id + ", msg_cont=" + msg_cont + ", msg_id=" + msg_id
				+ "]";
	}
	
}
