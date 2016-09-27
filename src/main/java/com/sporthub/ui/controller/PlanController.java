package com.sporthub.ui.controller;

import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.sporthub.common.datatransfer.PlanAttributes;
import com.sporthub.logic.service.PlanService;
import com.sporthub.ui.template.PlanTemplate;
import com.sporthub.ui.template.Result;

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
	public Result createPlan(@RequestBody PlanAttributes plan, HttpSession session){
		try{
			String username = (String) session.getAttribute("username");
			plan.setUser(username);
			plan.setCoach(null);
			return ps.createPlan(plan);
		}catch(RuntimeException e){
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value="/getmyplan")
	public Set<PlanTemplate> getMyPlan(HttpSession session){
		try{
			String username = (String) session.getAttribute("username");
			return ps.getMyPlan(username);
		}catch(RuntimeException e){
			e.printStackTrace();
			return null;
		}
	}
}
