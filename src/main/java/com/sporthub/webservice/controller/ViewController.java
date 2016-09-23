package com.sporthub.webservice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

	@RequestMapping({"/","/homepage"})
	public String getHomepage(){
		return "index";
	}
	@RequestMapping("/profile")
	public String getProfile(){
		return "profile";
	}
	@RequestMapping("/elements")
	public String elements(){
		return "index";
	}
	@RequestMapping("/generic")
	public String generic(){
		return "generic";
	}
	
}
