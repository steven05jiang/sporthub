package com.sporthub.logic.service;

import com.sporthub.common.datatransfer.PlanAttributes;
import com.sporthub.webservice.template.Result;

public interface PlanService {
/**
 * Call by PlanController to work on business logic
 * @return
 */
	public Result createPlan(PlanAttributes plan);
}
