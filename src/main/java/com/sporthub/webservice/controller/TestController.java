package com.sporthub.webservice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.bind.annotation.*;

import com.sporthub.common.datatransfer.UserAttributes;
import com.sporthub.logic.service.*;
import com.sporthub.storage.dao.UserDAO;
import com.sporthub.storage.dao.UserDAOImp;
import com.sporthub.storage.entity.User;
import com.sporthub.webservice.template.*;

@RestController
//@RequestMapping("/webservice")
public class TestController {

	@Autowired
	private UserService us;
	
	public TestController(){
		super();
	}
	
	public void setUs(UserService us){
		this.us = us;
	}
	
	public UserService getUs(){
		return us;
	}
	
	@SuppressWarnings("resource")
	//@RequestMapping(value="/createuser",
			//method=RequestMethod.POST)
	public Result createUser(@RequestBody UserAttributes user){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("Spring-Servlet.xml");
		UserService us = (UserService) context.getBean("userService");
		return null;
	}
	
	//@RequestMapping(value="/testget",
			//method=RequestMethod.GET)
	public Result testResult(){
		return ResultFactory.getResult("200");
	}
}
