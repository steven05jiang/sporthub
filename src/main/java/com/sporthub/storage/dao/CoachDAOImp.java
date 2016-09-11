package com.sporthub.storage.dao;

import org.hibernate.Session;
import com.sporthub.storage.entity.Coach;

public class CoachDAOImp implements CoachDAO {

	private Session session;
	
	public CoachDAOImp() {
		super();
	}
	public CoachDAOImp(Session session) {
		super();
		this.session = session;
	}

	@Override
	public void setSession(Session session) {
		this.session = session;
		
	}
	
	@Override
	public void createCoach(Coach coach) {
		// TODO Auto-generated method stub

	}

	@Override
	public Coach getCoachById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Coach getCoachByUsername(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Coach coach) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Coach coach) {
		// TODO Auto-generated method stub

	}

}
