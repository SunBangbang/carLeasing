package com.bluedot.persist.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.driver.OracleTypes;

import com.bluedot.common.Constants;
import com.bluedot.common.JdbcUtil;
import com.bluedot.common.Tools;
import com.bluedot.domain.Car;
import com.bluedot.domain.CheckTable;
import com.bluedot.domain.Customers;
import com.bluedot.domain.Page;
import com.bluedot.domain.Renttable;
import com.bluedot.domain.User;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.persist.OperatorManagerDao;

public class OperatorManagerDaoImpl implements OperatorManagerDao {

	@Override
	public Customers finCustomersByIdentity(String identity) {
		Connection conn = null;
		Customers cust = null;
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn
					.prepareStatement("select c.identity  from customers c where c.identity = ?");
			ps.setString(1, identity);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cust = new Customers();
				cust.setIdentity(rs.getString("identity"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DataAccessException(Constants.ACCESS_DB_EXCEPTION);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ApplicationException();
		} finally {
			JdbcUtil.closeConn(conn);
		}
		return cust;
	}

	@Override
	public List<Car> findAllCarByIsRenting() {
		Connection conn = null;
		List<Car> list = new ArrayList<Car>();
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn
					.prepareStatement("select c.carnumber,c.price from cars c where c.isrenting = '0'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Car car = new Car();
				car.setCarNumber(rs.getString("carnumber"));
				car.setPrice(rs.getDouble("price"));
				list.add(car);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DataAccessException(Constants.ACCESS_DB_EXCEPTION);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ApplicationException();
		} finally {
			JdbcUtil.closeConn(conn);
		}
		return list;
	}

	// 创建出租单
	@Override
	public void createRenttable(Renttable rent) {
		Connection conn = null;
		try {
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn
					.prepareStatement("insert into renttable(tableid,imprest, shouldpayprice,price,begindate,shouldreturndate,rentflag,custid,carid,userid) values(?,?,?,?,?,?,?,?,?,?)");
			ps.setLong(1, rent.getTableId());
			ps.setDouble(2, rent.getImprest());
			ps.setDouble(3, rent.getShouldPayPrice());
			ps.setDouble(4, rent.getPrice());
			ps.setDate(5, new Date(rent.getBeginDate().getTime()));
			ps.setDate(6, new Date(rent.getShouldReturnDate().getTime()));
			ps.setInt(7, rent.getRentFlag());
			ps.setString(8, rent.getCust().getIdentity());
			ps.setString(9, rent.getCar().getCarNumber());
			ps.setString(10, rent.getUser().getUserName());
			ps.execute();
			PreparedStatement ps2 = conn.prepareStatement("update cars c set c.isrenting = 1 where c.carnumber = ?");
			ps2.setString(1, rent.getCar().getCarNumber());
			ps2.execute();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DataAccessException(Constants.ACCESS_DB_EXCEPTION);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ApplicationException();
		} finally {
			JdbcUtil.closeConn(conn);
		}
	}

	@Override
	public Renttable findRenttableByTableId(long tableId) {
		Connection conn = null;
		Renttable rent = null;
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn
					.prepareStatement("select u.username,r.tableid,r.imprest,r.shouldpayprice,r.price,r.begindate,r.shouldreturndate,r.returndate,r.rentflag ,c.carnumber,c.cartype,c.color,c.price as carprice,c.rentprice,c.deposit,c.isrenting,c.cardesc,cust.identity,cust.custname,cust.sex,cust.address,cust.phone,cust.career,cust.custpwd from users u,renttable r,cars c,customers cust where u.username = r.userid and r.carid = c.carnumber and r.custid = cust.identity and r.tableid = ? ");
			ps.setLong(1, tableId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				rent = new Renttable();
				User user = new User();
				user.setUserName(rs.getString("username"));
				rent.setUser(user);

				rent.setTableId(rs.getLong("tableid"));
				rent.setImprest(rs.getDouble("imprest"));
				rent.setShouldPayPrice(rs.getDouble("shouldpayprice"));
				rent.setPrice(rs.getDouble("price"));
				rent.setBeginDate(new java.util.Date(rs.getDate("begindate")
						.getTime()));
				rent.setShouldReturnDate(new java.util.Date(rs.getDate(
						"shouldreturndate").getTime()));
				rent.setRentFlag(rs.getInt("rentflag"));
				if(rs.getDate("returndate") != null)
				rent.setReturnDate(new java.util.Date(rs.getDate("returndate").getTime()));
				
				Customers cust = new Customers();
				cust.setIdentity(rs.getString("identity"));
				cust.setCustName(rs.getString("custname"));
				cust.setSex(rs.getString("sex"));
				cust.setAddress(rs.getString("address"));
				cust.setPhone(rs.getString("phone"));
				cust.setCareer(rs.getString("career"));
				rent.setCust(cust);

				Car car = new Car();
				car.setCarNumber(rs.getString("carnumber"));
				car.setCarType(rs.getString("cartype"));
				car.setColor(rs.getString("color"));
				car.setPrice(rs.getDouble("carprice"));
				car.setRentPrice(rs.getDouble("rentprice"));
				car.setDeposit(rs.getDouble("deposit"));
				car.setIsRenting(rs.getString("isrenting"));
				car.setCardesc(rs.getString("cardesc"));
				rent.setCar(car);

			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DataAccessException(Constants.ACCESS_DB_EXCEPTION);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ApplicationException();
		} finally {
			JdbcUtil.closeConn(conn);
		}
		return rent;
	}

	@Override
	public void createCheckTable(CheckTable ct) {
		Connection conn = null;
		try {
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn
					.prepareStatement("insert into checktable values(?,?,?,?,?,?,?)");
			ps.setLong(1, ct.getCheckId());
			ps.setDate(2, new Date(ct.getCheckDate().getTime()));
			ps.setString(3, ct.getField());
			ps.setString(4, ct.getProblem());
			ps.setDouble(5, ct.getPaying());
			ps.setString(6, ct.getUser().getUserName());
			ps.setLong(7, ct.getRentTable().getTableId());
			ps.execute();
			//将车状态改为未出租
			PreparedStatement ps2 = conn.prepareStatement("update cars c set c.isrenting = 0 where c.carnumber = ?");
			ps2.setString(1, ct.getRentTable().getCar().getCarNumber());
			ps2.execute();
			//将出租单状态改为已入库/已生成检查单
			PreparedStatement ps3 = conn.prepareStatement("update renttable r set r.rentflag = 1 ,r.returndate = ? where r.tableid = ?");
			ps3.setDate(1, new Date(ct.getCheckDate().getTime()));
			ps3.setLong(2, ct.getRentTable().getTableId());
			ps3.execute();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DataAccessException(Constants.ACCESS_DB_EXCEPTION);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ApplicationException();
		} finally {
			JdbcUtil.closeConn(conn);
		}
	}

	@Override
	public Page findRenttableByProperty(Renttable rent, int pageIndex) {
		Connection conn = null;
		Page page  = new Page();
		List<Renttable> list = new ArrayList<Renttable>();
		try{
			conn = JdbcUtil.getConnection();
			CallableStatement cs = conn.prepareCall("Call page(?,?,?,?,?)");
			cs.setInt(1, pageIndex);
			cs.setString(2, this.generateSQL(rent));
			cs.setInt(3, Constants.PAGE_NUMBER);
			cs.registerOutParameter(4, Types.INTEGER);
			cs.registerOutParameter(5, OracleTypes.CURSOR);
			cs.execute();
			ResultSet rs = (ResultSet)cs.getObject(5);
			while(rs.next()){
				Renttable r = new Renttable();
				r.setTableId(rs.getLong("tableid"));
				r.setImprest(rs.getDouble("imprest"));
				r.setShouldPayPrice(rs.getDouble("shouldpayprice"));
				r.setPrice(rs.getDouble("price"));
				r.setBeginDate(new java.util.Date(rs.getDate("begindate").getTime()));
				r.setShouldReturnDate(new java.util.Date(rs.getDate("shouldreturndate").getTime()));
				if(rs.getDate("returndate") != null)
					r.setReturnDate(new java.util.Date(rs.getDate("returndate").getTime()));
				r.setRentFlag(rs.getInt("rentflag"));
				
				Customers cust = new Customers();
				cust.setCustName(rs.getString("custname"));
				r.setCust(cust);
				
				Car car = new Car();
				car.setCarNumber(rs.getString("carnumber"));
				r.setCar(car);
				
				User user = new User();
				user.setUserName(rs.getString("username"));
				r.setUser(user);
				
				list.add(r);
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
	private String generateSQL(Renttable rent){
		StringBuffer sb = new StringBuffer("select rownum rn, u.username,r.tableid,r.imprest,r.shouldpayprice,r.price,r.begindate,r.shouldreturndate,r.returndate,r.rentflag ,c.carnumber,cust.custname from users u,renttable r,cars c,customers cust where u.username = r.userid and r.carid = c.carnumber and r.custid = cust.identity and 1=1 ");
		if(rent.getTableId() > 0){
			sb.append(" and r.tableid = ").append(rent.getTableId());
		}
		if(rent.getBeginDate() != null){
			sb.append(" and to_char(r.begindate,'yyyy-MM-dd') = '").append(Tools.formatDate(rent.getBeginDate(), "yyyy-MM-dd")).append("'");
		}
		if(rent.getShouldReturnDate() != null){
			sb.append(" and to_char(r.shouldreturndate,'yyyy-MM-dd') = '").append(Tools.formatDate(rent.getShouldReturnDate(), "yyyy-MM-dd")).append("'");
		}
		if(rent.getReturnDate() != null){
			sb.append(" and to_char(r.returndate,'yyyy-MM-dd') = '").append(Tools.formatDate(rent.getReturnDate(), "yyyy-MM-dd")).append("'");
		}
		if(rent.getRentFlag() > -1){
			sb.append(" and r.rentflag = ").append(rent.getRentFlag());
		}
		if(rent.getCar() != null && rent.getCar().getCarNumber() != null && rent.getCar().getCarNumber().length() > 0){
			sb.append(" and c.carnumber = '").append(rent.getCar().getCarNumber()).append("'");
		}
		if(rent.getCust() != null && rent.getCust().getIdentity() != null && rent.getCust().getIdentity().length() > 0){
			sb.append(" and cust.identity = '").append(rent.getCust().getIdentity()).append("'");
		}
		if(rent.getUser() != null && rent.getUser().getUserName() != null && rent.getUser().getUserName().length() > 0){
			sb.append(" and u.username = '").append(rent.getUser().getUserName()).append("'");
		}
		return sb.toString();
	}

	@Override
	public void updateRenttable(Renttable rent) {
		Connection conn = null;
		try {
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn
					.prepareStatement("update renttable r set r.imprest = ?,r.shouldpayprice = ?,r.price = ?,r.begindate = ?,r.shouldreturndate = ?,r.returndate = ?,r.rentflag = ?,r.userid = ? where r.tableid = ?");
			ps.setDouble(1, rent.getImprest());
			ps.setDouble(2, rent.getShouldPayPrice());
			ps.setDouble(3, rent.getPrice());
			ps.setDate(4, new Date(rent.getBeginDate().getTime()));
			ps.setDate(5, new Date(rent.getShouldReturnDate().getTime()));
			if(rent.getReturnDate() != null){
				ps.setDate(6, new Date(rent.getReturnDate().getTime()));
			}else{
				ps.setDate(6, null);
			}
			ps.setInt(7, rent.getRentFlag());
			ps.setString(8, rent.getUser().getUserName());
			ps.setLong(9, rent.getTableId());
			ps.execute();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DataAccessException(Constants.ACCESS_DB_EXCEPTION);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ApplicationException();
		} finally {
			JdbcUtil.closeConn(conn);
		}
		
	}

	@Override
	public List<User> findUserAll() {
		Connection conn = null;
		List<User> list =new ArrayList<User>();
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn.prepareStatement("select u.username from users u ");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				User user  =new User();
				user.setUserName(rs.getString("username"));
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DataAccessException(Constants.ACCESS_DB_EXCEPTION);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ApplicationException();
		} finally {
			JdbcUtil.closeConn(conn);
		}
		return list;
	}

	@Override
	public void deleteRenttables(long tableId) {
		Connection conn = null;
		try{
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement("delete checktable c where c.rentid = ? ");
			ps.setLong(1, tableId);
			ps.execute();
			PreparedStatement ps2 = conn.prepareStatement("delete renttable r where r.tableid = ? ");
			ps2.setLong(1, tableId);
			ps2.execute();
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
	public Page findCheckTableByProperty(CheckTable ct, int pageIndex) {
		Connection conn = null;
		Page page  = new Page();
		List<CheckTable> list = new ArrayList<CheckTable>();
		try{
			conn = JdbcUtil.getConnection();
			CallableStatement cs = conn.prepareCall("Call page(?,?,?,?,?)");
			cs.setInt(1, pageIndex);
			cs.setString(2, this.generateCheckTableSQL(ct));
			cs.setInt(3, Constants.PAGE_NUMBER);
			cs.registerOutParameter(4, Types.INTEGER);
			cs.registerOutParameter(5, OracleTypes.CURSOR);
			cs.execute();
			ResultSet rs = (ResultSet)cs.getObject(5);
			while(rs.next()){
				CheckTable c =new CheckTable();
				c.setCheckId(rs.getLong("checkid"));
				c.setCheckDate(new java.util.Date(rs.getDate("checkdate").getTime()));
				User user = new User();
				user.setUserName(rs.getString("username"));
				c.setUser(user);
				c.setProblem(rs.getString("problem"));
				c.setPaying(rs.getDouble("paying"));
				Renttable r = new Renttable();
				r.setTableId(rs.getLong("tableid"));
				c.setRentTable(r);
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
	private String generateCheckTableSQL(CheckTable ct){
		StringBuffer sb =new StringBuffer("select rownum rn, ck.checkid ,ck.checkdate,ck.problem,ck.paying,r.tableid,u.username from checktable ck ,users u,renttable r where ck.checkuserid = u.username and ck.rentid = r.tableid ");
		if(ct.getCheckId() > 0){
			sb.append(" and ck.checkid = ").append(ct.getCheckId());
		}
		if(ct.getCheckDate() != null){
			sb.append(" and to_char(ck.checkdate,'yyyy-MM-dd') = '").append(Tools.formatDate(ct.getCheckDate(), "yyyy-MM-dd")).append("'");
		}
		if(ct.getUser() != null && ct.getUser().getUserName() != null && ct.getUser().getUserName().length() > 0){
			sb.append(" and u.username = '").append(ct.getUser().getUserName()).append("'");
		}
		if(ct.getRentTable() != null && ct.getRentTable().getTableId() > 0){
			sb.append(" and r.tableid = ").append(ct.getRentTable().getTableId());
		}
		return sb.toString();
		
	}
	@Override
	public CheckTable preUpdateCheckTable(long checkId) {
		Connection conn = null;
		Renttable rent = null;
		CheckTable check = null;
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn
					.prepareStatement("select u.username,r.tableid,r.imprest,r.shouldpayprice,r.price,r.begindate,r.shouldreturndate,r.returndate,r.rentflag ,c.carnumber,c.cartype,c.color,c.price as carprice,c.rentprice,c.deposit,c.isrenting,c.cardesc,cust.identity,cust.custname,cust.sex,cust.address,cust.phone,cust.career,cust.custpwd from users u,renttable r,cars c,customers cust,checktable ck where r.userid = u.username and r.carid = c.carnumber and r.custid = cust.identity and ck.rentid = r.tableid and ck.checkid = ?");
			ps.setLong(1, checkId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				rent = new Renttable();
				User user = new User();
				user.setUserName(rs.getString("username"));
				rent.setUser(user);

				rent.setTableId(rs.getLong("tableid"));
				rent.setImprest(rs.getDouble("imprest"));
				rent.setShouldPayPrice(rs.getDouble("shouldpayprice"));
				rent.setPrice(rs.getDouble("price"));
				rent.setBeginDate(new java.util.Date(rs.getDate("begindate")
						.getTime()));
				rent.setShouldReturnDate(new java.util.Date(rs.getDate(
						"shouldreturndate").getTime()));
				rent.setRentFlag(rs.getInt("rentflag"));
				if(rs.getDate("returndate") != null)
				rent.setReturnDate(new java.util.Date(rs.getDate("returndate").getTime()));
				
				Customers cust = new Customers();
				cust.setIdentity(rs.getString("identity"));
				cust.setCustName(rs.getString("custname"));
				cust.setSex(rs.getString("sex"));
				cust.setAddress(rs.getString("address"));
				cust.setPhone(rs.getString("phone"));
				cust.setCareer(rs.getString("career"));
				rent.setCust(cust);

				Car car = new Car();
				car.setCarNumber(rs.getString("carnumber"));
				car.setCarType(rs.getString("cartype"));
				car.setColor(rs.getString("color"));
				car.setPrice(rs.getDouble("carprice"));
				car.setRentPrice(rs.getDouble("rentprice"));
				car.setDeposit(rs.getDouble("deposit"));
				car.setIsRenting(rs.getString("isrenting"));
				car.setCardesc(rs.getString("cardesc"));
				rent.setCar(car);
			}
			if(rent != null){
				PreparedStatement ps2 = conn.prepareStatement("select ck.checkid,ck.checkdate,ck.field,ck.problem,ck.paying, ck.checkuserid from checktable ck,users u where ck.checkuserid = u.username and ck.checkid = ? ");
				ps2.setLong(1, checkId);
				ResultSet rs2 = ps2.executeQuery();
				while(rs2.next()){
					check = new CheckTable();
					check.setCheckId(rs2.getLong("checkid"));
					check.setCheckDate(rs2.getDate("checkdate"));
					check.setField(rs2.getString("field"));
					check.setProblem(rs2.getString("problem"));
					check.setPaying(rs2.getDouble("paying"));
					User user = new User();
					user.setUserName(rs2.getString("checkuserid"));
					check.setUser(user);
				}
				check.setRentTable(rent);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DataAccessException(Constants.ACCESS_DB_EXCEPTION);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ApplicationException();
		} finally {
			JdbcUtil.closeConn(conn);
		}
		return check;
	}

	@Override
	public void updateCheckTable(CheckTable ct) {
		Connection conn = null;
		try {
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn
					.prepareStatement("update checktable ck set ck.field = ?,ck.problem = ?,ck.paying = ? where ck.checkid = ?");
			ps.setString(1, ct.getField());
			ps.setString(2, ct.getProblem());
			ps.setDouble(3, ct.getPaying());
			ps.setLong(4, ct.getCheckId());
			ps.execute();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DataAccessException(Constants.ACCESS_DB_EXCEPTION);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ApplicationException();
		} finally {
			JdbcUtil.closeConn(conn);
		}
		
	}
//删除检查单
	@Override
	public void deleteCheckTable(long checkId) {
		Connection conn = null;
		try{
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement("delete checktable ct where ct.checkid = ? ");
			ps.setLong(1, checkId);
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
