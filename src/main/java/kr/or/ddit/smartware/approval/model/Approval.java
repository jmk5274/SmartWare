package kr.or.ddit.smartware.approval.model;

public class Approval {


	private String appr_line_id;	// 결재선 아이디
	private String appr_line_nm;	// 결재선 이름
	
	public Approval() {	}
	
	public Approval(String appr_line_id, String appr_line_nm) {
		this.appr_line_id = appr_line_id;
		this.appr_line_nm = appr_line_nm;
	}

	public String getAppr_line_id() {
		return appr_line_id;
	}
	public void setAppr_line_id(String appr_line_id) {
		this.appr_line_id = appr_line_id;
	}
	public String getAppr_line_nm() {
		return appr_line_nm;
	}
	public void setAppr_line_nm(String appr_line_nm) {
		this.appr_line_nm = appr_line_nm;
	}
	
	@Override
	public String toString() {
		return "Approval [appr_line_id=" + appr_line_id + ", appr_line_nm=" + appr_line_nm + "]";
	}
	
}
