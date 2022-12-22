package com.bluedot.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Renttable implements Serializable {
	private long tableId;
	private double imprest;
	private double shouldPayPrice;
	private double price;
	private Date beginDate;
	private Date shouldReturnDate;
	private Date returnDate;
	private int rentFlag;
	private Customers cust;
	private Car car;
	private User user;
	private Set<CheckTable> checkTable = new HashSet<CheckTable>();
	public long getTableId() {
		return tableId;
	}
	public void setTableId(long tableId) {
		this.tableId = tableId;
	}
	public double getImprest() {
		return imprest;
	}
	public void setImprest(double imprest) {
		this.imprest = imprest;
	}
	public double getShouldPayPrice() {
		return shouldPayPrice;
	}
	public void setShouldPayPrice(double shouldPayPrice) {
		this.shouldPayPrice = shouldPayPrice;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Date getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	public Date getShouldReturnDate() {
		return shouldReturnDate;
	}
	public void setShouldReturnDate(Date shouldReturnDate) {
		this.shouldReturnDate = shouldReturnDate;
	}
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	public int getRentFlag() {
		return rentFlag;
	}
	public void setRentFlag(int rentFlag) {
		this.rentFlag = rentFlag;
	}
	public Customers getCust() {
		return cust;
	}
	public void setCust(Customers cust) {
		this.cust = cust;
	}
	public Car getCar() {
		return car;
	}
	public void setCar(Car car) {
		this.car = car;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
