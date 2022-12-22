package com.bluedot.web.carmanagerservlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bluedot.common.Constants;
import com.bluedot.domain.Car;
import com.bluedot.domain.Customers;
import com.bluedot.domain.Page;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.service.CarManager;
import com.bluedot.service.CustomerManager;
import com.bluedot.service.impl.CarManagerImpl;
import com.bluedot.service.impl.CustomerManagerImpl;

public class FindCar extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String index = request.getParameter("pageIndex");
			Car car = this.createCar(request);
			CarManager cm = new CarManagerImpl();
			int pageIndex = 1;
			if(index != null && index.length() > 0){
				pageIndex = Integer.parseInt(index);
			}
		 Page page=	cm.findCarsByProperty(car, pageIndex);
		 request = this.requestAddProperty(request, car);
		 request.setAttribute("pageIndex", pageIndex);
		 request.setAttribute("page", page);
		 request.setAttribute("pageTotal", page.getTotalPage());
		 request.getRequestDispatcher("carManager/viewCars.jsp").forward(request, response);
		}catch(NumberFormatException e){
			String[] arr = e.getMessage().split(":");
			request.setAttribute(Constants.MESSAGE_KEY, "输入内容格式有误，请重新输入。错误提示:["+arr[1]+"]");
			request.getRequestDispatcher("carManager/findCar.jsp").forward(request, response);
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
	private Car createCar(HttpServletRequest request){
		String carNumber = request.getParameter("carNumber");
		String carType = request.getParameter("carType");
		String color = request.getParameter("color");
		String price = request.getParameter("price");
		String rentPrice = request.getParameter("rentPrice");
		String deposit = request.getParameter("deposit");
		String isRenting = request.getParameter("isRenting");
		Car car = new Car();
		car.setCarNumber(carNumber);
		car.setCarType(carType);
		car.setColor(color);
		if(price != null && price.length() > 0)
		car.setPrice(Double.parseDouble(price));
		if(rentPrice != null && rentPrice.length() > 0)
		car.setRentPrice(Double.parseDouble(rentPrice));
		if(deposit != null && deposit.length() > 0)
		car.setDeposit(Double.parseDouble(deposit));
		car.setIsRenting(isRenting);
		return car;
	}
	private HttpServletRequest requestAddProperty(HttpServletRequest request,Car car){
		request.setAttribute("carNumber", car.getCarNumber());
		request.setAttribute("carType", car.getCarType());
		request.setAttribute("color", car.getColor());
		request.setAttribute("price", car.getPrice());
		request.setAttribute("rentPrice", car.getRentPrice());
		request.setAttribute("deposit", car.getDeposit());
		request.setAttribute("isRenting", car.getIsRenting());
		return request;
	}
}
