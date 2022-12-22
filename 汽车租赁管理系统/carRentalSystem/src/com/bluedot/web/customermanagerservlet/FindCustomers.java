package com.bluedot.web.customermanagerservlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bluedot.common.Constants;
import com.bluedot.domain.Customers;
import com.bluedot.domain.Page;
import com.bluedot.domain.User;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.service.CustomerManager;
import com.bluedot.service.impl.CustomerManagerImpl;

public class FindCustomers extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String index = request.getParameter("pageIndex");
			Customers cust = this.createCustomers(request);
			CustomerManager cm = new CustomerManagerImpl();
			int pageIndex = 1;
			if(index != null && index.length() > 0){
				pageIndex = Integer.parseInt(index);
			}
		 Page page=	cm.findCustomersByProperty(cust, pageIndex);
		 request = this.requestAddProperty(request, cust);
		 request.setAttribute("pageIndex", pageIndex);
		 request.setAttribute("page", page);
		 request.setAttribute("pageTotal", page.getTotalPage());
		 request.getRequestDispatcher("custManager/viewCustomers.jsp").forward(request, response);
			
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
	private Customers createCustomers(HttpServletRequest request){
		String identity = request.getParameter("identity");
		String custName = request.getParameter("custName");
		String sex = request.getParameter("sex");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String career = request.getParameter("career");
		String custPwd = request.getParameter("custPwd");
		Customers c = new Customers();
		c.setIdentity(identity);
		c.setCustName(custName);
		c.setSex(sex);
		c.setAddress(address);
		c.setPhone(phone);
		c.setCareer(career);
		c.setCustPwd(custPwd);
		return c;
	}
	private HttpServletRequest requestAddProperty(HttpServletRequest request,Customers cust){
		request.setAttribute("identity", cust.getIdentity());
		request.setAttribute("custName", cust.getCustName());
		request.setAttribute("sex", cust.getSex());
		request.setAttribute("address", cust.getAddress());
		request.setAttribute("phone", cust.getPhone());
		request.setAttribute("career", cust.getCareer());
		request.setAttribute("custPwd", cust.getCustPwd());
		return request;
	}
}
