package kr.or.ddit.smartware.board.model;

public class PostFile {

	private String file_id;     	// 게시글 아이디
	private String file_nm;     	// 실제파일경로
	private String post_id;     	// 파일 아이디
	private String realfilepath;	// 파일 이름
	
	public PostFile() {	}
	
	public PostFile(String file_id, String file_nm, String post_id, String realfilepath) {
		this.file_id = file_id;
		this.file_nm = file_nm;
		this.post_id = post_id;
		this.realfilepath = realfilepath;
	}

	public String getFile_id() {
		return file_id;
	}
	public void setFile_id(String file_id) {
		this.file_id = file_id;
	}
	public String getFile_nm() {
		return file_nm;
	}
	public void setFile_nm(String file_nm) {
		this.file_nm = file_nm;
	}
	public String getPost_id() {
		return post_id;
	}
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	public String getRealfilepath() {
		return realfilepath;
	}
	public void setRealfilepath(String realfilepath) {
		this.realfilepath = realfilepath;
	}
	
	@Override
	public String toString() {
		return "PostFile [file_id=" + file_id + ", file_nm=" + file_nm + ", post_id=" + post_id + ", realfilepath="
				+ realfilepath + "]";
	}
	
}
