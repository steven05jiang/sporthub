package com.sporthub.ui.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sporthub.common.datatransfer.UserAttributes;
import com.sporthub.common.exception.InvalidParametersException;
import com.sporthub.logic.service.UserRegService;
import com.sporthub.ui.template.UserEmailCheck;
import com.sporthub.ui.template.UsernameCheck;

@RestController
@RequestMapping("/webservice/createuser")
public class UserRegController {
	@Autowired
	private UserRegService ugs;
	
	public UserRegController(){
		super();
	}
	
	public void setUs(UserRegService ugs){
		this.ugs = ugs;
	}
	
	public UserRegService getUs(){
		return ugs;
	}
	
	@RequestMapping(value = "",
			method=RequestMethod.POST)
	public void createUser(@RequestBody UserAttributes user, HttpSession session) throws InvalidParametersException{
		ugs.createUser(user);
		session.setAttribute("username", user.getUsername());
	}
	//below is depreciate method because email is not unique now.
	@RequestMapping(value="/emailcheck",
			method=RequestMethod.GET)
	public UserEmailCheck emailAvailableCheck(@RequestParam(value="email") String email) throws InvalidParametersException{
		return ugs.isEmailAvailable(email);
	}
	@RequestMapping(value="/usernamecheck",
			method=RequestMethod.GET)
	public UsernameCheck usernameAvailableCheck(@RequestParam(value="username") String username) throws InvalidParametersException{
		return ugs.isUsernameAvailable(username);
	}
}
