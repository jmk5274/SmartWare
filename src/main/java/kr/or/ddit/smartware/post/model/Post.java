package kr.or.ddit.smartware.post.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Post {
	private String post_id;       //게시글 아이디
	private String board_id;      //게시판 아이디
	private String title;         //제목
	private String cont;          //내용
	private String emp_id;        //사원 아이디
	@DateTimeFormat
	private Date reg_dt;          //등록 날짜
	private String able;          //삭제 여부
	private String pa_post_id;    //부모 게시글 아이디
	private int gn; 			  //그룹넘버
	private int level;
	
	public Post() {}

	public Post(String post_id, String board_id, String title, String cont, String emp_id, Date reg_dt, String able,
			String pa_post_id, int gn, int level) {
		super();
		this.post_id = post_id;
		this.board_id = board_id;
		this.title = title;
		this.cont = cont;
		this.emp_id = emp_id;
		this.reg_dt = reg_dt;
		this.able = able;
		this.pa_post_id = pa_post_id;
		this.gn = gn;
		this.level = level;
	}

	public String getPost_id() {
		return post_id;
	}

	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getPa_post_id() {
		return pa_post_id;
	}

	public void setPa_post_id(String pa_post_id) {
		this.pa_post_id = pa_post_id;
	}

	public int getGn() {
		return gn;
	}

	public void setGn(int gn) {
		this.gn = gn;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

}
