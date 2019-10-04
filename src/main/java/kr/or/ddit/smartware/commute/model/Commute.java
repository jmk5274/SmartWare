package kr.or.ddit.smartware.commute.model;

import java.util.Date;

public class Commute {

	private Date dt;		// 결과
	private Date gtw_tm;    // 날짜
	private Date ow_tm;     // 사원 아이디
	private String emp_id;	// 사유
	private String reas;    // 출근 시간
	private String res;     // 퇴근 시간
	
	public Commute() { }
	
	public Commute(Date dt, Date gtw_tm, Date ow_tm, String emp_id, String reas, String res) {
		this.dt = dt;
		this.gtw_tm = gtw_tm;
		this.ow_tm = ow_tm;
		this.emp_id = emp_id;
		this.reas = reas;
		this.res = res;
	}

	public Date getDt() {
		return dt;
	}
	public void setDt(Date dt) {
		this.dt = dt;
	}
	public Date getGtw_tm() {
		return gtw_tm;
	}
	public void setGtw_tm(Date gtw_tm) {
		this.gtw_tm = gtw_tm;
	}
	public Date getOw_tm() {
		return ow_tm;
	}
	public void setOw_tm(Date ow_tm) {
		this.ow_tm = ow_tm;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getReas() {
		return reas;
	}
	public void setReas(String reas) {
		this.reas = reas;
	}
	public String getRes() {
		return res;
	}
	public void setRes(String res) {
		this.res = res;
	}
	
	@Override
	public String toString() {
		return "Commute [dt=" + dt + ", gtw_tm=" + gtw_tm + ", ow_tm=" + ow_tm + ", emp_id=" + emp_id + ", reas=" + reas
				+ ", res=" + res + "]";
	}
	
}
