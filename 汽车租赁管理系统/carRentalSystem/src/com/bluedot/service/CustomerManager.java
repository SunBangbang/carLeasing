package com.bluedot.service;

import com.bluedot.domain.Customers;
import com.bluedot.domain.Page;

public interface CustomerManager {
	public void addCustomer(Customers cust);
	public Page findCustomersByProperty(Customers cust,int pageIndex);
	public Customers findCustomersByIndentity(String identity);
	public void updateCustomers(Customers cust);
	public void deleteCustomers(String[] arr);
	public void changeCustomersPwd(String identity,String newPwd ,String oldPwd);
}
