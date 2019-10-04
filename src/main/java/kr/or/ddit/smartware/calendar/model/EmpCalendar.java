package kr.or.ddit.smartware.calendar.model;

import java.util.Date;

public class EmpCalendar {

	private Date end_dt;        // 사원 아이디
	private Date st_dt;         // 시작 날짜
	private String cal_cont;    // 완료 날짜
	private String cal_id;      // 일정 내용
	private String cal_title;   // 일정 아이디
	private String emp_id;		// 일정 제목
	
	public EmpCalendar() { }
	
	public EmpCalendar(Date end_dt, Date st_dt, String cal_cont, String cal_id, String cal_title, String emp_id) {
		this.end_dt = end_dt;
		this.st_dt = st_dt;
		this.cal_cont = cal_cont;
		this.cal_id = cal_id;
		this.cal_title = cal_title;
		this.emp_id = emp_id;
	}

	public Date getEnd_dt() {
		return end_dt;
	}
	public void setEnd_dt(Date end_dt) {
		this.end_dt = end_dt;
	}
	public Date getSt_dt() {
		return st_dt;
	}
	public void setSt_dt(Date st_dt) {
		this.st_dt = st_dt;
	}
	public String getCal_cont() {
		return cal_cont;
	}
	public void setCal_cont(String cal_cont) {
		this.cal_cont = cal_cont;
	}
	public String getCal_id() {
		return cal_id;
	}
	public void setCal_id(String cal_id) {
		this.cal_id = cal_id;
	}
	public String getCal_title() {
		return cal_title;
	}
	public void setCal_title(String cal_title) {
		this.cal_title = cal_title;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	
	@Override
	public String toString() {
		return "EmpCalendar [end_dt=" + end_dt + ", st_dt=" + st_dt + ", cal_cont=" + cal_cont + ", cal_id=" + cal_id
				+ ", cal_title=" + cal_title + ", emp_id=" + emp_id + "]";
	}
	
}
