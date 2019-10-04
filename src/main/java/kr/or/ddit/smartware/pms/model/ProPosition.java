package kr.or.ddit.smartware.pms.model;

public class ProPosition {

	private String emp_id;  	// 사원 아이디
	private String posi_id; 	// 직책 아이디
	private String pro_id;		// 프로젝트 아이디
	
	public ProPosition() { }
	
	public ProPosition(String emp_id, String posi_id, String pro_id) {
		this.emp_id = emp_id;
		this.posi_id = posi_id;
		this.pro_id = pro_id;
	}

	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getPosi_id() {
		return posi_id;
	}
	public void setPosi_id(String posi_id) {
		this.posi_id = posi_id;
	}
	public String getPro_id() {
		return pro_id;
	}
	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}
	
	@Override
	public String toString() {
		return "ProPosition [emp_id=" + emp_id + ", posi_id=" + posi_id + ", pro_id=" + pro_id + "]";
	}
}
