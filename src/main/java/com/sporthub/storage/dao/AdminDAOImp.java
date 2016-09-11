package com.sporthub.storage.dao;

import org.hibernate.Session;
import com.sporthub.storage.entity.Admin;

public class AdminDAOImp implements AdminDAO {

	private Session session;
	
	public AdminDAOImp() {
		super();
	}
	public AdminDAOImp(Session session) {
		super();
		this.session = session;
	}

	@Override
	public void setSession(Session session) {
		this.session = session;
		
	}
	
	@Override
	public void createAdmin(Admin admin) {
		// TODO Auto-generated method stub

	}

	@Override
	public Admin getAdminById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Admin getAdminByUsername(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Admin admin) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Admin admin) {
		// TODO Auto-generated method stub

	}

}
