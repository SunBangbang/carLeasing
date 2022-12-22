package com.bluedot.web.customermanagerservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bluedot.common.Constants;
import com.bluedot.domain.Customers;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.exception.NotFoundValueException;
import com.bluedot.service.CustomerManager;
import com.bluedot.service.impl.CustomerManagerImpl;

public class ChangeCustomersPwd extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String identity = request.getParameter("identity");
		String newCustPwd = request.getParameter("newCustPwd");
		String oldPwd = request.getParameter("oldPwd");
		try {
			CustomerManager cm = new CustomerManagerImpl();
			cm.changeCustomersPwd(identity, newCustPwd, oldPwd);
			response.sendRedirect("ok.jsp");
		}catch(NotFoundValueException e){
			Customers cust = new Customers();
			cust.setIdentity(identity);
			request.setAttribute("cust", cust);
			request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
			request.getRequestDispatcher("custManager/chengeCustomersPwd.jsp")
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
