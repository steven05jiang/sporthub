package com.sporthub.storage.dao;

import org.hibernate.Session;

import com.sporthub.storage.entity.Sport;

public interface SportDAO {
	public void setSession(Session session);
	public void createSport(Sport sport);
	public Sport getSportById(int id);
	public Sport getSportByName(String name);
	public void update(Sport sport);
	public void delete(Sport sport);
}
