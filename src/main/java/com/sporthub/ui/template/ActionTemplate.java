package com.sporthub.ui.template;

import java.util.Date;

import com.sporthub.common.datatransfer.ActionAttributes;

public class ActionTemplate {
	private int id;
	private String name;
	private String description;
	private Date time;
	private int repeat;
	private int quantity;
	private String unit;
	private int planId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getRepeat() {
		return repeat;
	}
	public void setRepeat(int repeat) {
		this.repeat = repeat;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public int getPlanId() {
		return planId;
	}
	public void setPlanId(int planId) {
		this.planId = planId;
	}
	public ActionTemplate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ActionTemplate(ActionAttributes action) {
		super();
		this.id = action.getId();
		this.name = action.getName();
		this.description = action.getDescription();
		this.time = action.getTime();
		this.repeat = action.getRepeat();
		this.quantity = action.getQuantity();
		this.unit = action.getUnit();
		this.planId = action.getPlanId();
	}
	
	
}
