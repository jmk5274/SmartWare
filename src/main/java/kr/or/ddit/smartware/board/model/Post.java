package kr.or.ddit.smartware.board.model;

import java.util.Date;

public class Post {

	private Date reg_dt;        	// 게시글 아이디
	private String able;        	// 게시판 아이디
	private String board_id;    	// 내용
	private String cont;        	// 등록 날짜
	private String emp_id;      	// 부모 게시글 아이디
	private String pa_post_id;  	// 사원 아이디
	private String post_id;     	// 삭제 여부
	private String title;			// 제목
	
	public Post() { }
	
	public Post(Date reg_dt, String able, String board_id, String cont, String emp_id, String pa_post_id,
			String post_id, String title) {
		this.reg_dt = reg_dt;
		this.able = able;
		this.board_id = board_id;
		this.cont = cont;
		this.emp_id = emp_id;
		this.pa_post_id = pa_post_id;
		this.post_id = post_id;
		this.title = title;
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
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
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
	public String getPa_post_id() {
		return pa_post_id;
	}
	public void setPa_post_id(String pa_post_id) {
		this.pa_post_id = pa_post_id;
	}
	public String getPost_id() {
		return post_id;
	}
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Override
	public String toString() {
		return "Post [reg_dt=" + reg_dt + ", able=" + able + ", board_id=" + board_id + ", cont=" + cont + ", emp_id="
				+ emp_id + ", pa_post_id=" + pa_post_id + ", post_id=" + post_id + ", title=" + title + "]";
	}
	
}
