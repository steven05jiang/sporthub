package com.sporthub.webservice.template;

import java.util.HashMap;

public class ResultFactory {
	private static HashMap<String, Result> map = new HashMap<String, Result>();

	static{
		map.put("500", new Result("500","Server Error"));
		map.put("200", new Result("200","Request Successfully"));
		map.put("403", new Result("403","Request Forbidden"));
	}
	public static Result getResult(String code){
		Result res = map.get(code);
		return res;
	}
}
