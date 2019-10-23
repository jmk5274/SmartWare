package kr.or.ddit.smartware.pms.model;

import java.util.Date;

public class Task {

	private String task_id;     	// 업무 아이디
	private String task_cont;   	// 업무 내용
	private Date st_dt;         	// 시작 날짜
	private Date end_dt;        	// 완료 날짜
	private String pro_id;      	// 프로젝트 아이디
	private String pa_task_id;  	// 상위 업무 아이디
	private int per;				// 진척도
	
	public Task() {	}
	
	public Task(Date end_dt, Date st_dt, String pa_task_id, String pro_id, String task_cont, String task_id, int per) {
		this.end_dt = end_dt;
		this.st_dt = st_dt;
		this.pa_task_id = pa_task_id;
		this.pro_id = pro_id;
		this.task_cont = task_cont;
		this.task_id = task_id;
		this.per = per;
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
	public String getPa_task_id() {
		return pa_task_id;
	}
	public void setPa_task_id(String pa_task_id) {
		this.pa_task_id = pa_task_id;
	}
	public String getPro_id() {
		return pro_id;
	}
	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}
	public String getTask_cont() {
		return task_cont;
	}
	public void setTask_cont(String task_cont) {
		this.task_cont = task_cont;
	}
	public String getTask_id() {
		return task_id;
	}
	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}
	public int getPer() {
		return per;
	}
	public void setPer(int per) {
		this.per = per;
	}
	
	@Override
	public String toString() {
		return "Task [end_dt=" + end_dt + ", st_dt=" + st_dt + ", pa_task_id=" + pa_task_id + ", pro_id=" + pro_id
				+ ", task_cont=" + task_cont + ", task_id=" + task_id + ", per=" + per + "]";
	}
	
}
