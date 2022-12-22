package com.bluedot.persist;

import com.bluedot.domain.Page;
import com.bluedot.domain.Renttable;

public interface OperatorStateManagerDao {
	public Page monthReturnCars(int pageIndex);
	public Renttable findReturnCarByInfo(long tableId);
}
