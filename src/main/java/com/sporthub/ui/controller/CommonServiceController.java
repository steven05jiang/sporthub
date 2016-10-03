package com.sporthub.ui.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.sporthub.common.exception.InvalidParametersException;
import com.sporthub.logic.service.CommonService;

@RestController
@RequestMapping("/webservice/common")
public class CommonServiceController {

	@Autowired
	private CommonService cs;
	
	@RequestMapping(value="/login",
			method=RequestMethod.POST)
	public void userLogin(HttpSession session, @RequestParam String username, 
			@RequestParam String password) throws InvalidParametersException{
		cs.userLogin(username, password);
		session.setAttribute("username", username);
	}
	
	@RequestMapping(value="/logout",
			method=RequestMethod.GET)
	public void userLogout(HttpSession session){
		cs.userLogout(session);
	}
	
	@RequestMapping(value="/islogin",
			method=RequestMethod.GET)
	public Map<String, Boolean> isLogin(HttpSession session){
		String username = (String) session.getAttribute("username");
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		if(username != null){
			map.put("isLogin", true);
		}else{
			map.put("isLogin", false);
		}
		return map;
	}
}
