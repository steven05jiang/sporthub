package com.sporthub.logic.service;

import javax.servlet.http.HttpSession;

import com.sporthub.ui.template.Result;

public interface CommonService {

	public Result userLogin(String username, String password);
	public Result userLogout(HttpSession session);
}
