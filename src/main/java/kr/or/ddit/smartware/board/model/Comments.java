package kr.or.ddit.smartware.board.model;

import java.util.Date;

public class Comments {

	private Date reg_dt;     	// 게시글 아이디
	private String able;     	// 내용
	private String com_id;   	// 댓글 아이디
	private String cont;     	// 등록 날짜
	private String emp_id;   	// 부모 댓글 아이디
	private String pa_com_id;	// 사원 아이디
	private String post_id;   	// 삭제 여부
	
	public Comments() { }
	
	public Comments(Date reg_dt, String able, String com_id, String cont, String emp_id, String pa_com_id,
			String post_id) {
		this.reg_dt = reg_dt;
		this.able = able;
		this.com_id = com_id;
		this.cont = cont;
		this.emp_id = emp_id;
		this.pa_com_id = pa_com_id;
		this.post_id = post_id;
	}

	public Date getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getAble() {
		return able;
	}
	public void setAble(String able) {
		this.able = able;
	}
	public String getCom_id() {
		return com_id;
	}
	public void setCom_id(String com_id) {
		this.com_id = com_id;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getPa_com_id() {
		return pa_com_id;
	}
	public void setPa_com_id(String pa_com_id) {
		this.pa_com_id = pa_com_id;
	}
	public String getPost_id() {
		return post_id;
	}
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	
	@Override
	public String toString() {
		return "Comments [reg_dt=" + reg_dt + ", able=" + able + ", com_id=" + com_id + ", cont=" + cont + ", emp_id="
				+ emp_id + ", pa_com_id=" + pa_com_id + ", post_id=" + post_id + "]";
	}
	
}
