package com.sporthub.storage.dao;

import org.hibernate.Session;

import com.sporthub.common.datatransfer.CoachAttributes;
import com.sporthub.storage.entity.Coach;

public interface CoachDAO {
	public void setSession(Session session);
	public void createCoach(CoachAttributes coach);
	public Coach getCoachById(int id);
	public void update(CoachAttributes coach);
	public void delete(CoachAttributes coach);
}
