package com.sporthub.ui.template;

import java.util.Date;

import com.sporthub.common.datatransfer.PlanAttributes;

public class PlanTemplate {
	private String name;
	private String description;
	private Date createDate;
	private Date expireDate;
	//0 for uncompleted, 1 for completed
	private int complete;
	private String user;
	private String coach;
	private String sport;
	
	public PlanTemplate() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public PlanTemplate(PlanAttributes plan) {
		super();
		this.name = plan.getName();
		this.description = plan.getDescription();
		this.createDate = plan.getCreateDate();
		this.expireDate = plan.getExpireDate();
		this.complete = plan.getComplete();
		this.user = plan.getUser();
		this.coach = plan.getCoach();
		this.sport = plan.getSport();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getExpireDate() {
		return expireDate;
	}

	public void setExpireDate(Date expireDate) {
		this.expireDate = expireDate;
	}

	public int getComplete() {
		return complete;
	}

	public void setComplete(int complete) {
		this.complete = complete;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getCoach() {
		return coach;
	}

	public void setCoach(String coach) {
		this.coach = coach;
	}

	public String getSport() {
		return sport;
	}

	public void setSport(String sport) {
		this.sport = sport;
	}
	
	
}
