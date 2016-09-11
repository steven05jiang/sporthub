package com.sporthub.common.exception;

import java.io.PrintWriter;
import java.io.StringWriter;

@SuppressWarnings("serial")
public class SporthubException extends Exception {
	public String errorCode;
	
	public SporthubException(){
		super();
	}
	
	public SporthubException(String message){
		super(message);
	}
	
	public SporthubException(String errorCode, String message){
		super(message);
		this.errorCode = errorCode;
	}
	
	public static String toStringWithStackTrace(Throwable e){
		StringWriter sw = new StringWriter();
		e.printStackTrace(new PrintWriter(sw));
		return "\n" + sw.toString();
	}
}
