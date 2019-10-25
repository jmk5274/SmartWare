package kr.or.ddit.smartware.pms.model;

import java.util.Date;

public class TaskHistory {

	private String history_id;	// 변경 내역 아이디
	private String task_id;		// 업무 아이디
	private String emp_id;		// 사원 아이디
	private String history;		// 변경 내역
	private Date change_dt;		// 변경 날짜
	
	public TaskHistory() { }

	public TaskHistory(String history_id, String task_id, String emp_id, String history, Date change_dt) {
		super();
		this.history_id = history_id;
		this.task_id = task_id;
		this.emp_id = emp_id;
		this.history = history;
		this.change_dt = change_dt;
	}

	public String getHistory_id() {
		return history_id;
	}
	public void setHistory_id(String history_id) {
		this.history_id = history_id;
	}
	public String getTask_id() {
		return task_id;
	}
	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getHistory() {
		return history;
	}
	public void setHistory(String history) {
		this.history = history;
	}
	public Date getChange_dt() {
		return change_dt;
	}
	public void setChange_dt(Date change_dt) {
		this.change_dt = change_dt;
	}

	@Override
	public String toString() {
		return "TaskHistory [history_id=" + history_id + ", task_id=" + task_id + ", emp_id=" + emp_id + ", history="
				+ history + ", change_dt=" + change_dt + "]";
	}
	
}
