package com.sporthub.common.datatransfer;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sporthub.storage.dao.CoachDAO;
import com.sporthub.storage.dao.CoachDAOImp;
import com.sporthub.storage.dao.PlanDAO;
import com.sporthub.storage.dao.PlanDAOImp;
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
	private Date createDate;
	private Date expireDate;
	private int complete;
	private String user;
	private String coach;
	private String sport;
	
	
	
	public PlanAttributes() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public PlanAttributes(Plan plan) {
		super();
		this.id = plan.getId();
		this.name = plan.getName();
		this.description = plan.getDescription();
		this.createDate = plan.getCreateDate();
		this.expireDate = plan.getExpireDate();
		this.complete = plan.getComplete();
		this.user = plan.getUser().getUsername();
		if(plan.getCoach() != null){
			this.coach = plan.getCoach().getUser().getUsername();
		}else{
			this.coach = null;
		}
		this.sport = plan.getSport().getName();
	}

	public PlanAttributes(int id, String name, String description, Date createDate, Date expireDate, int complete,
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

	@Override
	public List<String> getInvalidInfo() {
		List<String> errors = new ArrayList<String>();
		//String error;
		
		return errors;
	}

	@Override
	public Plan toEntity(Boolean isNew) {
		// TODO Auto-generated method stub
		User userEntity = null;
		Coach coachEntity = null;
		Sport sportEntity = null;
		Timestamp createTs = null;
		Timestamp expireTs = null;
		if(!isNew){
			PlanDAO pdao = new PlanDAOImp(session);
			Plan plan = pdao.getPlanById(id);
			userEntity = plan.getUser();
			coachEntity = plan.getCoach();
			sportEntity = plan.getSport();
			createTs = new Timestamp(plan.getCreateDate().getTime());
		}else{
			UserDAO udao = new UserDAOImp(session);
			SportDAO sdao = new SportDAOImp(session);
			CoachDAO cdao = new CoachDAOImp(session);
			userEntity = udao.getUserByUsername(user);
			User coachUserEntity = udao.getUserByUsername(coach);
			if(coachUserEntity != null){
				coachEntity = cdao.getCoachById(coachUserEntity.getId());
			}
			sportEntity = sdao.getSportByName(sport);
			createTs = new Timestamp(createDate.getTime());
		}
		if(expireDate != null){
			expireTs = new Timestamp(expireDate.getTime());
		}
		
		return new Plan(id, name, description, createTs, expireTs,complete, userEntity, coachEntity, sportEntity);
	}

}
