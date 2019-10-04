package kr.or.ddit.smartware.employee.model;

public class Department {

	private String depart_id;	// 부서 아이디
	private String depart_nm;	// 부서 이름
	
	public Department() { }
	
	public Department(String depart_id, String depart_nm) {
		this.depart_id = depart_id;
		this.depart_nm = depart_nm;
	}

	public String getDepart_id() {
		return depart_id;
	}
	public void setDepart_id(String depart_id) {
		this.depart_id = depart_id;
	}
	public String getDepart_nm() {
		return depart_nm;
	}
	public void setDepart_nm(String depart_nm) {
		this.depart_nm = depart_nm;
	}
	
	@Override
	public String toString() {
		return "Department [depart_id=" + depart_id + ", depart_nm=" + depart_nm + "]";
	}
	
}
