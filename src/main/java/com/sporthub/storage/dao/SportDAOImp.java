package com.sporthub.storage.dao;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

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
		Sport sport = (Sport)session.get(Sport.class, id);
		if(sport == null) return null;
		//session.refresh(sport);
		return sport;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Sport getSportByName(String name) {
		Criteria criteria = session.createCriteria(Sport.class);  
		criteria.add( Restrictions.eq("name", name) );
		List results = criteria.list();
		if(results.size() == 0) return null;
		Sport sport = (Sport) results.get(0);
		session.refresh(sport);
		return sport;
	}

	@Override
	public void update(Sport sport) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Sport sport) {
		// TODO Auto-generated method stub

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Sport> getAllSports() {
		return session.createCriteria(Sport.class).list();
	}


}
