package com.bluedot.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Customers implements Serializable {
	private String identity;
	private String custName;
	private String sex;
	private String address;
	private String phone;
	private String career;
	private String custPwd;
	private Set<Renttable> rentTables = new HashSet<Renttable>();
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
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
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getCustPwd() {
		return custPwd;
	}
	public void setCustPwd(String custPwd) {
		this.custPwd = custPwd;
	}
	public Set<Renttable> getRentTables() {
		return rentTables;
	}
	public void setRentTables(Set<Renttable> rentTables) {
		this.rentTables = rentTables;
	}
	
}
