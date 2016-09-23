package com.sporthub.storage.dao;

import org.hibernate.Session;

import com.sporthub.common.datatransfer.EntityAttributes;

public interface EntityDAO {
	public void setSession(Session session);
	/**
	 * 
	 * This method is uesd to create a new entity in DB
	 * @param attributes
	 * 				The attribute object of an entity
	 */
	public void createEntity(EntityAttributes attributes);
	public void updateEntity(EntityAttributes attributes);
	public void deleteEntity(EntityAttributes attributes);
}
