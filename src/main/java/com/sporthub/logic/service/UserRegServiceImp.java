package com.sporthub.logic.service;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.sporthub.common.datatransfer.UserAttributes;
import com.sporthub.storage.dao.UserDAO;
import com.sporthub.storage.entity.User;
import com.sporthub.ui.template.Result;
import com.sporthub.ui.template.ResultFactory;
import com.sporthub.ui.template.UserEmailCheck;

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
	public Result createUser(UserAttributes user) {
		if(user == null){
			throw new NullPointerException();
		}
		try{
			Session session = sf.openSession();
			try{
				udao.setSession(session);
				udao.createUser(user);
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

	@Override
	public UserEmailCheck isEmailAvailable(String email) {
		Result res;
		UserEmailCheck checkResult;
		if(email == null){
			res = ResultFactory.getResult("403");
			return new UserEmailCheck(res.getCode(), res.getDescription());
		}
		try{
			Session session = sf.openSession();
			try{
				udao.setSession(session);
				User user = udao.getUserByEmail(email);
				res = ResultFactory.getResult("200");
				checkResult = new UserEmailCheck(res.getCode(), res.getDescription());
				if(user == null){
					checkResult.setAvailable(true);
				}else{
					checkResult.setAvailable(false);
				}
				return checkResult;
			}catch(RuntimeException e){
				e.printStackTrace();
				res = ResultFactory.getResult("500");
				return new UserEmailCheck(res.getCode(), res.getDescription());
			}finally{
				session.close();
			}
		}catch(HibernateException e){
			e.printStackTrace();
			res = ResultFactory.getResult("500");
			return new UserEmailCheck(res.getCode(), res.getDescription());
		}
	}

}
