package com.sporthub.logic.service;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.sporthub.common.datatransfer.PlanAttributes;
import com.sporthub.common.exception.EntityNotFoundException;
import com.sporthub.common.exception.InvalidParametersException;
import com.sporthub.common.exception.UnauthorizedAccessException;
import com.sporthub.storage.dao.PlanDAO;
import com.sporthub.storage.dao.UserDAO;
import com.sporthub.storage.entity.Plan;
import com.sporthub.storage.entity.User;
import com.sporthub.ui.template.PlanTemplate;

public class PlanServiceImp implements PlanService {

	@Autowired
	private SessionFactory sf;
	@Autowired
	private PlanDAO pdao;
	@Autowired
	private UserDAO udao;
	
	
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}

	public PlanDAO getPdao() {
		return pdao;
	}
	public void setPdao(PlanDAO pdao) {
		this.pdao = pdao;
	}
	public UserDAO getUdao() {
		return udao;
	}
	public void setUdao(UserDAO udao) {
		this.udao = udao;
	}
	public PlanServiceImp() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void createPlan(PlanAttributes plan) throws InvalidParametersException {
		if(plan == null){
			throw new InvalidParametersException("Not a valid plan.");
		}
		if(plan.getUser() == null){
			throw new UnauthorizedAccessException("Not authorized user.");
		}
		try{
			Session session = sf.openSession();
			try{
				pdao.setSession(session);
				pdao.createPlan(plan);
			}finally{
				session.close();
			}
		}catch(HibernateException e){
			e.printStackTrace();
			throw new RuntimeException("Error in creating a new plan.");
		}
	}
	@Override
	public Set<PlanTemplate> getMyPlans(String username) {
		if(username == null){
			throw new UnauthorizedAccessException("Not authorized user.");
		}
		try{
		Session session = sf.openSession();
			try{
				udao.setSession(session);
				Set<PlanTemplate> myplans = new HashSet<PlanTemplate>();
				User user = udao.getUserByUsername(username);
				//if(user == null || user.getPlans() == null){
				//	throw new NullPointerException();
				//}
				if(user == null){
					throw new UnauthorizedAccessException("Not authorized user.");
				}
				if(user.getPlans() == null){
					throw new EntityNotFoundException("Not found plans.");
				}
				Set<Plan> myPlanEntities = user.getPlans();
				for(Plan mpe : myPlanEntities){
					PlanAttributes pa = new PlanAttributes(mpe);
					PlanTemplate plan = new PlanTemplate(pa);
					myplans.add(plan);
				}
				return myplans;
			}finally{
				session.close();
			}
		}catch(HibernateException e){
			e.printStackTrace();
			throw new RuntimeException("Error in getting your plans.");
		}
	}
	@Override
	public PlanTemplate getMyPlan(String username, int id) {
		if(username == null){
			throw new UnauthorizedAccessException("Not authorized user.");
		}
		
		try{
			Session session = sf.openSession();
			try{
				pdao.setSession(session);
				Plan plan = pdao.getPlanById(id);
				if(plan == null){
					throw new EntityNotFoundException("Not found plan.");
				}
				if(!plan.getUser().getUsername().equals(username)){
					throw new UnauthorizedAccessException("Not authorized to get the plan.");
				}
				PlanAttributes pa = new PlanAttributes(plan);
				PlanTemplate res = new PlanTemplate(pa);
				return res;
			}finally{
				session.close();
			}
		}catch(HibernateException e){
			e.printStackTrace();
			throw new RuntimeException("Error in getting your plans.");
		}
		
	}
	

}
