package com.sporthub.storage.dao;

import org.hibernate.Session;

import com.sporthub.storage.entity.Coach;

public interface CoachDAO {
	public void setSession(Session session);
	public void createCoach(Coach coach);
	public Coach getCoachById(int id);
	public Coach getCoachByUsername(String username);
	public void update(Coach coach);
	public void delete(Coach coach);
}
