package com.sporthub.storage.dao;

import org.hibernate.Session;

import com.sporthub.common.datatransfer.ActionAttributes;
import com.sporthub.storage.entity.Action;

public interface ActionDAO {
	public void setSession(Session session);
	public void createAction(ActionAttributes action);
	public Action getActionById(int id);
	public void update(ActionAttributes action);
	public void delete(ActionAttributes action);
}
