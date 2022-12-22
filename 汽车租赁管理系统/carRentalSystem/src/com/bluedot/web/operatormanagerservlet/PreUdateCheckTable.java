package com.bluedot.web.operatormanagerservlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bluedot.common.Constants;
import com.bluedot.common.Tools;
import com.bluedot.domain.CheckTable;
import com.bluedot.domain.Renttable;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.exception.NotFoundValueException;
import com.bluedot.service.OperatorManager;
import com.bluedot.service.impl.OperatorManagerImpl;

public class PreUdateCheckTable extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String checkId =request.getParameter("checkId");
		try {
			OperatorManager om = new OperatorManagerImpl();
			CheckTable ck = om.preUpdateCheckTable(Long.parseLong(checkId));
			request.setAttribute("ck", ck);
			request.setAttribute("rent", ck.getRentTable());
			request.getRequestDispatcher("operatorManager/updateCheckTable.jsp").forward(request, response);
		}catch(NumberFormatException e){
			String[] arr = e.getMessage().split(":");
			request.setAttribute(Constants.MESSAGE_KEY, "输入内容格式有误，请重新输入。错误提示:["+arr[1]+"]");
			request.getRequestDispatcher("operatorManager/returnCar.jsp").forward(request, response);
			e.printStackTrace();
		}catch(NotFoundValueException e){
			request.setAttribute(Constants.MESSAGE_KEY, e.getMessage());
			request.getRequestDispatcher("operatorManager/returnCar.jsp")
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
