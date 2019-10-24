package kr.or.ddit.smartware.pms.model;

import java.util.Date;

public class Project {

	private String pro_id;      	// 프로젝트 아이디
	private String pro_nm;			// 프로젝트 이름
	private Date st_dt;         	// 시작 날짜
	private Date end_dt;        	// 완료 날짜
	private String pa_pro_id;   	// 상위 프로젝트 아이디
	
	public Project() { }
	
	public Project(Date end_dt, Date st_dt, String pa_pro_id, String pro_id, String pro_nm) {
		this.end_dt = end_dt;
		this.st_dt = st_dt;
		this.pa_pro_id = pa_pro_id;
		this.pro_id = pro_id;
		this.pro_nm = pro_nm;
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
	public String getPa_pro_id() {
		return pa_pro_id;
	}
	public void setPa_pro_id(String pa_pro_id) {
		this.pa_pro_id = pa_pro_id;
	}
	public String getPro_id() {
		return pro_id;
	}
	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}
	public String getPro_nm() {
		return pro_nm;
	}
	public void setPro_nm(String pro_nm) {
		this.pro_nm = pro_nm;
	}
	
	@Override
	public String toString() {
		return "Project [end_dt=" + end_dt + ", st_dt=" + st_dt + ", pa_pro_id=" + pa_pro_id + ", pro_id=" + pro_id
				+ ", pro_nm=" + pro_nm + "]";
	}
	
}
