package com.sporthub.logic.service;

import java.util.Set;

import com.sporthub.common.datatransfer.PlanAttributes;
import com.sporthub.ui.template.PlanTemplate;
import com.sporthub.ui.template.Result;

public interface PlanService {
/**
 * Call by PlanController to work on business logic
 * @return
 */
	public Result createPlan(PlanAttributes plan);
	public Set<PlanTemplate> getMyPlan(String username);
}
