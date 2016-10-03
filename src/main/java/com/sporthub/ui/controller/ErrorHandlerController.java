package com.sporthub.ui.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.sporthub.common.exception.*;

@ControllerAdvice
public class ErrorHandlerController {
	
	@ExceptionHandler(InvalidParametersException.class)
	@ResponseStatus(value=HttpStatus.BAD_REQUEST)
	public @ResponseBody Map<String, Object> InvalidParametersException(InvalidParametersException e){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("error_message", e.getMessage());
		return map;
	}
	
	@ExceptionHandler(UnauthorizedAccessException.class)
	@ResponseStatus(value=HttpStatus.UNAUTHORIZED)
	public @ResponseBody Map<String, Object> UnauthorizedAccessException(UnauthorizedAccessException e){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("error_message", e.getMessage());
		return map;
	}
	
	@ExceptionHandler(EntityAlreadyExistsException.class)
	@ResponseStatus(value=HttpStatus.FORBIDDEN)
	public @ResponseBody Map<String, Object> EntityAlreadyExistsException(EntityAlreadyExistsException e){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("error_message", e.getMessage());
		return map;
	}
	
	@ExceptionHandler(EntityNotFoundException.class)
	@ResponseStatus(value=HttpStatus.NOT_FOUND)
	public @ResponseBody Map<String, Object> EntityNotFoundException(EntityNotFoundException e){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("error_message", e.getMessage());
		return map;
	}
	
	@ExceptionHandler(RuntimeException.class)
	@ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR)
	public @ResponseBody Map<String, Object> RuntimeException(RuntimeException e){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("error_message", e.getMessage());
		return map;
	}
}
