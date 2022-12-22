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
import com.bluedot.domain.CheckTable;
import com.bluedot.domain.Renttable;
import com.bluedot.domain.User;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.service.CarManager;
import com.bluedot.service.OperatorManager;
import com.bluedot.service.impl.CarManagerImpl;
import com.bluedot.service.impl.OperatorManagerImpl;

public class CreateCheckTable extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			CheckTable ct = this.createCheckTable(request);
			OperatorManager om = new OperatorManagerImpl();
			om.createCheckTable(ct);
			response.sendRedirect("ok.jsp");
		}catch(NumberFormatException e){
			
			request.setAttribute(Constants.MESSAGE_KEY,e.getMessage());
			request.getRequestDispatcher("operatorManager/createCheckTable.jsp").forward(request, response);
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
	private CheckTable createCheckTable(HttpServletRequest request){
		String checkId = request.getParameter("checkId");
		String checkDate = request.getParameter("checkDate");
		String field = request.getParameter("field");
		String problem = request.getParameter("problem");
		String paying = request.getParameter("paying");
		String checkUserId = request.getParameter("checkUserId");
		String rentId = request.getParameter("rentId");
		String carNumber = request.getParameter("carNumber");
		CheckTable ct = new CheckTable();
		ct.setCheckId(Long.parseLong(checkId));
		ct.setCheckDate(Tools.formatString(checkDate, "yyyy-MM-dd"));
		ct.setField(field);
		ct.setProblem(problem);
		if(paying != null && paying.length() > 0)
		ct.setPaying(Double.parseDouble(paying));
		User user = new User();
		user.setUserName(checkUserId);
		ct.setUser(user);
		Renttable rent = new Renttable();
		rent.setTableId(Long.parseLong(rentId));
		Car car = new Car();
		car.setCarNumber(carNumber);
		rent.setCar(car);
		ct.setRentTable(rent);
		return ct;
	}
}
