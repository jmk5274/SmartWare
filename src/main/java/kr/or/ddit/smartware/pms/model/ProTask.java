package kr.or.ddit.smartware.pms.model;

public class ProTask {

	private String emp_id;  	// 사원 아이디
	private String task_id;		// 업무 아이디
	private String pro_id;  	// 프로젝트 아이디
	
	public ProTask() {	}
	
	public ProTask(String emp_id, String pro_id, String task_id) {
		this.emp_id = emp_id;
		this.pro_id = pro_id;
		this.task_id = task_id;
	}

	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getPro_id() {
		return pro_id;
	}
	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}
	public String getTask_id() {
		return task_id;
	}
	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}
	
	@Override
	public String toString() {
		return "Task [emp_id=" + emp_id + ", pro_id=" + pro_id + ", task_id=" + task_id + "]";
	}
	
}
