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
import com.bluedot.domain.Funs;
import com.bluedot.domain.Menu;
import com.bluedot.domain.Page;
import com.bluedot.domain.Role;
import com.bluedot.domain.User;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.persist.UserManagerDao;

public class UserManagerDaoImpl implements UserManagerDao {

	@Override
	public List<Role> PreAddUserFindAllRoles() {
		Connection conn = null;
		List<Role> list = new ArrayList<Role>();
		try{
			conn = JdbcUtil.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from roles");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Role r = new Role();
				r.setRoleId(rs.getLong("roleid"));
				r.setRoleName(rs.getString("rolename"));
				list.add(r);
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
		return list;
	}

	//添加用户
	public void addUser(User user) {
		Connection conn = null;
		try{
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?)");
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getIdentity());
			ps.setString(3, user.getFullName());
			ps.setString(4, user.getSex());
			ps.setString(5, user.getAddress());
			ps.setString(6, user.getPhone());
			ps.setString(7, user.getPosition());
			ps.setLong(8, user.getRole().getRoleId());
			ps.setString(9, user.getUserPwd());
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
//根据属性查询用户
	@Override
	public Page findUserByProperty(User user,int pageIndex) {
		Connection conn = null;
		Page page  = new Page();
		List<User> list = new ArrayList<User>();
		try{
			conn = JdbcUtil.getConnection();
			CallableStatement cs = conn.prepareCall("Call page(?,?,?,?,?)");
			cs.setInt(1, pageIndex);
			cs.setString(2, this.generateSQL(user));
			cs.setInt(3, Constants.PAGE_NUMBER);
			cs.registerOutParameter(4, Types.INTEGER);
			cs.registerOutParameter(5, OracleTypes.CURSOR);
			cs.execute();
			ResultSet rs = (ResultSet)cs.getObject(5);
			while(rs.next()){
				User u = new User();
				u.setUserName(rs.getString("username"));
				u.setIdentity(rs.getString("identity"));
				u.setFullName(rs.getString("fullname"));
				u.setSex(rs.getString("sex"));
				u.setAddress(rs.getString("address"));
				u.setPhone(rs.getString("phone"));
				u.setPosition(rs.getString("position"));
				long roleId = rs.getLong("userlevel");
				Role r = new Role();
				if(roleId > 0){
					PreparedStatement ps2 = conn.prepareStatement("select * from roles where roleid = ?");
					ps2.setLong(1, roleId);
					ResultSet rs2 = ps2.executeQuery();
					while(rs2.next()){
						r.setRoleId(rs2.getLong("roleid"));
						r.setRoleName(rs2.getString("rolename"));
					}
				}
				u.setRole(r);
				u.setUserPwd(rs.getString("userpwd"));
				list.add(u);
				
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
	//创建查询用户SQL语句
	private String generateSQL(User user){
		StringBuffer sb = new StringBuffer("select rownum rn,u.username,u.identity,u.fullname,u.sex,u.address,u.phone,u.position,u.userlevel,u.userpwd from users u where 1=1 ");
		if(user.getUserName() != null && user.getUserName().length() > 0){
			sb.append(" and u.username like '%").append(user.getUserName()).append("%'");
		}
		if(user.getIdentity() != null && user.getIdentity().length() > 0){
			sb.append(" and u.identity = '").append(user.getIdentity()).append("'");
		}
		if(user.getFullName() != null && user.getFullName().length() > 0){
			sb.append(" and u.fullname = '").append(user.getFullName()).append("'");
		}
		if(user.getSex() != null && user.getSex().length() > 0){
			sb.append(" and u.sex = '").append(user.getSex()).append("'");
		}
		if(user.getAddress() != null && user.getAddress().length() > 0){
			sb.append(" and u.address = '").append(user.getAddress()).append("'");
		}
		if(user.getPhone() != null && user.getPhone().length() > 0){
			sb.append(" and u.phone = '").append(user.getPhone()).append("'");
		}
		if(user.getPosition() != null && user.getPosition().length() > 0){
			sb.append(" and u.position = '").append(user.getPosition()).append("'");
		}
		if(user.getRole() != null && user.getRole().getRoleId() > 0){
			sb.append(" and u.userlevel = ").append(user.getRole().getRoleId());
		}
		if(user.getUserPwd() != null && user.getUserPwd().length() > 0){
			sb.append(" and u.userpwd = '").append(user.getUserPwd()).append("'");
		}
		return sb.toString();
	}
//预更新查询
	@Override
	public User preUpdateUser(String userName) {
		Connection conn = null;
		User u = null;
		try{
			conn = JdbcUtil.getConnection();
			PreparedStatement ps= conn.prepareStatement("select * from users where username = ?");
			ps.setString(1, userName);
			ResultSet rs = ps.executeQuery();
			long roleId = 0;
			while(rs.next()){
				u = new User();
				u.setUserName(rs.getString("username"));
				u.setIdentity(rs.getString("identity"));
				u.setFullName(rs.getString("fullname"));
				u.setSex(rs.getString("sex"));
				u.setAddress(rs.getString("address"));
				u.setPhone(rs.getString("phone"));
				u.setPosition(rs.getString("position"));
				u.setUserPwd(rs.getString("userpwd"));
				roleId = rs.getLong("userlevel");
				
			}
			if(roleId > 0){
				Role role = new Role();
				PreparedStatement ps2 = conn.prepareStatement("select r.roleid,r.rolename  from roles r where r.roleid = ?");
				ps2.setLong(1, roleId);
				ResultSet rs2 = ps2.executeQuery();
				while(rs2.next()){
					role.setRoleId(rs2.getLong("roleid"));
					role.setRoleName(rs2.getString("rolename"));
				}
				u.setRole(role);
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
		return u;
	}
//更新用户
	@Override
	public void updateUser(User user) {
		Connection conn = null;
		try{
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement("update users u set u.identity = ?,u.fullname = ?,u.sex = ?,u.address = ?,u.phone = ?,u.position = ?,u.userlevel = ? where u.username = ? ");
			ps.setString(1, user.getIdentity());
			ps.setString(2, user.getFullName());
			ps.setString(3, user.getSex());
			ps.setString(4, user.getAddress());
			ps.setString(5, user.getPhone());
			ps.setString(6, user.getPosition());
			ps.setLong(7, user.getRole().getRoleId());
			ps.setString(8, user.getUserName());
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
//删除用户
	@Override
	public void deleteUser(String userName) {
		Connection conn = null;
		try{
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement("delete users u where u.username =  ? ");
			ps.setString(1, userName);
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
//修改用户密码
	@Override
	public void changeUserPwd(String userName, String newUserPwd) {
		Connection conn = null;
		try{
			conn = JdbcUtil.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement("update users u set u.userpwd = ? where u.username = ? ");
			ps.setString(1, newUserPwd);
			ps.setString(2, userName);
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

