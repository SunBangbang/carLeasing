package com.bluedot.domain;

import java.io.Serializable;
import java.util.Date;

public class CheckTable implements Serializable {
	private long checkId;
	private Date checkDate;
	private String field;
	private String problem;
	private double paying;
	private User user;
	private Renttable rentTable;
	public long getCheckId() {
		return checkId;
	}
	public void setCheckId(long checkId) {
		this.checkId = checkId;
	}
	public Date getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getProblem() {
		return problem;
	}
	public void setProblem(String problem) {
		this.problem = problem;
	}
	public double getPaying() {
		return paying;
	}
	public void setPaying(double paying) {
		this.paying = paying;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Renttable getRentTable() {
		return rentTable;
	}
	public void setRentTable(Renttable rentTable) {
		this.rentTable = rentTable;
	}
	
	
}
