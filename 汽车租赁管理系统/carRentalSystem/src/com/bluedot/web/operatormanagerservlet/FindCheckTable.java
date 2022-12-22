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
import com.bluedot.domain.Page;
import com.bluedot.domain.Renttable;
import com.bluedot.domain.User;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.service.CarManager;
import com.bluedot.service.OperatorManager;
import com.bluedot.service.impl.CarManagerImpl;
import com.bluedot.service.impl.OperatorManagerImpl;

public class FindCheckTable extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String index = request.getParameter("pageIndex");
			CheckTable ct = this.createCheckTable(request);
			OperatorManager om = new OperatorManagerImpl();
			int pageIndex = 1;
			if(index != null && index.length() > 0){
				pageIndex = Integer.parseInt(index);
			}
		 Page page=	om.findCheckTableByProperty(ct, pageIndex);
		 request = this.requestAddProperty(request, ct);
		 request.setAttribute("pageIndex", pageIndex);
		 request.setAttribute("page", page);
		 request.setAttribute("pageTotal", page.getTotalPage());
		 request.getRequestDispatcher("operatorManager/viewCheckTables.jsp").forward(request, response);
		}catch(NumberFormatException e){
			String[] arr = e.getMessage().split(":");
			request.setAttribute(Constants.MESSAGE_KEY, "输入内容格式有误，请重新输入。错误提示:["+arr[1]+"]");
			request.getRequestDispatcher("operatorManager/checkManager.jsp").forward(request, response);
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
		String userName = request.getParameter("userName");
		String tableId = request.getParameter("tableId");
		CheckTable ct = new CheckTable();
		if(checkId != null && checkId.length() > 0)
		ct.setCheckId(Long.parseLong(checkId));
		if(checkDate != null && checkDate.length() > 0)
		ct.setCheckDate(Tools.formatString(checkDate, "yyyy-MM-dd"));
		User user = new User();
		user.setUserName(userName);
		ct.setUser(user);
		Renttable rent = new Renttable();
		if(tableId != null && tableId.length() > 0)
		rent.setTableId(Long.parseLong(tableId));
		ct.setRentTable(rent);
		return ct;
	}
	private HttpServletRequest requestAddProperty(HttpServletRequest request,CheckTable ct){
		String checkId = request.getParameter("checkId");
		String checkDate = request.getParameter("checkDate");
		String userName = request.getParameter("userName");
		String tableId = request.getParameter("tableId");
		request.setAttribute("checkId", ct.getCheckId());
		request.setAttribute("checkDate", ct.getCheckDate());
		request.setAttribute("userName", ct.getUser().getUserName());
		request.setAttribute("tableId", ct.getRentTable().getTableId());
		return request;
	}
}
