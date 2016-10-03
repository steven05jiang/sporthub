package com.sporthub.logic.service;

import javax.servlet.http.HttpSession;

import com.sporthub.common.exception.InvalidParametersException;

public interface CommonService {
	public void userLogout(HttpSession session);
	public void userLogin(String username, String password) throws InvalidParametersException;
}
