package com.bluedot.persist;

import com.bluedot.domain.Customers;
import com.bluedot.domain.Page;

public interface CustomerManagerDao {
	public void addCustomer(Customers cust);
	public Page findCustomer(Customers cust,int pageIndex);
	public Customers preUpdateCustomers(String identity);
	public void updateCustomers(Customers cust);
	public void deleteCustomers(String identity);
	public void changeCustomersPwd(String identity,String newCustPwd);
}
