package com.sporthub.storage.dao;

import org.hibernate.Session;

import com.sporthub.storage.entity.Admin;

public interface AdminDAO {
	public void setSession(Session session);
	public void createAdmin(Admin admin);
	public Admin getAdminById(int id);
	public Admin getAdminByUsername(String username);
	public void update(Admin admin);
	public void delete(Admin admin);
}
