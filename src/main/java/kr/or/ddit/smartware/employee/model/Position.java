package kr.or.ddit.smartware.employee.model;

public class Position {

	private String posi_id;		// 직책 아이디
	private String posi_nm; 	// 직책 이름
	
	public Position() { }
	
	public Position(String posi_id, String posi_nm) {
		this.posi_id = posi_id;
		this.posi_nm = posi_nm;
	}

	public String getPosi_id() {
		return posi_id;
	}
	public void setPosi_id(String posi_id) {
		this.posi_id = posi_id;
	}
	public String getPosi_nm() {
		return posi_nm;
	}
	public void setPosi_nm(String posi_nm) {
		this.posi_nm = posi_nm;
	}
	
	@Override
	public String toString() {
		return "Position [posi_id=" + posi_id + ", posi_nm=" + posi_nm + "]";
	}
	
}
