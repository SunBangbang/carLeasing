package com.bluedot.web.carmanagerservlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.bluedot.common.Constants;
import com.bluedot.domain.Car;
import com.bluedot.domain.Customers;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.service.CarManager;
import com.bluedot.service.CustomerManager;
import com.bluedot.service.impl.CarManagerImpl;
import com.bluedot.service.impl.CustomerManagerImpl;

public class AddCar extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Car car = this.createCar(request);
			CarManager cm = new CarManagerImpl();
			cm.addCar(car);
			this.fileUpload(request);
			response.sendRedirect("ok.jsp");
		}catch(NumberFormatException e){
			String[] arr = e.getMessage().split(":");
			request.setAttribute(Constants.MESSAGE_KEY, "输入内容格式有误，请重新输入。错误提示:["+arr[1]+"]");
			request.getRequestDispatcher("carManager/addCar.jsp").forward(request, response);
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
		String cardesc = request.getParameter("cardesc");
		Car car = new Car();
		car.setCarNumber(carNumber);
		car.setCarType(carType);
		car.setColor(color);
		car.setPrice(Double.parseDouble(price));
		car.setRentPrice(Double.parseDouble(rentPrice));
		car.setDeposit(Double.parseDouble(deposit));
		car.setIsRenting(isRenting);
		car.setCardesc(cardesc);
		return car;
	}
	private void fileUpload(HttpServletRequest request){
		ServletContext sc = this.getServletContext();
		String realPath = sc.getRealPath("/upload");
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(factory);
		try {
			List<FileItem> list = sfu.parseRequest(request);
			for (FileItem item : list) {
				if (item.isFormField()) {
					String name = item.getFieldName();
					String value = item.getString("utf-8");
				} else {
					String name = item.getFieldName();
					String value = item.getName();
					int start = value.lastIndexOf("\\");
					String fileName = value.substring(start + 1);
					InputStream is = item.getInputStream();
					OutputStream os = new FileOutputStream(new File(realPath,
							fileName));
					byte[] b = new byte[1024];
					int len = 0;
					while ((len = is.read(b)) > 0) {
						os.write(b, 0, len);
					}
					os.flush();
					os.close();
					is.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
