package com.sporthub.logic.service;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.sporthub.common.datatransfer.UserAttributes;
import com.sporthub.common.exception.InvalidParametersException;
import com.sporthub.common.exception.UnauthorizedAccessException;
import com.sporthub.storage.dao.UserDAO;
import com.sporthub.storage.entity.User;
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
		try{
			Session session = sf.openSession();
			try{
				udao.setSession(session);
				UserAttributes user = new UserAttributes(udao.getUserByUsername(username));
				return new UserProfile(user);
			}finally{
				session.close();
			}
		}catch(HibernateException e){
			e.printStackTrace();
			throw new RuntimeException("Error in getting user profile.");
		}
	}

	@Override
	public void updateUserProfile(String username, UserAttributes user) throws InvalidParametersException {
		if(user == null || !user.getUsername().equals(username)){
			throw new UnauthorizedAccessException("Not authorized user.");
		}
		try{
			Session session = sf.openSession();
			try{
				udao.setSession(session);
				User userEntity = udao.getUserByUsername(username);
				user.setPassword(userEntity.getPassword());
				user.setId(userEntity.getId());
				udao.update(user);
			}finally{
				session.close();
			}
		}catch(HibernateException e){
			e.printStackTrace();
			throw new RuntimeException("Error in updating user profile.");
		}
	}
	

}
