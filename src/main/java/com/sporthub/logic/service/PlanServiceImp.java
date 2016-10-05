package com.sporthub.logic.service;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.sporthub.common.datatransfer.ActionAttributes;
import com.sporthub.common.datatransfer.PlanAttributes;
import com.sporthub.common.exception.EntityNotFoundException;
import com.sporthub.common.exception.InvalidParametersException;
import com.sporthub.common.exception.UnauthorizedAccessException;
import com.sporthub.storage.dao.ActionDAO;
import com.sporthub.storage.dao.PlanDAO;
import com.sporthub.storage.dao.UserDAO;
import com.sporthub.storage.entity.Action;
import com.sporthub.storage.entity.Plan;
import com.sporthub.storage.entity.User;
import com.sporthub.ui.template.ActionTemplate;
import com.sporthub.ui.template.PlanTemplate;

public class PlanServiceImp implements PlanService {

	@Autowired
	private SessionFactory sf;
	@Autowired
	private PlanDAO pdao;
	@Autowired
	private UserDAO udao;
	@Autowired
	private ActionDAO adao;
	
	
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}

	public ActionDAO getAdao() {
		return adao;
	}
	public void setAdao(ActionDAO adao) {
		this.adao = adao;
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
	public void createMyPlan(PlanAttributes plan) throws InvalidParametersException {
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
	@Override
	public void deleteMyPlan(String username, int id) throws InvalidParametersException {
		if(username == null){
			throw new UnauthorizedAccessException("Not authorized user.");
		}
		try{
			Session session = sf.openSession();
			try{
				pdao.setSession(session);
				Plan plan = pdao.getPlanById(id);
				if(plan == null){
					throw new InvalidParametersException("Not valid plan id.");
				}
				if(!username.equals(plan.getUser().getUsername())){
					throw new UnauthorizedAccessException("Not authorized user.");
				}
				
				pdao.delete(new PlanAttributes(plan));
			}finally{
				session.close();
			}
		}catch(HibernateException e){
			e.printStackTrace();
			throw new RuntimeException("Error in deleting your plans.");
		}
		
	}
	@Override
	public void updateMyPlan(PlanAttributes plan, String username) throws InvalidParametersException {
		if(plan == null){
			throw new InvalidParametersException("Not valid plan data.");
		}
		if(username == null){
			throw new UnauthorizedAccessException("Not a authorized user.");
		}
		try{
			Session session = sf.openSession();
			try{
				pdao.setSession(session);
				Plan planEntity = pdao.getPlanById(plan.getId());
				if(planEntity == null){
					throw new EntityNotFoundException("Not Found plan.");
				}
				if(!planEntity.getUser().getUsername().equals(username)){
					throw new UnauthorizedAccessException("Not a authorized user.");
				}
				pdao.update(plan);
			}finally{
				session.close();
			}
		}catch(HibernateException e){
			e.printStackTrace();
			throw new RuntimeException("Error in updating your plans.");
		}
	}
	@Override
	public Set<ActionTemplate> getActionsByPlanId(String username, int id){
		if(username == null){
			throw new UnauthorizedAccessException("Not a authorized user.");
		}
		try{
			Session session = sf.openSession();
			try{
				pdao.setSession(session);
				Plan plan = pdao.getPlanById(id);
				if(plan == null){
					throw new EntityNotFoundException("Not Found plan.");
				}
				if(!plan.getUser().getUsername().equals(username)){
					throw new UnauthorizedAccessException("Not a authorized user.");
				}
				Set<ActionTemplate> res =  new HashSet<ActionTemplate>();
				for(Action action : plan.getActions()){
					ActionAttributes aa = new ActionAttributes(action);
					res.add(new ActionTemplate(aa));
				}
				return res;
			}finally{
				session.close();
			}
		}catch(HibernateException e){
			e.printStackTrace();
			throw new RuntimeException("Error in getting the actions.");
		}
	}
	@Override
	public void createAction(String username, ActionAttributes action) throws InvalidParametersException {
		if(username == null){
			throw new UnauthorizedAccessException("Not a authorized user.");
		}
		if(action == null || action.getName() == null || action.getTime() == null){
			throw new InvalidParametersException("Invalid action content.");
		}
		try{
			Session session = sf.openSession();
			try{
				pdao.setSession(session);
				adao.setSession(session);
				if(pdao.getPlanById(action.getPlanId()) == null){
					throw new EntityNotFoundException("Not Found plan.");
				}
				adao.createAction(action);
			}finally{
				session.close();
			}
		}catch(HibernateException e){
			e.printStackTrace();
			throw new RuntimeException("Error in creating an action.");
		}
	}
	

}
