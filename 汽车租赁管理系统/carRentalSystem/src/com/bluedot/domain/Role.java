package com.bluedot.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Role implements Serializable {
	private long roleId;
	private String roleName;
	private Set<User> users = new HashSet<User>();
	private Set<Menu> menus = new HashSet<Menu>();
	private Set<Funs> funs = new HashSet<Funs>();
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	public Set<Menu> getMenus() {
		return menus;
	}
	public void setMenus(Set<Menu> menus) {
		this.menus = menus;
	}
	public Set<Funs> getFuns() {
		return funs;
	}
	public void setFuns(Set<Funs> funs) {
		this.funs = funs;
	}
	public long getRoleId() {
		return roleId;
	}
	public void setRoleId(long roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
}
