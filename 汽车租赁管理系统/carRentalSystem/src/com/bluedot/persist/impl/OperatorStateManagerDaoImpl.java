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
import com.bluedot.domain.Renttable;
import com.bluedot.domain.User;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.persist.OperatorStateManagerDao;

public class OperatorStateManagerDaoImpl implements OperatorStateManagerDao {

	@Override
	public Page monthReturnCars(int pageIndex) {
		Connection conn = null;
		Page page  = new Page();
		List<Renttable> list = new ArrayList<Renttable>();
		try{
			conn = JdbcUtil.getConnection();
			CallableStatement cs = conn.prepareCall("Call page(?,?,?,?,?)");
			cs.setInt(1, pageIndex);
			cs.setString(2, this.generateSQL());
			cs.setInt(3, Constants.PAGE_NUMBER);
			cs.registerOutParameter(4, Types.INTEGER);
			cs.registerOutParameter(5, OracleTypes.CURSOR);
			cs.execute();
			ResultSet rs = (ResultSet)cs.getObject(5);
			while(rs.next()){
				Renttable rent = new Renttable();
				rent.setTableId(rs.getLong("tableid"));
				rent.setBeginDate(rs.getDate("begindate"));
				rent.setShouldReturnDate(rs.getDate("shouldreturndate"));
				rent.setRentFlag(rs.getInt("rentflag"));
				Customers c = new Customers();
				c.setIdentity(rs.getString("identity"));
				rent.setCust(c);
				Car car = new Car();
				car.setCarNumber(rs.getString("carnumber"));
				rent.setCar(car);
				User user = new User();
				user.setUserName(rs.getString("username"));
				rent.setUser(user);
				list.add(rent);
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

	private String generateSQL() {
		StringBuffer sb = new StringBuffer("select rownum rn, rt.tableid,rt.begindate,rt.shouldreturndate,cust.identity,c.carnumber,rt.rentflag,u.username from renttable rt,cars c,users u,customers cust where rt.carid = c.carnumber and rt.userid = u.username and rt.custid = cust.identity and c.isrenting = 1 and rt.shouldreturndate >=TRUNC(SYSDATE, 'MM') and rt.shouldreturndate <=last_day(SYSDATE)");
		return sb.toString();
	}

	@Override
	public Renttable findReturnCarByInfo(long tableId) {
		Connection conn = null;
		Renttable rent = null;
		try{
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn.prepareStatement("select rt.tableid, rt.imprest, rt.shouldpayprice, rt.price, rt.begindate, rt.shouldreturndate, rt.returndate,  rt.rentflag, cust.identity, cust.custname, cust.sex, cust.address, cust.phone, cust.career,  c.carnumber, c.cartype, c.color, c.price as carprice, c.rentprice, c.deposit, c.isrenting, c.cardesc, u.username from renttable rt,cars c,users u,customers cust where rt.carid = c.carnumber and rt.userid = u.username and rt.custid = cust.identity and c.isrenting = 1 and rt.shouldreturndate >=TRUNC(SYSDATE, 'MM') and rt.shouldreturndate <=last_day(SYSDATE) and rt.tableid = ?");
			ps.setLong(1, tableId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				rent = new Renttable();
				rent.setTableId(rs.getLong("tableid"));
				rent.setImprest(rs.getDouble("imprest"));
				rent.setShouldPayPrice(rs.getDouble("shouldpayprice"));
				rent.setPrice(rs.getDouble("price"));
				rent.setBeginDate(rs.getDate("begindate"));
				rent.setShouldReturnDate(rs.getDate("shouldreturndate"));
				rent.setReturnDate(rs.getDate("returnDate"));
				rent.setRentFlag(rs.getInt("rentflag"));
				Customers c = new Customers();
				c.setIdentity(rs.getString("identity"));
				c.setCustName(rs.getString("custname"));
				c.setSex(rs.getString("sex"));
				c.setAddress(rs.getString("address"));
				c.setPhone(rs.getString("phone"));
				c.setCareer(rs.getString("career"));
				rent.setCust(c);
				Car car = new Car();
				car.setCarNumber(rs.getString("carnumber"));
				car.setCarType(rs.getString("cartype"));
				car.setColor(rs.getString("color"));
				car.setRentPrice(rs.getDouble("rentprice"));
				car.setDeposit(rs.getDouble("deposit"));
				car.setIsRenting(rs.getString("isrenting"));
				car.setCardesc(rs.getString("cardesc"));
				car.setPrice(rs.getDouble("carprice"));
				rent.setCar(car);
				User user = new User();
				user.setUserName(rs.getString("username"));
				rent.setUser(user);
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
		return rent;
	}

}
