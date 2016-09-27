package com.sporthub.ui.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.sporthub.logic.service.UserService;
import com.sporthub.ui.template.UserProfile;

@RestController
@RequestMapping(value = "/webservice/profile")
public class UserProfileController {
	
	@Autowired
	private UserService us;
	
	public UserProfileController() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public UserService getUs() {
		return us;
	}
	public void setUs(UserService us) {
		this.us = us;
	}

	@RequestMapping(value = "",
			method = RequestMethod.GET)
	public UserProfile getUserProfile(HttpSession session){
		try{
			String username = (String) session.getAttribute("username");
			//System.out.println("name: " + username);
			return us.getUserProfile(username);
		}catch(RuntimeException e){
			e.printStackTrace();
			return null;
		}
	}
}
