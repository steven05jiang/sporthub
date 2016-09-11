package com.sporthub.webservice.template;

public class UserEmailCheck extends Result {

	private boolean available;
	
	public boolean getAvailable() {
		return available;
	}
	public void setAvailable(boolean available) {
		this.available = available;
	}
	public UserEmailCheck(String code, String description, boolean available) {
		super(code, description);
		this.available = available;
	}
	public UserEmailCheck() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserEmailCheck(String code, String description) {
		super(code, description);
		// TODO Auto-generated constructor stub
	}
}
