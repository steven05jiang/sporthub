package com.sporthub.ui.filter;

import java.io.IOException;
import java.util.HashSet;
import java.util.StringTokenizer;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SessionFilter implements Filter {

	private HashSet<String> checkList;
	
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String url = req.getServletPath();
		for(String checkUrl : checkList){
			char[] cucs = checkUrl.toCharArray();
			char[] ucs = url.toCharArray();
			if(cucs.length > ucs.length) continue;
			int i = 0;
			while(i < cucs.length && cucs[i] == ucs[i]) ++i;
			if(i == cucs.length && req.getSession().getAttribute("username") == null){
				res.sendRedirect("/webapp");
				break;
			}
		}
		
		chain.doFilter(request, response);
	}
	@Override
	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
		String urls = config.getInitParameter("check-urls");
		StringTokenizer stringtokens = new StringTokenizer(urls,",");
		checkList = new HashSet<String>();
		
		while(stringtokens.hasMoreElements()){
			checkList.add(stringtokens.nextToken());
		}
	}

}
