package com.sporthub.storage.dao;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import com.sporthub.common.datatransfer.CoachAttributes;
import com.sporthub.common.exception.EntityAlreadyExistsException;
import com.sporthub.storage.entity.Coach;

public class CoachDAOImp implements CoachDAO {

	private Session session;
	@Autowired
	EntityDAO edao;
	
	public CoachDAOImp() {
		super();
	}
	public CoachDAOImp(Session session) {
		super();
		this.session = session;
	}
	
	public EntityDAO getEdao() {
		return edao;
	}
	public void setEdao(EntityDAO edao) {
		this.edao = edao;
	}
	@Override
	public void setSession(Session session) {
		this.session = session;
		
	}
	
	@Override
	public void createCoach(CoachAttributes coach) {
		// TODO Auto-generated method stub
		if(coach != null){
			if(getCoachById(coach.getId()) != null){
				throw new EntityAlreadyExistsException("User is already a coach.");
			}
		}
		edao.setSession(session);
		edao.createEntity(coach);
	}

	@Override
	public Coach getCoachById(int id) {
		// TODO Auto-generated method stub
		Coach coach = (Coach)session.get(Coach.class, id);
		if(coach == null) return null;
		//session.refresh(coach);
		return coach;
	}

	@Override
	public void update(CoachAttributes coach) {
		if(coach == null || getCoachById(coach.getId()) == null){
			throw new NullPointerException();
		}
		edao.setSession(session);
		edao.updateEntity(coach);
	}

	@Override
	public void delete(CoachAttributes coach) {
		if(coach == null || getCoachById(coach.getId()) == null){
			throw new NullPointerException();
		}
		edao.setSession(session);
		edao.deleteEntity(coach);
	}

}
