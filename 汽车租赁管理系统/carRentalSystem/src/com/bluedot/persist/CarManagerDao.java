package com.bluedot.persist;

import com.bluedot.domain.Car;
import com.bluedot.domain.Page;

public interface CarManagerDao {
	public void addCar(Car car);
	public Page findCars(Car car,int pageIndex);
	public Car findCar(String carNumber);
	public void updateCar(Car car);
	public void deleteCar(String carNumber);
}
