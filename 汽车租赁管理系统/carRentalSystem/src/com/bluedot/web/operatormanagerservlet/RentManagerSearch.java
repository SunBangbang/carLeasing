package com.bluedot.web.operatormanagerservlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bluedot.common.Constants;
import com.bluedot.common.Tools;
import com.bluedot.domain.Car;
import com.bluedot.domain.Customers;
import com.bluedot.domain.Page;
import com.bluedot.domain.Renttable;
import com.bluedot.domain.User;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.service.CarManager;
import com.bluedot.service.OperatorManager;
import com.bluedot.service.impl.CarManagerImpl;
import com.bluedot.service.impl.OperatorManagerImpl;

public class RentManagerSearch extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String index = request.getParameter("pageIndex");
			Renttable rent = this.createRent(request);
			OperatorManager om = new OperatorManagerImpl();
			int pageIndex = 1;
			if(index != null && index.length() > 0){
				pageIndex = Integer.parseInt(index);
			}
		 Page page=	om.findRenttableByProperty(rent, pageIndex);
		 request = this.requestAddProperty(request, rent);
		 request.setAttribute("pageIndex", pageIndex);
		 request.setAttribute("page", page);
		 request.setAttribute("pageTotal", page.getTotalPage());
		 request.getRequestDispatcher("operatorManager/viewRenttables.jsp").forward(request, response);
		}catch(NumberFormatException e){
			String[] arr = e.getMessage().split(":");
			request.setAttribute(Constants.MESSAGE_KEY, "输入内容格式有误，请重新输入。错误提示:["+arr[1]+"]");
			request.getRequestDispatcher("operatorManager/viewRenttables.jsp").forward(request, response);
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
	private Renttable createRent(HttpServletRequest request){
		String tableId = request.getParameter("tableId");
		String beginDate = request.getParameter("beginDate");
		String shouldReturnDate = request.getParameter("shouldReturnDate");
		String returnDate = request.getParameter("returnDate");
		String rentFlag = request.getParameter("rentFlag");
		String carNumber = request.getParameter("carNumber");
		String identity = request.getParameter("identity");
		String userName = request.getParameter("userName");
		
		Renttable rent = new Renttable();
		if(tableId != null && tableId.length() > 0)
		rent.setTableId(Long.parseLong(tableId));
		if(beginDate != null && beginDate.length() > 0)
		rent.setBeginDate(Tools.formatString(beginDate, "yyyy-MM-dd"));
		if(shouldReturnDate != null && shouldReturnDate.length() > 0)
		rent.setShouldReturnDate(Tools.formatString(shouldReturnDate, "yyyy-MM-dd"));
		if(returnDate != null && returnDate.length() > 0)
		rent.setReturnDate(Tools.formatString(returnDate, "yyyy-MM-dd"));
		if(rentFlag != null && rentFlag.length() > 0)
		rent.setRentFlag(Integer.parseInt(rentFlag));
		
		Car car = new Car();
		car.setCarNumber(carNumber);
		rent.setCar(car);
		Customers cust = new Customers();
		cust.setIdentity(identity);
		rent.setCust(cust);
		User user = new User();
		user.setUserName(userName);
		rent.setUser(user);
		return rent;
	}
	private HttpServletRequest requestAddProperty(HttpServletRequest request,Renttable rent){
		request.setAttribute("tableId",rent.getTableId() );
		request.setAttribute("beginDate",rent.getBeginDate() );
		request.setAttribute("shouldReturnDate",rent.getShouldReturnDate());
		request.setAttribute("returnDate",rent.getReturnDate() );
		request.setAttribute("rentFlag", rent.getRentFlag());
		request.setAttribute("carNumber",rent.getCar().getCarNumber() );
		request.setAttribute("identity", rent.getCust().getIdentity());
		request.setAttribute("userName", rent.getUser().getUserName());
		return request;
	}
}
