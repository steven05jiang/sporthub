package com.sporthub.ui.controller;

import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.sporthub.common.datatransfer.PlanAttributes;
import com.sporthub.common.exception.InvalidParametersException;
import com.sporthub.logic.service.PlanService;
import com.sporthub.ui.template.PlanTemplate;

@RestController
@RequestMapping(value = "/webservice/plan")
public class PlanController {

	@Autowired
	private PlanService ps;
	
	public PlanService getPs() {
		return ps;
	}
	public void setPs(PlanService ps) {
		this.ps = ps;
	}

	public PlanController(PlanService ps) {
		super();
		this.ps = ps;
	}
	public PlanController() {
		super();
		// TODO Auto-generated constructor stub
	}

	@RequestMapping(value = "/createmyplan",
			method = RequestMethod.POST)
	public void createPlan(@RequestBody PlanAttributes plan, HttpSession session) throws InvalidParametersException{
		String username = (String) session.getAttribute("username");
		plan.setUser(username);
		plan.setCoach(null);
		ps.createPlan(plan);
	}
	
	@RequestMapping(value="/getmyplans",
			method=RequestMethod.GET)
	public Set<PlanTemplate> getAllMyPlan(HttpSession session){
		String username = (String) session.getAttribute("username");
		return ps.getMyPlans(username);
	}
	
	@RequestMapping(value="/getmyplan/{id}",
			method=RequestMethod.GET)
	public PlanTemplate getMyPlanById(HttpSession session, @PathVariable int id){
		String username = (String) session.getAttribute("username");
		return ps.getMyPlan(username, id);
	}
}
