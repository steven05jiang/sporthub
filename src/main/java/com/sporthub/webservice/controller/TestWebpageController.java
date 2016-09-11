package com.sporthub.webservice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestWebpageController {
	//@RequestMapping({"/","homepage"})
	public String index(){
		return "index";
	}
	
	//@RequestMapping("/profile")
	public String profile(){
		return "profile";
	}
}
