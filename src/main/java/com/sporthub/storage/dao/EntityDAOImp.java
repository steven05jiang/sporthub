package com.sporthub.storage.dao;

import java.security.InvalidParameterException;

import org.hibernate.Session;

import com.sporthub.common.datatransfer.EntityAttributes;

public class EntityDAOImp implements EntityDAO {

	private Session session;
	
	public Session getSession() {
		return session;
	}
	@Override
	public void setSession(Session session) {
		this.session = session;
	}
	public EntityDAOImp() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EntityDAOImp(Session session) {
		super();
		this.session = session;
	}

	@Override
	public void createEntity(EntityAttributes attributes) {
		if(!attributes.isValid()){
			throw new InvalidParameterException();
		}
		attributes.setSession(session);
		Object entity = attributes.toEntity(true);
		session.beginTransaction();
		session.save(entity);
		session.getTransaction().commit();
		session.refresh(entity);
	}
	@Override
	public void updateEntity(EntityAttributes attributes) {
		if(!attributes.isValid()){
			throw new InvalidParameterException();
		}
		attributes.setSession(session);
		Object entity = attributes.toEntity(false);
		session.beginTransaction();
		session.update(entity);
		session.getTransaction().commit();
		session.refresh(entity);
	}
	@Override
	public void deleteEntity(EntityAttributes attributes) {
		if(!attributes.isValid()){
			throw new InvalidParameterException();
		}
		attributes.setSession(session);
		Object entity = attributes.toEntity(false);
		session.beginTransaction();
		session.delete(entity);
		session.getTransaction().commit();	
		session.refresh(entity);
	}

}
