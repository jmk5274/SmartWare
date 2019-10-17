package kr.or.ddit.smartware.employee.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import kr.or.ddit.smartware.util.encrypt.kisa.sha256.KISA_SHA256;

public class Employee {

	private String emp_id;			//사원 아이디
	private String pass;            //비밀번호
	private String emp_nm;          //사원 이름
	private String rank;            //등급
	private String email;           //이메일
	private String tel;             //전화번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date join_dt;           //입사 날짜
	private String depart_id;       //부서 아이디
	private String posi_id;         //직책 아이디
	private String emp_pic;         //사원 사진
	private String sign;            //서명
	private String able;            //사용 여부
	private String email_pass; 		//이메일 비밀번호
	private String c_use;			//채팅방 참가 여부(DB컬럼으로 필요없음)
	private String chat_id;			//채팅방 번호(DB컬럼으로 필요없음) 
	
	public Employee() { }

	public Employee(String emp_id, String pass, String emp_nm, String rank, String email, String tel, Date join_dt,
			String depart_id, String posi_id, String emp_pic, String sign, String able, String email_pass, String c_use,
			String chat_id) {
		this.emp_id = emp_id;
		this.pass = pass;
		this.emp_nm = emp_nm;
		this.rank = rank;
		this.email = email;
		this.tel = tel;
		this.join_dt = join_dt;
		this.depart_id = depart_id;
		this.posi_id = posi_id;
		this.emp_pic = emp_pic;
		this.sign = sign;
		this.able = able;
		this.email_pass = email_pass;
		this.c_use = c_use;
		this.chat_id = chat_id;
	}

	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmp_nm() {
		return emp_nm;
	}
	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Date getJoin_dt() {
		return join_dt;
	}
	public void setJoin_dt(Date join_dt) {
		this.join_dt = join_dt;
	}
	public String getDepart_id() {
		return depart_id;
	}
	public void setDepart_id(String depart_id) {
		this.depart_id = depart_id;
	}
	public String getPosi_id() {
		return posi_id;
	}
	public void setPosi_id(String posi_id) {
		this.posi_id = posi_id;
	}
	public String getEmp_pic() {
		return emp_pic;
	}
	public void setEmp_pic(String emp_pic) {
		this.emp_pic = emp_pic;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public String getAble() {
		return able;
	}
	public void setAble(String able) {
		this.able = able;
	}
	public String getEmail_pass() {
		return email_pass;
	}
	public void setEmail_pass(String email_pass) {
		this.email_pass = email_pass;
	}
	public String getC_use() {
		return c_use;
	}
	public void setC_use(String c_use) {
		this.c_use = c_use;
	}
	public String getChat_id() {
		return chat_id;
	}
	public void setChat_id(String chat_id) {
		this.chat_id = chat_id;
	}

	@Override
	public String toString() {
		return "Employee [emp_id=" + emp_id + ", pass=" + pass + ", emp_nm=" + emp_nm + ", rank=" + rank + ", email="
				+ email + ", tel=" + tel + ", join_dt=" + join_dt + ", depart_id=" + depart_id + ", posi_id=" + posi_id
				+ ", emp_pic=" + emp_pic + ", sign=" + sign + ", able=" + able + ", email_pass=" + email_pass
				+ ", c_use=" + c_use + ", chat_id=" + chat_id + "]";
	}
	
	public boolean checkLoginValidate(String emp_id, String pass) {
		// 암호화 문장끼리 비교
//		if(emp_id.equals(this.emp_id) && KISA_SHA256.encrypt(pass).equals(this.pass))
		if(emp_id.equals(this.emp_id) && pass.equals(this.pass))
			return true;
		
		return false;
	}


}
