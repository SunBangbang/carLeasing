package com.bluedot.web.usermanagerservlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bluedot.common.Constants;
import com.bluedot.domain.Page;
import com.bluedot.domain.Role;
import com.bluedot.domain.User;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.service.UserManager;
import com.bluedot.service.impl.UserManagerImpl;

public class FindUser extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String index = request.getParameter("pageIndex");
			User user = this.createUser(request);
			UserManager um = new UserManagerImpl();
			int pageIndex = 1;
			if(index != null && index.length() > 0){
				pageIndex = Integer.parseInt(index);
			}
		 Page page=	um.findUserByProperty(user, pageIndex);
		 request = this.requestAddProperty(request, user);
		 request.setAttribute("pageIndex", pageIndex);
		 request.setAttribute("page", page);
		 request.setAttribute("pageTotal", page.getTotalPage());
		 request.getRequestDispatcher("userManager/viewUser.jsp").forward(request, response);
			
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
		String userPwd = request.getParameter("userPwd");
		String phone = request.getParameter("phone");
		User user = new User();
		user.setUserName(userName);
		user.setIdentity(identity);
		user.setFullName(fullName);
		user.setSex(sex);
		user.setAddress(address);
		user.setPosition(position);
		user.setUserPwd(userPwd);
		user.setPhone(phone);
		Role role = new Role();
		role.setRoleId(Long.parseLong(userLevel));
		user.setRole(role);
		return user;
	}
	private HttpServletRequest requestAddProperty(HttpServletRequest request,User user){
		request.setAttribute("userName", user.getUserName());
		request.setAttribute("identity", user.getIdentity());
		request.setAttribute("fullName", user.getFullName());
		request.setAttribute("sex", user.getSex());
		request.setAttribute("address", user.getAddress());
		request.setAttribute("phone", user.getPhone());
		request.setAttribute("position", user.getPosition());
		request.setAttribute("userLevel", user.getRole().getRoleId());
		request.setAttribute("userpwd", user.getUserPwd());
		return request;
	}
}
