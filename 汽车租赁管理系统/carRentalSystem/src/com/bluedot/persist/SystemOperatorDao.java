package com.bluedot.persist;

import com.bluedot.domain.User;

public interface SystemOperatorDao {
	public User userLogin(String userName);
}
