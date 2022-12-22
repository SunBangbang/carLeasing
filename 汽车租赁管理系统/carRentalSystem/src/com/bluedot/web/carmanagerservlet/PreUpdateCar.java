package com.bluedot.web.carmanagerservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bluedot.common.Constants;
import com.bluedot.domain.Car;
import com.bluedot.domain.Customers;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.service.CarManager;
import com.bluedot.service.CustomerManager;
import com.bluedot.service.impl.CarManagerImpl;
import com.bluedot.service.impl.CustomerManagerImpl;

public class PreUpdateCar extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String carNumber = request.getParameter("carNumber");
		try{
			CarManager cm = new CarManagerImpl();
			Car car = cm.findCarByCarNumber(carNumber);
			request.setAttribute("car", car);
			request.getRequestDispatcher("carManager/updateCar.jsp").forward(request, response);
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
