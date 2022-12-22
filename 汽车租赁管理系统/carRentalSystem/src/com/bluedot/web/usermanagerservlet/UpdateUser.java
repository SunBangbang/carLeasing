package com.bluedot.web.usermanagerservlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bluedot.common.Constants;
import com.bluedot.domain.Role;
import com.bluedot.domain.User;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.service.UserManager;
import com.bluedot.service.impl.UserManagerImpl;

public class UpdateUser extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			User user = this.createUser(request);
			UserManager um = new UserManagerImpl();
			um.updateUserProperty(user);

			response.sendRedirect("ok.jsp");
		} catch (DataAccessException e) {
			request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
			e.printStackTrace();
		} catch (ApplicationException e) {
			response.sendRedirect("appError.jsp");
			e.printStackTrace();
		} catch (Exception e) {
			response.sendRedirect("appError.jsp");
			e.printStackTrace();
		}

	}
	private User createUser(HttpServletRequest request) {
		String userName = request.getParameter("userName");
		String identity = request.getParameter("identity");
		String fullName = request.getParameter("fullName");
		String sex = request.getParameter("sex");
		String address = request.getParameter("address");
		String position = request.getParameter("position");
		String userLevel = request.getParameter("userLevel");
		String phone = request.getParameter("phone");
		User user = new User();
		user.setUserName(userName);
		user.setIdentity(identity);
		user.setFullName(fullName);
		user.setSex(sex);
		user.setAddress(address);
		user.setPosition(position);
		user.setPhone(phone);
		Role role = new Role();
		role.setRoleId(Long.parseLong(userLevel));
		user.setRole(role);
		return user;
	}
}
