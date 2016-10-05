package com.sporthub.storage.dao;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import com.sporthub.common.datatransfer.ActionAttributes;
import com.sporthub.storage.entity.Action;

public class ActionDAOImp implements ActionDAO {

	private Session session;
	@Autowired
	EntityDAO edao;
	
	public ActionDAOImp(){
		super();
	}
	
	public ActionDAOImp(Session session){
		super();
		this.session = session;
	}
	
	public EntityDAO getEdao() {
		return edao;
	}
	public void setEdao(EntityDAO edao) {
		this.edao = edao;
	}
	
	@Override
	public void setSession(Session session) {
		this.session = session;
	}

	@Override
	public void createAction(ActionAttributes action) {
		//action.setId(-1);
		edao.setSession(session);
		edao.createEntity(action);
	}

	@Override
	public Action getActionById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(ActionAttributes action) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(ActionAttributes action) {
		// TODO Auto-generated method stub

	}

}
