package com.bluedot.web.systemservlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bluedot.common.Constants;
import com.bluedot.domain.User;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.exception.NotFoundUserException;
import com.bluedot.service.SystemManager;
import com.bluedot.service.impl.SystemManagerImpl;

public class Login extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String userName = request.getParameter("userName");
			String userPwd = request.getParameter("userPwd");
			try{
				SystemManager sm = new SystemManagerImpl();
				User user = sm.userLogin(userName, userPwd);
				HttpSession session=request.getSession();
				session.setAttribute(Constants.USER_LOGIN_SESSION_KEY, user);
				response.sendRedirect("index.jsp");
			}catch(NotFoundUserException e){
				request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
				request.getRequestDispatcher("login.jsp").forward(request, response);
				e.printStackTrace();
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
