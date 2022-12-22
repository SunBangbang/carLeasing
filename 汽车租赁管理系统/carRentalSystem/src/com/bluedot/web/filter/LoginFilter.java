package com.bluedot.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.bluedot.common.Constants;
import com.bluedot.domain.User;

public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		User user = (User) session
				.getAttribute(Constants.USER_LOGIN_SESSION_KEY);
		if (req.getRequestURI().indexOf("login.jsp") != -1
				||req.getRequestURI().indexOf("Login.do") != -1 || req.getRequestURI().endsWith(".jpg")||req.getRequestURI().endsWith(".css")|| req.getRequestURI().endsWith(".png")|| req.getRequestURI().endsWith(".gif")) {
			chain.doFilter(request, response);
		} else {
			if (user != null && user.getUserName().length() > 0) {
				chain.doFilter(request, response);
			} else {
				request.setAttribute(Constants.MESSAGE_KEY, "请登录");
				request.getRequestDispatcher("/login.jsp").forward(request,
						response);
			}
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
