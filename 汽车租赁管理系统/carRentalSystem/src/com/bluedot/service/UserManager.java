package com.bluedot.service;

import java.util.List;

import com.bluedot.domain.Page;
import com.bluedot.domain.Role;
import com.bluedot.domain.User;

public interface UserManager {
	public List<Role> findAllRoles();
	public void addUser(User user);
	public Page findUserByProperty(User user,int pageIndex);
	public User preUpdateUser(String userName);
	public void updateUserProperty(User user);
	public void deleteUser(String[] arr);
	public void changeUserPwd(String userName,String newUserPwd,String oldPwd);
}
