package kr.or.ddit.smartware.board.model;

import java.util.Date;

public class Board {

	private Date reg_dt;		// 게시판 아이디
	private String able;    	// 게시판 이름
	private String board_id;	// 등록 날짜
	private String board_nm;	// 사용 여부
	private String emp_id;  	// 사원 아이디
	
	public Board() { }
	
	public Board(Date reg_dt, String able, String board_id, String board_nm, String emp_id) {
		this.reg_dt = reg_dt;
		this.able = able;
		this.board_id = board_id;
		this.board_nm = board_nm;
		this.emp_id = emp_id;
	}

	public Date getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getAble() {
		return able;
	}
	public void setAble(String able) {
		this.able = able;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getBoard_nm() {
		return board_nm;
	}
	public void setBoard_nm(String board_nm) {
		this.board_nm = board_nm;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	
	@Override
	public String toString() {
		return "Board [reg_dt=" + reg_dt + ", able=" + able + ", board_id=" + board_id + ", board_nm=" + board_nm
				+ ", emp_id=" + emp_id + "]";
	}
	
}
