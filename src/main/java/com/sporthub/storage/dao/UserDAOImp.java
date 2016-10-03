package com.sporthub.storage.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import com.sporthub.common.datatransfer.UserAttributes;
import com.sporthub.common.exception.EntityAlreadyExistsException;
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

	@Override
	public void createUser(UserAttributes user) {
		if(user != null && user.getUsername() != null){
			String username = user.getUsername();
			if(getUserByUsername(username) != null){
				throw new EntityAlreadyExistsException("Username is already existed.");
			}
		}
		edao.setSession(session);
		edao.createEntity(user);
	}

	@Override
	public void update(UserAttributes user) {
		if(user == null || getUserById(user.getId()) == null){
			throw new NullPointerException();
		}
		edao.setSession(session);
		edao.updateEntity(user);
	}

	@Override
	public void delete(UserAttributes user) {
		if(user == null || getUserById(user.getId()) == null){
			throw new NullPointerException();
		}
		edao.setSession(session);
		edao.deleteEntity(user);
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
