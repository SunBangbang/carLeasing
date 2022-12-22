package com.bluedot.persist.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.driver.OracleTypes;

import com.bluedot.common.Constants;
import com.bluedot.common.JdbcUtil;
import com.bluedot.domain.Car;
import com.bluedot.domain.Customers;
import com.bluedot.domain.Page;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.persist.CarManagerDao;

public class CarManagerDaoImpl implements CarManagerDao {

	@Override
	public void addCar(Car car) {
		Connection conn = null;
		try{
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement("insert into cars values(?,?,?,?,?,?,?,?)");
			ps.setString(1, car.getCarNumber());
			ps.setString(2, car.getCarType());
			ps.setString(3, car.getColor());
			ps.setDouble(4, car.getPrice());
			ps.setDouble(5, car.getRentPrice());
			ps.setDouble(6, car.getDeposit());
			ps.setString(7, car.getIsRenting());
			ps.setString(8, car.getCardesc());
			ps.execute();
			conn.commit();
		}catch(SQLException e){
			e.printStackTrace();
			throw  new DataAccessException(Constants.ACCESS_DB_EXCEPTION);
		}catch(Exception e){
			e.printStackTrace();
			throw new ApplicationException();
		}finally{
			JdbcUtil.closeConn(conn);
		}
	}

	@Override
	public Page findCars(Car car, int pageIndex) {
		Connection conn = null;
		Page page  = new Page();
		List<Car> list = new ArrayList<Car>();
		try{
			conn = JdbcUtil.getConnection();
			CallableStatement cs = conn.prepareCall("Call page(?,?,?,?,?)");
			cs.setInt(1, pageIndex);
			cs.setString(2, this.generateSQL(car));
			cs.setInt(3, Constants.PAGE_NUMBER);
			cs.registerOutParameter(4, Types.INTEGER);
			cs.registerOutParameter(5, OracleTypes.CURSOR);
			cs.execute();
			ResultSet rs = (ResultSet)cs.getObject(5);
			while(rs.next()){
				Car c = new Car();
				c.setCarNumber(rs.getString("carnumber"));
				c.setColor(rs.getString("color"));
				c.setPrice(rs.getDouble("price"));
				c.setRentPrice(rs.getDouble("rentprice"));
				c.setDeposit(rs.getDouble("deposit"));
				c.setIsRenting(rs.getString("isrenting"));
				c.setCarType(rs.getString("cartype"));
				list.add(c);
			}
			page.setCurrIndex(pageIndex);
			page.setTotalPage(cs.getInt(4));
			page.setResult(list);
		}catch(SQLException e){
			e.printStackTrace();
			throw  new DataAccessException(Constants.ACCESS_DB_EXCEPTION);
		}catch(Exception e){
			e.printStackTrace();
			throw new ApplicationException();
		}finally{
			JdbcUtil.closeConn(conn);
		}
		return page;
	}
	private String generateSQL(Car car){
		StringBuffer sb = new StringBuffer("select rownum rn ,c.carnumber,c.cartype,c.color,c.price,c.rentprice,c.deposit,c.isrenting,c.cardesc from cars c where 1=1 ");
		if(car.getCarNumber() != null && car.getCarNumber().length() > 0){
			sb.append(" and c.carnumber like '%").append(car.getCarNumber()).append("%'");
		}
		if(car.getCarType() != null && car.getCarType().length() > 0){
			sb.append(" and c.cartype like '%").append(car.getCarType()).append("%'");
		}
		if(car.getColor() != null && car.getColor().length() > 0){
			sb.append(" and c.color like '%").append(car.getColor()).append("%'");
		}
		if(car.getPrice() > 0){
			sb.append(" and c.price = ").append(car.getPrice());
		}
		if(car.getRentPrice() > 0){
			sb.append(" and c.rentprice = ").append(car.getRentPrice());
		}
		if(car.getDeposit() > 0){
			sb.append(" and c.deposit = ").append(car.getDeposit());
		}
		if(car.getIsRenting() != null && car.getIsRenting().length() > 0){
			sb.append(" and c.isrenting = '").append(car.getIsRenting()).append("'");
		}
		return sb.toString();
	}

	@Override
	public Car findCar(String carNumber) {
		Connection conn = null;
		Car car = null;
		try{
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn.prepareStatement("select c.carnumber,c.cartype,c.color,c.price,c.rentprice,c.deposit,c.isrenting,c.cardesc from cars c where c.carnumber = ?");
			ps.setString(1, carNumber);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				car = new Car();
				car.setCarNumber(rs.getString("carnumber"));
				car.setCarType(rs.getString("cartype"));
				car.setColor(rs.getString("color"));
				car.setPrice(rs.getDouble("price"));
				car.setRentPrice(rs.getDouble("rentprice"));
				car.setDeposit(rs.getDouble("deposit"));
				car.setIsRenting(rs.getString("isrenting"));
				car.setCardesc(rs.getString("cardesc"));
			}
		}catch(SQLException e){
			e.printStackTrace();
			throw  new DataAccessException(Constants.ACCESS_DB_EXCEPTION);
		}catch(Exception e){
			e.printStackTrace();
			throw new ApplicationException();
		}finally{
			JdbcUtil.closeConn(conn);
		}
		return car;
	}
//更新汽车信息
	@Override
	public void updateCar(Car car) {
		Connection conn = null;
		try{
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement("update cars c set c.cartype = ?,c.color = ?,c.price = ?,c.rentprice = ?,c.deposit = ?,c.isrenting = ?,c.cardesc = ? where c.carnumber = ?");
			ps.setString(1, car.getCarType());
			ps.setString(2, car.getColor());
			ps.setDouble(3, car.getPrice());
			ps.setDouble(4, car.getRentPrice());
			ps.setDouble(5, car.getDeposit());
			ps.setString(6, car.getIsRenting());
			ps.setString(7, car.getCardesc());
			ps.setString(8, car.getCarNumber());
			ps.execute();
			conn.commit();
		}catch(SQLException e){
			e.printStackTrace();
			throw  new DataAccessException(Constants.ACCESS_DB_EXCEPTION);
		}catch(Exception e){
			e.printStackTrace();
			throw new ApplicationException();
		}finally{
			JdbcUtil.closeConn(conn);
		}
	}

	@Override
	public void deleteCar(String carNumber) {
		Connection conn = null;
		try{
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement("delete cars c where c.carnumber =  ? ");
			ps.setString(1, carNumber);
			ps.execute();
			conn.commit();
		}catch(SQLException e){
			e.printStackTrace();
			throw  new DataAccessException(Constants.ACCESS_DB_EXCEPTION);
		}catch(Exception e){
			e.printStackTrace();
			throw new ApplicationException();
		}finally{
			JdbcUtil.closeConn(conn);
		}
	}
}
