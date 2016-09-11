package com.sporthub.storage.dao;

import org.hibernate.Session;
import com.sporthub.storage.entity.Sport;

public class SportDAOImp implements SportDAO {

	private Session session;
	
	
	public SportDAOImp() {
		super();
	}
	
	public SportDAOImp(Session session) {
		super();
		this.session = session;
	}

	@Override
	public void setSession(Session session) {
		this.session = session;
		
	}
	
	@Override
	public void createSport(Sport sport) {
		// TODO Auto-generated method stub

	}

	@Override
	public Sport getSportById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Sport getSportByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Sport sport) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Sport sport) {
		// TODO Auto-generated method stub

	}


}
