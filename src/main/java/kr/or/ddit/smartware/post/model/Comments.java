package kr.or.ddit.smartware.post.model;

public class Comments {
	private String com_id;         //댓글 아이디
	private String post_id;        //게시글 아이디
	private String emp_id;         //사원 아이디
	private String reg_dt;         //등록 날짜
	private String cont;           //내용
	private String able;           //삭제 여부
	private String pa_com_id;      //부모 댓글 아이디
	
	public Comments() {}
	
	public Comments(String com_id, String post_id, String emp_id, String reg_dt, String cont, String able,
			String pa_com_id) {
		super();
		this.com_id = com_id;
		this.post_id = post_id;
		this.emp_id = emp_id;
		this.reg_dt = reg_dt;
		this.cont = cont;
		this.able = able;
		this.pa_com_id = pa_com_id;
	}
	
	public String getCom_id() {
		return com_id;
	}
	public void setCom_id(String com_id) {
		this.com_id = com_id;
	}
	public String getPost_id() {
		return post_id;
	}
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getAble() {
		return able;
	}
	public void setAble(String able) {
		this.able = able;
	}
	public String getPa_com_id() {
		return pa_com_id;
	}
	public void setPa_com_id(String pa_com_id) {
		this.pa_com_id = pa_com_id;
	}
	
	
	
	
}
