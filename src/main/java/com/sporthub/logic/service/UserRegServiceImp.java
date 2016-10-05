package com.sporthub.logic.service;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.sporthub.common.datatransfer.UserAttributes;
import com.sporthub.common.exception.InvalidParametersException;
import com.sporthub.storage.dao.UserDAO;
import com.sporthub.storage.entity.User;
import com.sporthub.ui.template.UserEmailCheck;
import com.sporthub.ui.template.UsernameCheck;

public class UserRegServiceImp implements UserRegService {
	@Autowired
	private SessionFactory sf;
	@Autowired
	private UserDAO udao;
	
	public UserRegServiceImp() {
		super();
	}

	public UserDAO getUdao() {
		return udao;
	}
	public void setUdao(UserDAO udao) {
		this.udao = udao;
	}
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}


	@Override
	public void createUser(UserAttributes user) throws InvalidParametersException {
		if(user == null || user.getUsername() == null){
			throw new InvalidParametersException("Not valid user information.");
		}
		try{
			Session session = sf.openSession();
			try{
				udao.setSession(session);
				udao.createUser(user);
			}finally{
				session.close();
			}
		}catch(HibernateException e){
			e.printStackTrace();
			throw new RuntimeException("Error in creating new user.");
		}
	}
	/*
	@Override
	public User getUser(int id){
		Session session = sf.openSession();
		udao.setSession(session);
		User user = udao.getUserById(id);
		if(user == null){
			user = new User();
			user.setUsername("no user");
		}
		return user;
	}
	*/

	@Override
	public UserEmailCheck isEmailAvailable(String email) throws InvalidParametersException {
		UserEmailCheck checkResult;
		if(email == null){
			throw new InvalidParametersException("Not a valid Email.");
		}
		try{
			Session session = sf.openSession();
			try{
				udao.setSession(session);
				User user = udao.getUserByEmail(email);
				if(user == null){
					checkResult = new UserEmailCheck(true);
				}else{
					checkResult = new UserEmailCheck(false);
				}
				return checkResult;
			}finally{
				session.close();
			}
		}catch(HibernateException e){
			e.printStackTrace();
			throw new RuntimeException("Error in Checking Email availability.");
		}
	}

	@Override
	public UsernameCheck isUsernameAvailable(String username) throws InvalidParametersException {
		UsernameCheck checkResult;
		if(username == null){
			throw new InvalidParametersException("Not a valid Username.");
		}
		try{
			Session session = sf.openSession();
			try{
				udao.setSession(session);
				User user = udao.getUserByUsername(username);
				if(user == null){
					checkResult = new UsernameCheck(true);
				}else{
					checkResult = new UsernameCheck(false);
				}
				return checkResult;
			}finally{
				session.close();
			}
		}catch(HibernateException e){
			e.printStackTrace();
			throw new RuntimeException("Error in Checking Username availability.");
		}
	}

}
