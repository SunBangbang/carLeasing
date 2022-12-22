package com.bluedot.web.operatormanagerservlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bluedot.common.Constants;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.exception.NotFoundValueException;
import com.bluedot.service.CarManager;
import com.bluedot.service.OperatorManager;
import com.bluedot.service.impl.CarManagerImpl;
import com.bluedot.service.impl.OperatorManagerImpl;

public class DeleteRenttable extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] arr = request.getParameterValues("dels");
		try{
			OperatorManager om = new OperatorManagerImpl();
			om.deleteRenttables(arr);
			response.sendRedirect("ok.jsp");
		}catch(NotFoundValueException e){
			request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
			request.getRequestDispatcher("RentManagerSearch.do").forward(request, response);
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
