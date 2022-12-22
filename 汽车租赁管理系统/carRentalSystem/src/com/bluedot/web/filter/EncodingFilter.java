package com.bluedot.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {
	private String encode= "utf-8";
	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding(this.encode);
		chain.doFilter(request, response);

	}

	@Override
	public void init(FilterConfig config) throws ServletException {
			String encode = config.getInitParameter("encode");
			if(encode != null || encode.length() > 0){
				this.encode = encode;
			}
		
	}

}
