package kr.or.ddit.smartware.approval.model;

public class ApprMember {

	private String appr_emp;			// 결재 사원
	private String appr_line_id;        // 결재선 소유자
	private String appr_line_owner;     // 결재선 아이디
	private int ap_order;               // 우선순위
	
	public ApprMember() { }
	
	public ApprMember(String appr_emp, String appr_line_id, String appr_line_owner, int ap_order) {
		this.appr_emp = appr_emp;
		this.appr_line_id = appr_line_id;
		this.appr_line_owner = appr_line_owner;
		this.ap_order = ap_order;
	}

	public String getAppr_emp() {
		return appr_emp;
	}
	public void setAppr_emp(String appr_emp) {
		this.appr_emp = appr_emp;
	}
	public String getAppr_line_id() {
		return appr_line_id;
	}
	public void setAppr_line_id(String appr_line_id) {
		this.appr_line_id = appr_line_id;
	}
	public String getAppr_line_owner() {
		return appr_line_owner;
	}
	public void setAppr_line_owner(String appr_line_owner) {
		this.appr_line_owner = appr_line_owner;
	}
	public int getAp_order() {
		return ap_order;
	}
	public void setAp_order(int ap_order) {
		this.ap_order = ap_order;
	}
	
	@Override
	public String toString() {
		return "ApprMember [appr_emp=" + appr_emp + ", appr_line_id=" + appr_line_id + ", appr_line_owner="
				+ appr_line_owner + ", ap_order=" + ap_order + "]";
	}
	
}
