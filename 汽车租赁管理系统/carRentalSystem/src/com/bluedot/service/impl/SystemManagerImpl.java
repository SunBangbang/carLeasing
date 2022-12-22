package com.bluedot.service.impl;

import com.bluedot.domain.User;
import com.bluedot.exception.NotFoundUserException;
import com.bluedot.persist.SystemOperatorDao;
import com.bluedot.persist.impl.SystemOperatorDaoImpl;
import com.bluedot.service.SystemManager;

public class SystemManagerImpl implements SystemManager {

	@Override
	public User userLogin(String userName, String userPwd) {
		SystemOperatorDao sod = new SystemOperatorDaoImpl();
		User user = sod.userLogin(userName);
		if(user == null){
			throw new NotFoundUserException("用户不存在！");
		}else{
			if(!userPwd.equals(user.getUserPwd())){
				throw new NotFoundUserException("密码有误！");
			}
		}
		return user;
	}
	
}
