package com.sporthub.common.datatransfer;

import java.util.List;

import org.hibernate.Session;

public abstract class EntityAttributes {
	
	public Session session;
	
	public void setSession(Session session){
		this.session = session;
	}
	
	public boolean isValid(){
		return getInvalidInfo().isEmpty();
	}
	
	public abstract List<String> getInvalidInfo();
	
	public abstract Object toEntity(Boolean isNew);
	
	//public abstract void sanitizeForSaving();
}
