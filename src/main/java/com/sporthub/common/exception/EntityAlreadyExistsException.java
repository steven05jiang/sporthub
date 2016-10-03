package com.sporthub.common.exception;

@SuppressWarnings("serial")
public class EntityAlreadyExistsException extends RuntimeException {

	public EntityAlreadyExistsException(String message){
		super(message);
	}
}
