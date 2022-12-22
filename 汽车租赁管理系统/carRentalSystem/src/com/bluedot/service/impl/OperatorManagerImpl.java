package com.bluedot.service.impl;

import java.util.Collections;
import java.util.List;

import com.bluedot.common.OrderByCarPrice;
import com.bluedot.domain.Car;
import com.bluedot.domain.CheckTable;
import com.bluedot.domain.Customers;
import com.bluedot.domain.Page;
import com.bluedot.domain.Renttable;
import com.bluedot.domain.User;
import com.bluedot.exception.NotFoundValueException;
import com.bluedot.persist.OperatorManagerDao;
import com.bluedot.persist.impl.OperatorManagerDaoImpl;
import com.bluedot.service.OperatorManager;

public class OperatorManagerImpl implements OperatorManager {

	@Override
	public List<Car> findCarByIsRenting() {
		OperatorManagerDao omd = new OperatorManagerDaoImpl();
		List<Car> list = omd.findAllCarByIsRenting();
		Collections.sort(list, new OrderByCarPrice());
		return list;
	}

	@Override
	public Customers findCustomersByIdentity(String identity) {
		OperatorManagerDao omd = new OperatorManagerDaoImpl();
		Customers cust = omd.finCustomersByIdentity(identity);
		if(cust != null ){
			return cust;
		}else{
			throw new NotFoundValueException("身份证号无效，请重新输入。");
		}
	}

	@Override
	public void createRenttable(Renttable rent) {
		OperatorManagerDao omd = new OperatorManagerDaoImpl();
		omd.createRenttable(rent);
	}

	@Override
	public Renttable findRenttableByTableId(long tableId) {
		OperatorManagerDao omd = new OperatorManagerDaoImpl();
		Renttable rent = omd.findRenttableByTableId(tableId);
		if(rent == null){
			throw new NotFoundValueException("对不起该出租单不存在");
		}else{
			return rent;
		}
	}

	@Override
	public void createCheckTable(CheckTable ct) {
		OperatorManagerDao omd = new OperatorManagerDaoImpl();
		omd.createCheckTable(ct);
	}

	@Override
	public Page findRenttableByProperty(Renttable rent, int pageIndex) {
		OperatorManagerDao omd = new OperatorManagerDaoImpl();
		return omd.findRenttableByProperty(rent, pageIndex);
	}

	@Override
	public void updateRenttable(Renttable rent) {
		OperatorManagerDao omd = new OperatorManagerDaoImpl();
		omd.updateRenttable(rent);
	}

	@Override
	public List<User> findUserAll() {
		OperatorManagerDao omd = new OperatorManagerDaoImpl();
		return omd.findUserAll();
	}

	@Override
	public void deleteRenttables(String[] arr) {
		OperatorManagerDao omd = new OperatorManagerDaoImpl();
		if(arr != null && arr.length > 0){
			for(int i=0;i<arr.length;i++){
				Renttable rent = omd.findRenttableByTableId(Long.parseLong(arr[i]));
				omd.deleteRenttables(rent.getTableId());
			}
		}else{
			throw new NotFoundValueException("请选择要删除的出租单");
		}
	}

	@Override
	public Page findCheckTableByProperty(CheckTable ct, int pageIndex) {
		OperatorManagerDao omd = new OperatorManagerDaoImpl();
		return omd.findCheckTableByProperty(ct, pageIndex);
	}

	@Override
	public CheckTable preUpdateCheckTable(long checkId) {
		OperatorManagerDao omd = new OperatorManagerDaoImpl();
		return omd.preUpdateCheckTable(checkId);
	}

	@Override
	public void updateCheckTable(CheckTable ct) {
		OperatorManagerDao omd = new OperatorManagerDaoImpl();
		omd.updateCheckTable(ct);
	}

	@Override
	public void deleteCheckTable(String[] arr) {
		OperatorManagerDao omd = new OperatorManagerDaoImpl();
		if(arr != null && arr.length > 0){
			for(int i=0;i<arr.length;i++){
				omd.deleteCheckTable(Long.parseLong(arr[i]));
			}
		}else{
			throw new NotFoundValueException("请选择要删除的数据");
		}
	}
}
