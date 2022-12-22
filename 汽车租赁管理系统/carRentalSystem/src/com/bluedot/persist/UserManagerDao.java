package com.bluedot.persist;

import java.util.List;

import com.bluedot.domain.Page;
import com.bluedot.domain.Role;
import com.bluedot.domain.User;

public interface UserManagerDao {
	public List<Role> PreAddUserFindAllRoles();
	public void addUser(User user);
	public Page findUserByProperty(User user,int pageIndex);
	public User preUpdateUser(String userName);
	public void updateUser(User user);
	public void deleteUser(String userName);
	public void changeUserPwd(String userName,String newUserPwd);
}
