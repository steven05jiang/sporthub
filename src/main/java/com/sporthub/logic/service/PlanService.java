package com.sporthub.logic.service;

import java.util.Set;

import com.sporthub.common.datatransfer.PlanAttributes;
import com.sporthub.common.exception.InvalidParametersException;
import com.sporthub.ui.template.PlanTemplate;

public interface PlanService {
/**
 * Call by PlanController to work on business logic
 * @return
 */
	public void createPlan(PlanAttributes plan) throws InvalidParametersException;
	public Set<PlanTemplate> getMyPlans(String username);
	public PlanTemplate getMyPlan(String username, int id);
}
