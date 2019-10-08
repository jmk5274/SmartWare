package kr.or.ddit.smartware.calendar.model;

import java.util.Date;

public class Calendar {

	private String cal_id;   	// 일정 아이디
	private String cal_title;	// 일정 제목
	private String cal_cont; 	// 일정 내용
	private Date st_dt;      	// 시작 날짜
	private Date end_dt;	 	// 완료 날짜
	private String allday;		// 종일
	private String depart_id;	// 부서 아이디
	private String emp_id;		// 사원 아이디
	private String category_id; // 카테고리 아이디
	
	public Calendar() { }
	
	public Calendar(String cal_id, String cal_title, String cal_cont, Date st_dt, Date end_dt, String allday,
			String depart_id, String emp_id, String category_id) {
		this.cal_id = cal_id;
		this.cal_title = cal_title;
		this.cal_cont = cal_cont;
		this.st_dt = st_dt;
		this.end_dt = end_dt;
		this.allday = allday;
		this.depart_id = depart_id;
		this.emp_id = emp_id;
		this.category_id = category_id;
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
	public String getCal_cont() {
		return cal_cont;
	}
	public void setCal_cont(String cal_cont) {
		this.cal_cont = cal_cont;
	}
	public Date getSt_dt() {
		return st_dt;
	}
	public void setSt_dt(Date st_dt) {
		this.st_dt = st_dt;
	}
	public Date getEnd_dt() {
		return end_dt;
	}
	public void setEnd_dt(Date end_dt) {
		this.end_dt = end_dt;
	}
	public String getDepart_id() {
		return depart_id;
	}
	public void setDepart_id(String depart_id) {
		this.depart_id = depart_id;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String getAllday() {
		return allday;
	}
	public void setAllday(String allday) {
		this.allday = allday;
	}

	@Override
	public String toString() {
		return "Calendar [cal_id=" + cal_id + ", cal_title=" + cal_title + ", cal_cont=" + cal_cont + ", st_dt=" + st_dt
				+ ", end_dt=" + end_dt + ", allday=" + allday + ", depart_id=" + depart_id + ", emp_id=" + emp_id
				+ ", category_id=" + category_id + "]";
	}
	
}
