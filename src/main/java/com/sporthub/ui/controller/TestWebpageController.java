package com.sporthub.ui.controller;

import org.springframework.stereotype.Controller;

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
