package com.bluedot.service;

import java.util.List;

import com.bluedot.domain.Car;
import com.bluedot.domain.CheckTable;
import com.bluedot.domain.Customers;
import com.bluedot.domain.Page;
import com.bluedot.domain.Renttable;
import com.bluedot.domain.User;

public interface OperatorManager {
	public Customers findCustomersByIdentity(String identity);
	public List<Car> findCarByIsRenting();
	public void createRenttable(Renttable rent);
	public Renttable findRenttableByTableId(long tableId);
	public void createCheckTable(CheckTable ct);
	public Page findRenttableByProperty(Renttable rent,int pageIndex);
	public void updateRenttable(Renttable rent);
	public List<User> findUserAll();
	public void deleteRenttables(String[] arr);
	public Page findCheckTableByProperty(CheckTable ct, int pageIndex);
	public CheckTable preUpdateCheckTable(long checkId);
	public void updateCheckTable(CheckTable ct);
	public void deleteCheckTable(String[] arr);
}
