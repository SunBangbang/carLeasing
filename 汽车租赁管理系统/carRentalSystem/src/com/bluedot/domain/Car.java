package com.bluedot.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Car implements Serializable {
	private String carNumber;
	private String carType;
	private String color;
	private double price;
	private double rentPrice;
	private double deposit;
	private String isRenting;
	private String cardesc;
	private Set<Car> cars = new HashSet<Car>();
	public Set<Car> getCars() {
		return cars;
	}
	public void setCars(Set<Car> cars) {
		this.cars = cars;
	}
	public String getCarNumber() {
		return carNumber;
	}
	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}
	public String getCarType() {
		return carType;
	}
	public void setCarType(String carType) {
		this.carType = carType;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getRentPrice() {
		return rentPrice;
	}
	public void setRentPrice(double rentPrice) {
		this.rentPrice = rentPrice;
	}
	public double getDeposit() {
		return deposit;
	}
	public void setDeposit(double deposit) {
		this.deposit = deposit;
	}
	public String getIsRenting() {
		return isRenting;
	}
	public void setIsRenting(String isRenting) {
		this.isRenting = isRenting;
	}
	public String getCardesc() {
		return cardesc;
	}
	public void setCardesc(String cardesc) {
		this.cardesc = cardesc;
	}
	
}
