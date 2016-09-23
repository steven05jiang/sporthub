package com.sporthub.common.datatransfer;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sporthub.storage.dao.CoachDAO;
import com.sporthub.storage.dao.CoachDAOImp;
import com.sporthub.storage.dao.SportDAO;
import com.sporthub.storage.dao.SportDAOImp;
import com.sporthub.storage.dao.UserDAO;
import com.sporthub.storage.dao.UserDAOImp;
import com.sporthub.storage.entity.Coach;
import com.sporthub.storage.entity.Plan;
import com.sporthub.storage.entity.Sport;
import com.sporthub.storage.entity.User;

public class PlanAttributes extends EntityAttributes {

	private int id;
	private String name;
	private String description;
	private Timestamp createDate;
	private Timestamp expireDate;
	private int complete;
	private String user;
	private String coach;
	private String sport;
	
	
	
	public PlanAttributes() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PlanAttributes(int id, String name, String description, Timestamp createDate, Timestamp expireDate, int complete,
			String user, String coach, String sport) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.createDate = createDate;
		this.expireDate = expireDate;
		this.complete = complete;
		this.user = user;
		this.coach = coach;
		this.sport = sport;
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

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public Date getExpireDate() {
		return expireDate;
	}

	public void setExpireDate(Timestamp expireDate) {
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

	@Override
	public List<String> getInvalidInfo() {
		List<String> errors = new ArrayList<String>();
		//String error;
		
		return errors;
	}

	@Override
	public Plan toEntity() {
		// TODO Auto-generated method stub
		UserDAO udao = new UserDAOImp();
		SportDAO sdao = new SportDAOImp();
		CoachDAO cdao = new CoachDAOImp();
		User userEntity = udao.getUserByUsername(user);
		User coachUserEntity = udao.getUserByUsername(coach);
		Coach coachEntity = cdao.getCoachById(coachUserEntity.getId());
		Sport sportEntity = sdao.getSportByName(sport);
		
		return new Plan(id, name, description, createDate, expireDate, complete,
				userEntity, coachEntity, sportEntity);
	}

}
