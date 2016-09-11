package com.sporthub.webservice.template;

public class Result {

	private String code;
	private String description;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Result(String code, String description) {
		super();
		this.code = code;
		this.description = description;
	}
	public Result() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
