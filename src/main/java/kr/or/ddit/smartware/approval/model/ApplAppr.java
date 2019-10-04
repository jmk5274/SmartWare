package kr.or.ddit.smartware.approval.model;

public class ApplAppr {

	private String appl_id;     // 신청서 아이디
	private String appr_emp;    // 결재 사원
	private int ap_order;       // 우선순위
	private String able;		// 결재여부
	
	public ApplAppr() { }
	
	public ApplAppr(String appl_id, String appr_emp, int ap_order, String able) {
		this.appl_id = appl_id;
		this.appr_emp = appr_emp;
		this.ap_order = ap_order;
		this.able = able;
	}
	
	public String getAppl_id() {
		return appl_id;
	}
	public void setAppl_id(String appl_id) {
		this.appl_id = appl_id;
	}
	public String getAppr_emp() {
		return appr_emp;
	}
	public void setAppr_emp(String appr_emp) {
		this.appr_emp = appr_emp;
	}
	public int getAp_order() {
		return ap_order;
	}
	public void setAp_order(int ap_order) {
		this.ap_order = ap_order;
	}
	public String getAble() {
		return able;
	}
	public void setAble(String able) {
		this.able = able;
	}

	@Override
	public String toString() {
		return "ApplAppr [appl_id=" + appl_id + ", appr_emp=" + appr_emp + ", ap_order=" + ap_order + ", able=" + able
				+ "]";
	}
	
}
