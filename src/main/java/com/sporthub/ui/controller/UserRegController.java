package com.sporthub.ui.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sporthub.common.datatransfer.UserAttributes;
import com.sporthub.logic.service.UserRegService;
import com.sporthub.storage.entity.User;
import com.sporthub.ui.template.Result;
import com.sporthub.ui.template.UserEmailCheck;

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
	public Result createUser(@RequestBody UserAttributes user, HttpSession session){
		Result res = ugs.createUser(user);
		if(res.getCode().equals("200")){
			session.setAttribute("username", user.getUsername());
		}
		return res;
	}
	@RequestMapping(value="/emailcheck",
			method=RequestMethod.GET)
	public UserEmailCheck emailAvailableCheck(@RequestParam(value="email") String email){
		//System.out.println(email);
		return ugs.isEmailAvailable(email);
	}
	@RequestMapping(value = "/{id}",
			method=RequestMethod.GET)
	public User findUser(@PathVariable("id") int id){
		return ugs.getUser(id);
	}
}