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
import com.bluedot.domain.Customers;
import com.bluedot.domain.Page;
import com.bluedot.domain.Role;
import com.bluedot.domain.User;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.persist.CustomerManagerDao;

public class CustomerManagerDaoImpl implements CustomerManagerDao {

	@Override
	public void addCustomer(Customers cust) {
		Connection conn = null;
		try{
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement("insert into customers values(?,?,?,?,?,?,?)");
			ps.setString(1, cust.getIdentity());
			ps.setString(2, cust.getCustName());
			ps.setString(3, cust.getSex());
			ps.setString(4, cust.getAddress());
			ps.setString(5, cust.getPhone());
			ps.setString(6, cust.getCareer());
			ps.setString(7, cust.getCustPwd());
			ps.execute();
			conn.commit();
		}catch(SQLException e){
			e.printStackTrace();
			throw  new DataAccessException("用户已存在，请重新输入。");
		}catch(Exception e){
			e.printStackTrace();
			throw new ApplicationException();
		}finally{
			JdbcUtil.closeConn(conn);
		}

	}

	@Override
	public Page findCustomer(Customers cust, int pageIndex) {
		Connection conn = null;
		Page page  = new Page();
		List<Customers> list = new ArrayList<Customers>();
		try{
			conn = JdbcUtil.getConnection();
			CallableStatement cs = conn.prepareCall("Call page(?,?,?,?,?)");
			cs.setInt(1, pageIndex);
			cs.setString(2, this.generateSQL(cust));
			cs.setInt(3, Constants.PAGE_NUMBER);
			cs.registerOutParameter(4, Types.INTEGER);
			cs.registerOutParameter(5, OracleTypes.CURSOR);
			cs.execute();
			ResultSet rs = (ResultSet)cs.getObject(5);
			while(rs.next()){
				Customers c = new Customers();
				c.setIdentity(rs.getString("identity"));
				c.setCustName(rs.getString("custname"));
				c.setSex(rs.getString("sex"));
				c.setAddress(rs.getString("address"));
				c.setPhone(rs.getString("phone"));
				c.setCareer(rs.getString("career"));
				c.setCustPwd(rs.getString("custpwd"));
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
	private String generateSQL(Customers cust){
		StringBuffer sb = new StringBuffer("select rownum rn, c.identity,c.custname,c.sex,c.address,c.phone,c.career,c.custpwd from customers c where 1=1 ");
		if(cust.getIdentity()!= null && cust.getIdentity().length() > 0){
			sb.append(" and c.identity = '").append(cust.getIdentity()).append("'");
		}
		if(cust.getCustName() != null && cust.getCustName().length() > 0){
			sb.append(" and c.custname like '%").append(cust.getCustName()).append("%'");
		}
		if(cust.getSex() != null && cust.getSex().length() > 0){
			sb.append(" and c.sex ='").append(cust.getSex()).append("'");
		}
		if(cust.getAddress() != null && cust.getAddress().length() > 0){
			sb.append(" and c.address  like '%").append(cust.getAddress()).append("%'");
		}
		if(cust.getPhone() != null && cust.getPhone().length() > 0){
			sb.append(" and c.phone like '%").append(cust.getPhone()).append("%'");
		}
		if(cust.getCareer() != null && cust.getCareer().length() > 0){
			sb.append(" and c.career like '%").append(cust.getCareer()).append("%'");
		}
		if(cust.getCustPwd() != null && cust.getCustPwd().length() > 0){
			sb.append(" and c.custpwd ='").append(cust.getCustPwd()).append("'");
		}
		return sb.toString();
	}

	@Override
	public Customers preUpdateCustomers(String identity) {
		Connection conn = null;
		Customers cust = null;
		try{
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn.prepareStatement("select c.identity,c.custname,c.sex,c.address,c.phone,c.career,c.custpwd from customers c where c.identity = ?");
			ps.setString(1, identity);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				cust = new Customers();
				cust.setIdentity(rs.getString("identity"));
				cust.setCustName(rs.getString("custname"));
				cust.setSex(rs.getString("sex"));
				cust.setAddress(rs.getString("address"));
				cust.setPhone(rs.getString("phone"));
				cust.setCareer(rs.getString("career"));
				cust.setCustPwd(rs.getString("custpwd"));
			}
		}catch(SQLException e){
			e.printStackTrace();
			throw new  DataAccessException("操作失败，请重试");
		}catch(Exception e){
			e.printStackTrace();
			throw new ApplicationException();
		}finally{
			JdbcUtil.closeConn(conn);
		}
		return cust;
	}
//更新客户信息
	@Override
	public void updateCustomers(Customers cust) {
		Connection conn = null;
		try{
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement("update customers c set c.custname = ?,c.sex = ? ,c.address = ?,c.phone = ?,c.career = ? where c.identity = ?");
			ps.setString(1, cust.getCustName());
			ps.setString(2, cust.getSex());
			ps.setString(3, cust.getAddress());
			ps.setString(4, cust.getPhone());
			ps.setString(5, cust.getCareer());
			ps.setString(6, cust.getIdentity());
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
	public void deleteCustomers(String identity) {
		Connection conn = null;
		try{
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement("delete customers c where c.identity =  ? ");
			ps.setString(1, identity);
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
	public void changeCustomersPwd(String identity, String newCustPwd) {
		Connection conn = null;
		try{
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement("update customers c set c.custpwd = ? where c.identity = ? ");
			ps.setString(1, newCustPwd);
			ps.setString(2, identity);
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
