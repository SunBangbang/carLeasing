package com.bluedot.service;

import com.bluedot.domain.User;

public interface SystemManager {
	public User userLogin(String userName,String userPwd);
}
