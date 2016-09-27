package com.sporthub.ui.template;

import com.sporthub.common.datatransfer.UserAttributes;

public class UserTemplate extends Result {

	private UserAttributes user;

	public UserAttributes getUser() {
		return user;
	}

	public void setUser(UserAttributes user) {
		this.user = user;
	}

	public UserTemplate(String code, String description, UserAttributes user) {
		super(code, description);
		this.user = user;
	}

	public UserTemplate() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserTemplate(String code, String description) {
		super(code, description);
		// TODO Auto-generated constructor stub
	}
	
	
}
