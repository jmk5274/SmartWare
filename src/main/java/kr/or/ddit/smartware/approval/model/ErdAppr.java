package kr.or.ddit.smartware.approval.model;

public class ErdAppr {

	private String appr_line_id;    	// 결재선 소유자
	private String appr_line_owner;		// 결재선 아이디
	
	public ErdAppr() { }
	
	public ErdAppr(String appr_line_id, String appr_line_owner) {
		this.appr_line_id = appr_line_id;
		this.appr_line_owner = appr_line_owner;
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
	
	@Override
	public String toString() {
		return "ErdAppr [appr_line_id=" + appr_line_id + ", appr_line_owner=" + appr_line_owner + "]";
	}
	
}
