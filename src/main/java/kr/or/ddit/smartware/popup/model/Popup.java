package kr.or.ddit.smartware.popup.model;

import java.util.Date;

public class Popup {

	private Date pop_end_dt;	// 등록 날짜
	private Date pop_st_dt; 	// 사원 아이디
	private Date reg_dt;    	// 팝업 내용
	private String emp_id;  	// 팝업 시작 날짜
	private String pop_cont;	// 팝업 아래
	private String pop_id;  	// 팝업 아이디
	private String pop_title;	// 팝업 오른쪽	
	private int pop_bot;    	// 팝업 완료 날짜
	private int pop_left;   	// 팝업 왼쪽
	private int pop_right;  	// 팝업 위
	private int pop_top;		// 팝업 제목
	
	public Popup() { }
	
	public Popup(Date pop_end_dt, Date pop_st_dt, Date reg_dt, String emp_id, String pop_cont, String pop_id,
			String pop_title, int pop_bot, int pop_left, int pop_right, int pop_top) {
		this.pop_end_dt = pop_end_dt;
		this.pop_st_dt = pop_st_dt;
		this.reg_dt = reg_dt;
		this.emp_id = emp_id;
		this.pop_cont = pop_cont;
		this.pop_id = pop_id;
		this.pop_title = pop_title;
		this.pop_bot = pop_bot;
		this.pop_left = pop_left;
		this.pop_right = pop_right;
		this.pop_top = pop_top;
	}

	public Date getPop_end_dt() {
		return pop_end_dt;
	}
	public void setPop_end_dt(Date pop_end_dt) {
		this.pop_end_dt = pop_end_dt;
	}
	public Date getPop_st_dt() {
		return pop_st_dt;
	}
	public void setPop_st_dt(Date pop_st_dt) {
		this.pop_st_dt = pop_st_dt;
	}
	public Date getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getPop_cont() {
		return pop_cont;
	}
	public void setPop_cont(String pop_cont) {
		this.pop_cont = pop_cont;
	}
	public String getPop_id() {
		return pop_id;
	}
	public void setPop_id(String pop_id) {
		this.pop_id = pop_id;
	}
	public String getPop_title() {
		return pop_title;
	}
	public void setPop_title(String pop_title) {
		this.pop_title = pop_title;
	}
	public int getPop_bot() {
		return pop_bot;
	}
	public void setPop_bot(int pop_bot) {
		this.pop_bot = pop_bot;
	}
	public int getPop_left() {
		return pop_left;
	}
	public void setPop_left(int pop_left) {
		this.pop_left = pop_left;
	}
	public int getPop_right() {
		return pop_right;
	}
	public void setPop_right(int pop_right) {
		this.pop_right = pop_right;
	}
	public int getPop_top() {
		return pop_top;
	}
	public void setPop_top(int pop_top) {
		this.pop_top = pop_top;
	}
	
	@Override
	public String toString() {
		return "Popup [pop_end_dt=" + pop_end_dt + ", pop_st_dt=" + pop_st_dt + ", reg_dt=" + reg_dt + ", emp_id="
				+ emp_id + ", pop_cont=" + pop_cont + ", pop_id=" + pop_id + ", pop_title=" + pop_title + ", pop_bot="
				+ pop_bot + ", pop_left=" + pop_left + ", pop_right=" + pop_right + ", pop_top=" + pop_top + "]";
	}
	
}
