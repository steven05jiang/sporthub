package com.sporthub.storage.dao;

import org.hibernate.Session;
import com.sporthub.storage.entity.Plan;

public class PlanDAOImp implements PlanDAO {

	private Session session;
	
	
	public PlanDAOImp() {
		super();
	}
	
	public PlanDAOImp(Session session) {
		super();
		this.session = session;
	}

	@Override
	public void setSession(Session session) {
		this.session = session;
		
	}
	
	@Override
	public void createPlan(Plan plan) {
		// TODO Auto-generated method stub

	}

	@Override
	public Plan getPlanById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Plan plan) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Plan plan) {
		// TODO Auto-generated method stub

	}

}
