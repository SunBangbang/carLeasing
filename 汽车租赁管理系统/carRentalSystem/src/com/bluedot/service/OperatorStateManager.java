package com.bluedot.service;

import com.bluedot.domain.Page;
import com.bluedot.domain.Renttable;

public interface OperatorStateManager {
	public Page monthReturnCars(int pageIndex);
	public Renttable findReturnCarByInfo(long tableId);
}
