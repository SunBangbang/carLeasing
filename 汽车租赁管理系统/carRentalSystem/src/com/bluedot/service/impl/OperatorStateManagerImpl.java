package com.bluedot.service.impl;

import com.bluedot.domain.Page;
import com.bluedot.domain.Renttable;
import com.bluedot.persist.OperatorStateManagerDao;
import com.bluedot.persist.impl.OperatorStateManagerDaoImpl;
import com.bluedot.service.OperatorStateManager;

public class OperatorStateManagerImpl implements OperatorStateManager {

	@Override
	public Page monthReturnCars(int pageIndex) {
		OperatorStateManagerDao osm = new OperatorStateManagerDaoImpl();
		return  osm.monthReturnCars(pageIndex);
	}

	@Override
	public Renttable findReturnCarByInfo(long tableId) {
		OperatorStateManagerDao osm = new OperatorStateManagerDaoImpl();
		return osm.findReturnCarByInfo(tableId);
	}
}
