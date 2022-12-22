package com.bluedot.web.filter;

import java.io.IOException;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bluedot.common.Constants;
import com.bluedot.domain.Funs;
import com.bluedot.domain.User;

public class SafeFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String uri = req.getRequestURI();

		User user = (User) session
				.getAttribute(Constants.USER_LOGIN_SESSION_KEY);
		if (uri.endsWith(".jsp") || uri.endsWith(".do")) {
			if (uri.indexOf("login.jsp") != -1 || uri.indexOf("Login.do") != -1) {
				chain.doFilter(request, response);
			} else {

				Set<Funs> funs = user.getRole().getFuns();
				boolean flag = false;
				Iterator<Funs> it = funs.iterator();
				while (it.hasNext()) {
					Funs f = it.next();
					if (uri.indexOf(f.getFunUrl()) != -1) {
						flag = true;
						break;
					}
				}
				if (flag) {
					chain.doFilter(request, response);
				} else {
					((HttpServletResponse) response).sendRedirect("/carRentalSystem/norole.jsp");
				}
			}
		} else {
			chain.doFilter(request, response);
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
