package com.bluedot.web.operatormanagerservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bluedot.common.Constants;
import com.bluedot.common.Tools;
import com.bluedot.domain.Car;
import com.bluedot.domain.Customers;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.exception.NotFoundValueException;
import com.bluedot.service.OperatorManager;
import com.bluedot.service.impl.OperatorManagerImpl;

public class PreCreateRentCarTable extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String identity = request.getParameter("identity");
		try {
			OperatorManager om = new OperatorManagerImpl();
			Customers cust = om.findCustomersByIdentity(identity);
			List<Car> list = om.findCarByIsRenting();
			request.setAttribute("tableId",Tools.getSystemDate().getTime());
			request.setAttribute("cust", cust);
			request.setAttribute("list", list);
			request.getRequestDispatcher("operatorManager/preCreateRenting.jsp").forward(request, response);
		}catch(NotFoundValueException e){
			request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
			request.getRequestDispatcher("operatorManager/rentCar.jsp")
					.forward(request, response);
			e.printStackTrace();
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
}
