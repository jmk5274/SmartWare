package kr.or.ddit.smartware.approval.model;

import java.util.Date;

public class Application {
	
	private Date reg_dt;		// 내용
	private String appl_id;     // 등록 날짜
	private String cont;        // 사원 아이디
	private String emp_id;      // 신청서 아이디
	private String form_id;     // 양식 아이디
	private String title;		// 제목
	private String proceed;		// 진행 여부
	private String refer;		// 반려 여부
	private String refer_res;	// 반려 사유
	private String refer_emp;   // 반려자
	
	public Application() { }

	public Application(Date reg_dt, String appl_id, String cont, String emp_id, String form_id, String title, String proceed, String refer, String refer_res, String refer_emp) {
		this.reg_dt = reg_dt;
		this.appl_id = appl_id;
		this.cont = cont;
		this.emp_id = emp_id;
		this.form_id = form_id;
		this.title = title;
		this.proceed = proceed;
		this.refer = refer;
		this.refer_res = refer_res;
		this.refer_emp = refer_emp;
	}

	public Date getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getAppl_id() {
		return appl_id;
	}

	public void setAppl_id(String appl_id) {
		this.appl_id = appl_id;
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

	public String getForm_id() {
		return form_id;
	}

	public void setForm_id(String form_id) {
		this.form_id = form_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getProceed() {
		return proceed;
	}

	public void setProceed(String proceed) {
		this.proceed = proceed;
	}

	public String getRefer() {
		return refer;
	}

	public void setRefer(String refer) {
		this.refer = refer;
	}

	public String getRefer_res() {
		return refer_res;
	}

	public void setRefer_res(String refer_res) {
		this.refer_res = refer_res;
	}

	public String getRefer_emp() {
		return refer_emp;
	}

	public void setRefer_emp(String refer_emp) {
		this.refer_emp = refer_emp;
	}

	@Override
	public String toString() {
		return "Application{" +
				"reg_dt=" + reg_dt +
				", appl_id='" + appl_id + '\'' +
				", cont='" + cont + '\'' +
				", emp_id='" + emp_id + '\'' +
				", form_id='" + form_id + '\'' +
				", title='" + title + '\'' +
				", proceed='" + proceed + '\'' +
				", refer='" + refer + '\'' +
				", refer_res='" + refer_res + '\'' +
				", refer_emp='" + refer_emp + '\'' +
				'}';
	}
}
