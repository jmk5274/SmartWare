package kr.or.ddit.smartware.board.model;

import java.util.Date;

public class Board {

	private String board_id;	 //게시판 아이디
	private String emp_id;  	 //사원 아이디
	private String board_nm;	 //게시판 이름
	private Date reg_dt;		 //등록 날짜
	private String able;    	 //사용 여부
	
	public Board() { }

	public Board(String board_id, String emp_id, String board_nm, Date reg_dt, String able) {
		super();
		this.board_id = board_id;
		this.emp_id = emp_id;
		this.board_nm = board_nm;
		this.reg_dt = reg_dt;
		this.able = able;
	}

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	public String getBoard_nm() {
		return board_nm;
	}

	public void setBoard_nm(String board_nm) {
		this.board_nm = board_nm;
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

	@Override
	public String toString() {
		return "Board [board_id=" + board_id + ", emp_id=" + emp_id + ", board_nm=" + board_nm + ", reg_dt=" + reg_dt
				+ ", able=" + able + "]";
	}
	
}
