package com.bluedot.common;

import java.util.Comparator;

import com.bluedot.domain.Car;

public class OrderByCarPrice implements Comparator<Car> {
	@Override
	public int compare(Car o1, Car o2) {
		// TODO Auto-generated method stub
		return (int)(o2.getPrice() - o1.getPrice() );
	}

}
