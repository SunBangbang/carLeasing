package com.bluedot.service.impl;

import com.bluedot.domain.Car;
import com.bluedot.domain.Page;
import com.bluedot.exception.NotFoundValueException;
import com.bluedot.persist.CarManagerDao;
import com.bluedot.persist.impl.CarManagerDaoImpl;
import com.bluedot.service.CarManager;

public class CarManagerImpl implements CarManager {

	@Override
	public void addCar(Car car) {
		CarManagerDao cmd = new CarManagerDaoImpl();
		cmd.addCar(car);
	}

	@Override
	public Page findCarsByProperty(Car car, int pageIndex) {
		CarManagerDao cmd = new CarManagerDaoImpl();
		return cmd.findCars(car, pageIndex);
	}

	@Override
	public Car findCarByCarNumber(String carNumber) {
		CarManagerDao cmd = new CarManagerDaoImpl();
		return cmd.findCar(carNumber);
	}

	@Override
	public void updateCar(Car car) {
		CarManagerDao cmd = new CarManagerDaoImpl();
		cmd.updateCar(car);
	}

	@Override
	public void deleteCar(String[] arr) {
		CarManagerDao cmd = new CarManagerDaoImpl();
		if(arr != null && arr.length > 0){
			for(int i=0;i<arr.length;i++){
				cmd.deleteCar(arr[i]);
			}
		}else{
			throw new NotFoundValueException("请选择要删除的数据");
		}
		
	}
}
