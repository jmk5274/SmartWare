package kr.or.ddit.smartware.email.model;

public class Email {
	private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Email [email=" + email + "]";
	}

	public Email(String email) {
		super();
		this.email = email;
	}

	public Email() {
		super();
	}

	
	
}
