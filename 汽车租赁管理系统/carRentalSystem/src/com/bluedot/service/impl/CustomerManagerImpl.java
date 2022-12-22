package com.bluedot.service.impl;

import com.bluedot.domain.Customers;
import com.bluedot.domain.Page;
import com.bluedot.domain.User;
import com.bluedot.exception.NotFoundValueException;
import com.bluedot.persist.CustomerManagerDao;
import com.bluedot.persist.impl.CustomerManagerDaoImpl;
import com.bluedot.service.CustomerManager;

public class CustomerManagerImpl implements CustomerManager {

	@Override
	public void addCustomer(Customers cust) {
		CustomerManagerDao cmd = new CustomerManagerDaoImpl();
		cmd.addCustomer(cust);
	}

	@Override
	public Page findCustomersByProperty(Customers cust, int pageIndex) {
		CustomerManagerDao cmd = new CustomerManagerDaoImpl();
		return cmd.findCustomer(cust, pageIndex);
	}

	@Override
	public Customers findCustomersByIndentity(String identity) {
		CustomerManagerDao cmd = new CustomerManagerDaoImpl();
		return cmd.preUpdateCustomers(identity);
	}

	@Override
	public void updateCustomers(Customers cust) {
		CustomerManagerDao cmd = new CustomerManagerDaoImpl();
		cmd.updateCustomers(cust);
	}

	@Override
	public void deleteCustomers(String[] arr) {
		CustomerManagerDao cmd = new CustomerManagerDaoImpl();
		if(arr != null && arr.length > 0){
			for(int i=0;i<arr.length;i++){
				cmd.deleteCustomers(arr[i]);
			}
		}else{
			throw new NotFoundValueException("请选择要删除的数据");
		}
	}

	@Override
	public void changeCustomersPwd(String identity, String newPwd, String oldPwd) {
		CustomerManagerDao cmd = new CustomerManagerDaoImpl();
		Customers cust = cmd.preUpdateCustomers(identity);
		    if(cust.getCustPwd().equals(oldPwd)){
		    	cmd.changeCustomersPwd(identity, newPwd);
		    }else{
		    	throw new NotFoundValueException("旧密码不符，请重新输入");
		    }
		
	}
}
