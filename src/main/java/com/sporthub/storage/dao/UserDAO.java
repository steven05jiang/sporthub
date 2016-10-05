package com.sporthub.storage.dao;

import org.hibernate.Session;

import com.sporthub.common.datatransfer.UserAttributes;
import com.sporthub.common.exception.InvalidParametersException;
import com.sporthub.storage.entity.User;

public interface UserDAO {
	public void setSession(Session session);
	public void createUser(UserAttributes user);
	public User getUserById(int id);
	public User getUserByUsername(String username);
	public User getUserByEmail(String email);
	public void update(UserAttributes user) throws InvalidParametersException;
	public void delete(UserAttributes user);
}
