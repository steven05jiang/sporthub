package com.sporthub.ui.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.sporthub.logic.service.SportService;
import com.sporthub.ui.template.SportTypeTemplate;

@RestController
@RequestMapping(value="/webservice/sport")
public class SportController {

	@Autowired
	private SportService ss;
	
	@RequestMapping(value="/getalltypes",
			method=RequestMethod.GET)
	public Set<SportTypeTemplate> getSportTypes(){
		return ss.getAllSportTypes();
	}
}
