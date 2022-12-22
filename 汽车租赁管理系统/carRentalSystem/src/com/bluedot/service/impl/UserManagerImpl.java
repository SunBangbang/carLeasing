package com.bluedot.service.impl;

import java.util.List;

import com.bluedot.domain.Page;
import com.bluedot.domain.Role;
import com.bluedot.domain.User;
import com.bluedot.exception.NotFoundValueException;
import com.bluedot.persist.UserManagerDao;
import com.bluedot.persist.impl.UserManagerDaoImpl;
import com.bluedot.service.UserManager;

public class UserManagerImpl implements UserManager {

	@Override
	public List<Role> findAllRoles() {
		UserManagerDao umd = new UserManagerDaoImpl();
		return umd.PreAddUserFindAllRoles();
	}

	@Override
	public void addUser(User user) {
		UserManagerDao umd = new UserManagerDaoImpl();
		umd.addUser(user);
	}

	@Override
	public Page findUserByProperty(User user, int pageIndex) {
		UserManagerDao umd = new UserManagerDaoImpl();
		return umd.findUserByProperty(user, pageIndex);
	}

	@Override
	public User preUpdateUser(String userName) {
		UserManagerDao umd = new UserManagerDaoImpl();
		return umd.preUpdateUser(userName);
	}

	@Override
	public void updateUserProperty(User user) {
		UserManagerDao umd = new UserManagerDaoImpl();
		umd.updateUser(user);
	}

	@Override
	public void deleteUser(String[] arr) {
		UserManagerDao umd = new UserManagerDaoImpl();
		if(arr != null && arr.length > 0){
			for(int i=0;i<arr.length;i++){
				umd.deleteUser(arr[i]);
			}
		}else{
			throw new NotFoundValueException("请选择要删除的数据");
		}
	}

	@Override
	public void changeUserPwd(String userName, String newUserPwd,String oldPwd) {
		UserManagerDao umd = new UserManagerDaoImpl();
	    User user = umd.preUpdateUser(userName);
	    if(user.getUserPwd().equals(oldPwd)){
	    	umd.changeUserPwd(userName, newUserPwd);
	    }else{
	    	throw new NotFoundValueException("旧密码不符，请重新输入");
	    }
	}

}
