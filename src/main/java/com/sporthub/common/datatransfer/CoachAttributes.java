package com.sporthub.common.datatransfer;

import java.util.ArrayList;
import java.util.List;

import com.sporthub.storage.dao.CoachDAO;
import com.sporthub.storage.dao.CoachDAOImp;
import com.sporthub.storage.entity.Coach;

public class CoachAttributes extends EntityAttributes {

	private int id;
	
	
	
	public CoachAttributes() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CoachAttributes(int id) {
		super();
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
		CoachDAO cdao = new CoachDAOImp();
		Coach coachObj = cdao.getCoachById(id);
		return coachObj;
	}

}
