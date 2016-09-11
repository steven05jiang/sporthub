package com.sporthub.storage.dao;

import org.hibernate.Session;

import com.sporthub.storage.entity.Plan;

public interface PlanDAO {
	public void setSession(Session session);
	public void createPlan(Plan plan);
	public Plan getPlanById(int id);
	public void update(Plan plan);
	public void delete(Plan plan);
}
