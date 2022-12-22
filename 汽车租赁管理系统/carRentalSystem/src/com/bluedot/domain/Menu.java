package com.bluedot.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Menu implements Serializable {
	private long menuId;
	private String menuName;
	private String connUrl;
	private int fatherId;
	private Set<Role> roles = new HashSet<Role>();
	private Set<Funs> funs = new HashSet<Funs>();
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	public Set<Funs> getFuns() {
		return funs;
	}
	public void setFuns(Set<Funs> funs) {
		this.funs = funs;
	}
	public long getMenuId() {
		return menuId;
	}
	public void setMenuId(long menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getConnUrl() {
		return connUrl;
	}
	public void setConnUrl(String connUrl) {
		this.connUrl = connUrl;
	}
	public int getFatherId() {
		return fatherId;
	}
	public void setFatherId(int fatherId) {
		this.fatherId = fatherId;
	}
	
}
