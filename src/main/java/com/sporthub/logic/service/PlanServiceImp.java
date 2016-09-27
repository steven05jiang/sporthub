package com.sporthub.logic.service;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.sporthub.common.datatransfer.PlanAttributes;
import com.sporthub.storage.dao.PlanDAO;
import com.sporthub.storage.dao.UserDAO;
import com.sporthub.storage.entity.Plan;
import com.sporthub.storage.entity.User;
import com.sporthub.ui.template.PlanTemplate;
import com.sporthub.ui.template.Result;
import com.sporthub.ui.template.ResultFactory;

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
	public Result createPlan(PlanAttributes plan) {
		if(plan == null || plan.getUser() == null){
			throw new NullPointerException();
		}
		try{
			Session session = sf.openSession();
			try{
				pdao.setSession(session);
				pdao.createPlan(plan);
				return ResultFactory.getResult("200");
			}catch(RuntimeException e){
				e.printStackTrace();
				return ResultFactory.getResult("500");
			}finally{
				session.close();
			}
		}catch(HibernateException e){
			e.printStackTrace();
			return ResultFactory.getResult("500");
		}
	}
	@Override
	public Set<PlanTemplate> getMyPlan(String username) {
		if(username == null){
			throw new NullPointerException();
		}
		Session session = sf.openSession();
		try{
			udao.setSession(session);
			Set<PlanTemplate> myplans = new HashSet<PlanTemplate>();
			User user = udao.getUserByUsername(username);
			//if(user == null || user.getPlans() == null){
			//	throw new NullPointerException();
			//}
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
	}
	

}
