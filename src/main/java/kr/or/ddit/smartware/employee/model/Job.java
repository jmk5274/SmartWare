package kr.or.ddit.smartware.employee.model;

public class Job {
	private String job_id;         // 직책 아이디
	private String job_nm;         // 직책명
	
	public Job() {	}

	public Job(String job_id, String job_nm) {
		super();
		this.job_id = job_id;
		this.job_nm = job_nm;
	}

	public String getJob_id() {
		return job_id;
	}

	public void setJob_id(String job_id) {
		this.job_id = job_id;
	}

	public String getJob_nm() {
		return job_nm;
	}

	public void setJob_nm(String job_nm) {
		this.job_nm = job_nm;
	}

	@Override
	public String toString() {
		return "Job [job_id=" + job_id + ", job_nm=" + job_nm + "]";
	}
	
}
