package kr.or.ddit.smartware.approval.model;

public class Form {

	private String appr_line_id;	// 결재선 아이디
	private String form_cont;   	// 양식 내용
	private String form_id;     	// 양식 아이디
	private String form_nm;     	// 양식 이름
	
	public Form() {	}
	
	public Form(String appr_line_id, String form_cont, String form_id, String form_nm) {
		this.appr_line_id = appr_line_id;
		this.form_cont = form_cont;
		this.form_id = form_id;
		this.form_nm = form_nm;
	}

	public String getAppr_line_id() {
		return appr_line_id;
	}
	public void setAppr_line_id(String appr_line_id) {
		this.appr_line_id = appr_line_id;
	}
	public String getForm_cont() {
		return form_cont;
	}
	public void setForm_cont(String form_cont) {
		this.form_cont = form_cont;
	}
	public String getForm_id() {
		return form_id;
	}
	public void setForm_id(String form_id) {
		this.form_id = form_id;
	}
	public String getForm_nm() {
		return form_nm;
	}
	public void setForm_nm(String form_nm) {
		this.form_nm = form_nm;
	}
	
	@Override
	public String toString() {
		return "Form [appr_line_id=" + appr_line_id + ", form_cont=" + form_cont + ", form_id=" + form_id + ", form_nm="
				+ form_nm + "]";
	}
	
}
