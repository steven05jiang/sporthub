package com.sporthub.common.datatransfer;

import java.util.List;

public abstract class EntityAttributes {
	public boolean isValid(){
		return getInvalidInfo().isEmpty();
	}
	
	public abstract List<String> getInvalidInfo();
	
	public abstract Object toEntity();
	
	//public abstract void sanitizeForSaving();
}
