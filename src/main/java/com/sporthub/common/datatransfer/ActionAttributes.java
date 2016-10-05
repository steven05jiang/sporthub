package com.sporthub.common.datatransfer;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sporthub.storage.dao.ActionDAO;
import com.sporthub.storage.dao.ActionDAOImp;
import com.sporthub.storage.dao.PlanDAO;
import com.sporthub.storage.dao.PlanDAOImp;
import com.sporthub.storage.entity.Action;

public class ActionAttributes extends EntityAttributes {
	
	private int id;
	private String name;
	private String description;
	private Date time;
	private int repeat;
	private int quantity;
	private String unit;
	private int planId;
	
	public ActionAttributes(Action action) {
		super();
		this.id = action.getId();
		this.name = action.getName();
		this.description = action.getDescription();
		this.time = action.getTime();
		this.repeat = action.getRepeat();
		this.quantity = action.getQuantity();
		this.unit = action.getUnit();
		this.planId = action.getPlan().getId();
	}

	public ActionAttributes() {
		super();
		// TODO Auto-generated constructor stub
	}

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

	public void setTime(Timestamp time) {
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

	@Override
	public List<String> getInvalidInfo() {
		List<String> errors = new ArrayList<String>();
		//String error;
		
		return errors;
	}

	@Override
	public Object toEntity(Boolean isNew) {
		Action action = null;
		ActionDAO adao = new ActionDAOImp(session);
		if(!isNew){
			action = adao.getActionById(id);
		}else{
			action = new Action();
			PlanDAO pdao = new PlanDAOImp(session);
			action.setPlan(pdao.getPlanById(planId));
		}
		action.setName(name);
		action.setDescription(description);
		action.setTime(new Timestamp(time.getTime()));
		action.setRepeat(repeat);
		action.setQuantity(quantity);
		action.setUnit(unit);
		return action;
	}

	@Override
	public void sanitizeForDeleting(Object obj) {
		Action action = (Action)obj;
		action.getPlan().getActions().remove(action);
	}

}
