package com.bluedot.web.operatorstate;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bluedot.common.Constants;
import com.bluedot.domain.Renttable;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.service.OperatorStateManager;
import com.bluedot.service.impl.OperatorStateManagerImpl;

public class FindMonthReturnCarByInfo extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tableId = request.getParameter("tableId");
		try{
			OperatorStateManager osm = new OperatorStateManagerImpl();
			Renttable rent = osm.findReturnCarByInfo(Long.parseLong(tableId));
			request.setAttribute("rent", rent);
			request.getRequestDispatcher("operatorState/findMonthReturnCarByInfo.jsp").forward(request, response);
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
