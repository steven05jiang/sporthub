package com.sporthub.logic.service;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.sporthub.common.datatransfer.PlanAttributes;
import com.sporthub.storage.dao.PlanDAO;
import com.sporthub.webservice.template.Result;
import com.sporthub.webservice.template.ResultFactory;

public class PlanServiceImp implements PlanService {

	@Autowired
	private SessionFactory sf;
	@Autowired
	private PlanDAO pdao;
	
	
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
	

}
