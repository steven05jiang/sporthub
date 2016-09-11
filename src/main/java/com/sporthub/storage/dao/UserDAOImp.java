package com.sporthub.storage.dao;

import java.security.InvalidParameterException;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sporthub.common.datatransfer.UserAttributes;
import com.sporthub.storage.entity.User;

public class UserDAOImp implements UserDAO {

	private Session session;
	@Autowired
	EntityDAO edao;
	
	public UserDAOImp(){
		super();
	}
	
	public UserDAOImp(Session session) {
		super();
		this.session = session;
	}
	@Override
	public void setSession(Session session){
		this.session = session;
	}
	public void setEdao(EntityDAO edao){
		this.edao = edao;
	}

	@Override
	public User getUserById(int id) {
		User user = (User)session.get(User.class, id);
		if(user == null) return null;
		session.refresh(user);
		return user;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public User getUserByUsername(String username) {
		Criteria criteria = session.createCriteria(User.class);  
		criteria.add( Restrictions.eq("username", username) );
		List results = criteria.list();
		if(results.size() == 0) return null;
		User user = (User) results.get(0);
		session.refresh(user);
		return user;
	}

	@SuppressWarnings("resource")
	@Override
	public void createUser(UserAttributes user) {
		if(user != null && user.getUsername() != null){
			String username = user.getUsername();
			if(getUserByUsername(username) != null){
				throw new InvalidParameterException();
			}
		}
		//edao.setSession(session);
		//edao.createEntity(user);
		User u = user.toEntity();
		session.beginTransaction();
		session.save(u);
		session.getTransaction().commit();
		session.refresh(u);
	}

	@Override
	public void update(UserAttributes user) {
		if(user == null){
			throw new NullPointerException();
		}
		session.beginTransaction();
		session.update(user);
		session.getTransaction().commit();
	}

	@Override
	public void delete(UserAttributes user) {
		if(user == null){
			throw new NullPointerException();
		}
		session.beginTransaction();
		session.delete(user);
		session.getTransaction().commit();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public User getUserByEmail(String email) {
		Criteria criteria = session.createCriteria(User.class);  
		criteria.add( Restrictions.eq("email", email) );
		List results = criteria.list();
		if(results.size() == 0) return null;
		User user = (User) results.get(0);
		session.refresh(user);
		return user;
	}

}
