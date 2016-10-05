package com.sporthub.logic.service;

import java.util.Set;

import com.sporthub.common.datatransfer.ActionAttributes;
import com.sporthub.common.datatransfer.PlanAttributes;
import com.sporthub.common.exception.InvalidParametersException;
import com.sporthub.ui.template.ActionTemplate;
import com.sporthub.ui.template.PlanTemplate;

public interface PlanService {
/**
 * Call by PlanController to work on business logic
 * @return
 */
	public void createMyPlan(PlanAttributes plan) throws InvalidParametersException;
	public Set<PlanTemplate> getMyPlans(String username);
	public PlanTemplate getMyPlan(String username, int id);
	public void deleteMyPlan(String username, int id)  throws InvalidParametersException;
	public void updateMyPlan(PlanAttributes plan, String username) throws InvalidParametersException;
	public Set<ActionTemplate> getActionsByPlanId(String username, int id);
	public void createAction(String username, ActionAttributes action) throws InvalidParametersException;
}
