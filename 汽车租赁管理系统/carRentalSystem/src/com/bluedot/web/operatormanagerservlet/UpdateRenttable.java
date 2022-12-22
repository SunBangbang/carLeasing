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
import com.bluedot.domain.Renttable;
import com.bluedot.domain.User;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.service.OperatorManager;
import com.bluedot.service.impl.OperatorManagerImpl;

public class UpdateRenttable extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Renttable rent = this.createRent(request);
			OperatorManager om = new OperatorManagerImpl();
			om.updateRenttable(rent);
			response.sendRedirect("ok.jsp");
		}catch(NumberFormatException e){
			String[] arr = e.getMessage().split(":");
			request.setAttribute(Constants.MESSAGE_KEY, "输入内容格式有误，请重新输入。错误提示:["+arr[1]+"]");
			request.getRequestDispatcher("operatorManager/preCreateRenting.jsp").forward(request, response);
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
		String imprest = request.getParameter("imprest");
		String shouldPayPrice = request.getParameter("shouldPayPrice");
		String price = request.getParameter("price");
		String beginDate = request.getParameter("beginDate");
		String shouldReturnDate = request.getParameter("shouldReturnDate");
		String returnDate = request.getParameter("returnDate");
		String rentFlag = request.getParameter("rentFlag");
		
		String userName = request.getParameter("userName");
		Renttable rent = new Renttable();
		rent.setTableId(Long.parseLong(tableId));
		rent.setImprest(Double.parseDouble(imprest));
		rent.setPrice(Double.parseDouble(price));
		rent.setShouldPayPrice(Double.parseDouble(shouldPayPrice));
		rent.setBeginDate(Tools.formatString(beginDate, "yyyy-MM-dd"));
		rent.setShouldReturnDate(Tools.formatString(shouldReturnDate, "yyyy-MM-dd"));
		rent.setRentFlag(Integer.parseInt(rentFlag));
		if(returnDate != null && returnDate.length() > 0)
		rent.setReturnDate(Tools.formatString(returnDate, "yyyy-MM-dd"));
		User user = new User();
		user.setUserName(userName);
		rent.setUser(user);
		return rent;
	}
}
