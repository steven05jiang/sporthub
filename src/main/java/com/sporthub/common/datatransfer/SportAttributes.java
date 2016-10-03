package com.sporthub.common.datatransfer;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sporthub.storage.dao.SportDAO;
import com.sporthub.storage.dao.SportDAOImp;
import com.sporthub.storage.entity.Sport;

public class SportAttributes extends EntityAttributes {
	
	private int id;
	private String name;
	private String description;
	private Date createDate;
	
	public SportAttributes(){
		super();
	}
	
	public SportAttributes(Sport sport){
		this.id = sport.getId();
		this.name = sport.getName();
		this.description = sport.getDescription();
		this.createDate = sport.getCreateDate();
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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public List<String> getInvalidInfo() {
		List<String> errors = new ArrayList<String>();
		//String error;
		
		return errors;
	}

	@Override
	public Object toEntity(Boolean isNew) {
		Sport sport = null;
		if(!isNew){
			SportDAO sdao = new SportDAOImp(session);
			sport = sdao.getSportById(id);
		}else{
			sport = new Sport();
			sport.setCreateDate(new Timestamp(sport.getCreateDate().getTime()));
		}
		
		sport.setName(name);
		sport.setDescription(description);
		return sport;
	}

}
