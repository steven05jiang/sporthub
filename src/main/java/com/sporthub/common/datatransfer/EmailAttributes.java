package com.sporthub.common.datatransfer;

import java.util.ArrayList;
import java.util.List;

public class EmailAttributes extends EntityAttributes {

	private String email;
	
	
	
	public EmailAttributes() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EmailAttributes(String email) {
		super();
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public List<String> getInvalidInfo() {
		List<String> errors = new ArrayList<String>();
		//String error;
		return errors;
	}

	@Override
	public Object toEntity() {
		// TODO Auto-generated method stub
		return null;
	}

}
