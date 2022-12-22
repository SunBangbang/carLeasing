package com.bluedot.domain;

import java.io.Serializable;

public class Funs implements Serializable {
	private long funId;
	private String funName;
	private String funUrl;
	private Menu menu;
	
	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	public long getFunId() {
		return funId;
	}
	public void setFunId(long funId) {
		this.funId = funId;
	}
	public String getFunName() {
		return funName;
	}
	public void setFunName(String funName) {
		this.funName = funName;
	}
	public String getFunUrl() {
		return funUrl;
	}
	public void setFunUrl(String funUrl) {
		this.funUrl = funUrl;
	}
	
}
