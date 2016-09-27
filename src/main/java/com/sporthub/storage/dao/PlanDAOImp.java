package com.sporthub.storage.dao;

import java.security.InvalidParameterException;
import java.sql.Timestamp;
import java.util.Date;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import com.sporthub.common.datatransfer.PlanAttributes;
import com.sporthub.storage.entity.Plan;

public class PlanDAOImp implements PlanDAO {

	private Session session;
	@Autowired
	EntityDAO edao;
	
	
	public PlanDAOImp() {
		super();
	}
	
	public PlanDAOImp(Session session) {
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
	public void createPlan(PlanAttributes plan) {
		// TODO Auto-generated method stub
		if(plan != null){
			if(getPlanById(plan.getId()) != null){
				throw new InvalidParameterException();
			}
		}
		Date date = new Date();
		Timestamp ts = new Timestamp(date.getTime());
		plan.setCreateDate(ts);
		plan.setId(-1);
		edao.setSession(session);
		edao.createEntity(plan);
	}

	@Override
	public Plan getPlanById(int id) {
		Plan plan = (Plan)session.get(Plan.class, id);
		if(plan == null) return null;
		session.refresh(plan);
		return plan;
	}

	@Override
	public void update(PlanAttributes plan) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(PlanAttributes plan) {
		// TODO Auto-generated method stub

	}

}
