package com.bluedot.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.sun.media.sound.HsbParser;

public class User implements Serializable {
	private String userName;
	private String identity;
	private String fullName;
	private String sex;
	private String address;
	private String phone;
	private String position;
	private Role role;
	private String userPwd;
	private Set<Renttable> renttables = new HashSet<Renttable>();
	private Set<CheckTable> checkTables = new HashSet<CheckTable>();
	private List<Menu> menus = new ArrayList<Menu>();
	public List<Menu> getMenus() {
		return menus;
	}
	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}
	public Set<CheckTable> getCheckTables() {
		return checkTables;
	}
	public void setCheckTables(Set<CheckTable> checkTables) {
		this.checkTables = checkTables;
	}

	public Set<Renttable> getRenttables() {
		return renttables;
	}
	public void setRenttables(Set<Renttable> renttables) {
		this.renttables = renttables;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
}
