package com.sporthub.storage.dao;

import org.hibernate.Session;

import com.sporthub.common.datatransfer.PlanAttributes;
import com.sporthub.storage.entity.Plan;

public interface PlanDAO {
	public void setSession(Session session);
	public void createPlan(PlanAttributes plan);
	public Plan getPlanById(int id);
	public void update(PlanAttributes plan);
	public void delete(PlanAttributes plan);
}
