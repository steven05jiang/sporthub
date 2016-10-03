package com.sporthub.ui.template;

import com.sporthub.common.datatransfer.UserAttributes;

public class UserTemplate{

	private UserAttributes user;

	public UserAttributes getUser() {
		return user;
	}

	public void setUser(UserAttributes user) {
		this.user = user;
	}

	public UserTemplate(UserAttributes user) {
		super();
		this.user = user;
	}

	public UserTemplate() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
}
