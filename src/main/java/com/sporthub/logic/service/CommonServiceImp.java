package com.sporthub.logic.service;

import javax.servlet.http.HttpSession;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.sporthub.storage.dao.UserDAO;
import com.sporthub.storage.entity.User;
import com.sporthub.ui.template.Result;
import com.sporthub.ui.template.ResultFactory;

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
	public Result userLogin(String username, String password) {
		if(username == null || password == null){
			throw new NullPointerException();
		}
		try{
			Session session = sf.openSession();
			try{
				udao.setSession(session);
				User user = udao.getUserByUsername(username);
				if(user == null || !user.getPassword().equals(password)){
					return ResultFactory.getResult("500");
				}
				return ResultFactory.getResult("200");
			}catch(RuntimeException e){
				e.printStackTrace();
				return ResultFactory.getResult("500");
			}finally{
				session.close();
			}
		}catch(HibernateException e){
			e.printStackTrace();
			return ResultFactory.getResult("500");
		}	
	}
	
	@Override
	public Result userLogout(HttpSession session) {
		try{
			session.invalidate();
			return ResultFactory.getResult("200");
		}catch(RuntimeException e){
			e.printStackTrace();
			return ResultFactory.getResult("500");
		}
	}

	
}
