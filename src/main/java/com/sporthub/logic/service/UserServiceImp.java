package com.sporthub.logic.service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.sporthub.common.datatransfer.UserAttributes;
import com.sporthub.storage.dao.UserDAO;
import com.sporthub.ui.template.UserProfile;

public class UserServiceImp implements UserService {

	@Autowired
	private SessionFactory sf;
	@Autowired
	private UserDAO udao;
	
	public UserServiceImp() {
		super();
	}
	
	public UserServiceImp(SessionFactory sf) {
		super();
		this.sf = sf;
	}
	public void setSessionFactory(SessionFactory sf){
		this.sf = sf;
	}
	public void setUdao(UserDAO udao){
		this.udao = udao;
	}

	@Override
	public UserProfile getUserProfile(String username) {
		Session session = sf.openSession();
		udao.setSession(session);
		UserAttributes user = new UserAttributes(udao.getUserByUsername(username));
		return new UserProfile(user);
	}
	

}
