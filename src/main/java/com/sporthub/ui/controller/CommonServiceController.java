package com.sporthub.ui.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.sporthub.logic.service.CommonService;
import com.sporthub.ui.template.Result;

@RestController
@RequestMapping("/webservice/common")
public class CommonServiceController {

	@Autowired
	private CommonService cs;
	
	@RequestMapping(value="/login",
			method=RequestMethod.POST)
	public Result userLogin(HttpSession session, @RequestParam String username, 
			@RequestParam String password){
		Result res = cs.userLogin(username, password);
		if(res.getCode().equals("200")){
			session.setAttribute("username", username);
		}
		return res;
	}
	
	@RequestMapping(value="/logout",
			method=RequestMethod.GET)
	public Result userLogout(HttpSession session){
		return cs.userLogout(session);
	}
}
