package com.bluedot.service;

import com.bluedot.domain.Car;
import com.bluedot.domain.Page;

public interface CarManager {
	public void addCar(Car car);
	public Page findCarsByProperty(Car car,int pageIndex);
	public Car findCarByCarNumber(String carNumber);
	public void updateCar(Car car);
	public void deleteCar(String[] arr);
}
