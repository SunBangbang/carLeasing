package com.bluedot.domain;

import java.io.Serializable;
import java.util.List;

public class Page implements Serializable {
	private List result;
	private int currIndex;
	private int totalPage;
	public List getResult() {
		return result;
	}
	public void setResult(List result) {
		this.result = result;
	}
	public int getCurrIndex() {
		return currIndex;
	}
	public void setCurrIndex(int currIndex) {
		this.currIndex = currIndex;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
}
