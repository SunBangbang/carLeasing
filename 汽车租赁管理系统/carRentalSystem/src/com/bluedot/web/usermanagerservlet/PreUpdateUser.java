package com.bluedot.web.usermanagerservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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

public class PreUpdateUser extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("userName");
		try{
			UserManager um = new UserManagerImpl();
			User user = um.preUpdateUser(userName);
			List<Role> list = um.findAllRoles();
			request.setAttribute("user", user);
			request.setAttribute("roles", list);
			request.getRequestDispatcher("userManager/updateUser.jsp").forward(request, response);
		}catch(DataAccessException e){
			request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
			e.printStackTrace();
		}catch(ApplicationException e){
			response.sendRedirect("appError.jsp");
			e.printStackTrace();
		}catch(Exception e){
			response.sendRedirect("appError.jsp");
			e.printStackTrace();
		}
	}
}
