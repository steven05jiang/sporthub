package com.sporthub.ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	@RequestMapping("/myplans")
	public String getMyPlans(){
		return "myPlans";
	}
	@RequestMapping("/plan/{id}")
	public String getPlan(@PathVariable int id){
		return "plan";
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
