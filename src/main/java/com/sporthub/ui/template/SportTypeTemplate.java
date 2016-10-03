package com.sporthub.ui.template;

import com.sporthub.common.datatransfer.SportAttributes;

public class SportTypeTemplate {

	String name;
	
	public SportTypeTemplate(){
		super();
	}
	
	public SportTypeTemplate(SportAttributes sport){
		super();
		this.name = sport.getName();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
