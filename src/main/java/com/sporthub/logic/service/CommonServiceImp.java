package com.sporthub.logic.service;

import javax.servlet.http.HttpSession;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.sporthub.common.exception.InvalidParametersException;
import com.sporthub.storage.dao.UserDAO;
import com.sporthub.storage.entity.User;

public class CommonServiceImp implements CommonService {
	@Autowired
	private SessionFactory sf;
	@Autowired
	private UserDAO udao;
	
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
	public UserDAO getUdao() {
		return udao;
	}
	public void setUdao(UserDAO udao) {
		this.udao = udao;
	}
	
	@Override
	public void userLogin(String username, String password) throws InvalidParametersException {
		if(username == null || password == null){
			throw new InvalidParametersException("Username and password not matched. Please use correct username and password.");
		}
		try{
			Session session = sf.openSession();
			try{
				udao.setSession(session);
				User user = udao.getUserByUsername(username);
				if(user == null || !user.getPassword().equals(password)){
					throw new InvalidParametersException("Username and password not matched. Please use correct username and password.");
				}
			}finally{
				session.close();
			}
		}catch(HibernateException e){
			e.printStackTrace();
			throw new RuntimeException("Error in login.");
		}	
	}
	
	@Override
	public void userLogout(HttpSession session) {
		try{
			session.invalidate();
		}catch(RuntimeException e){
			e.printStackTrace();
			throw new RuntimeException("Server Error.");
		}
	}

	
}
