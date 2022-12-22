package com.bluedot.persist.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bluedot.common.JdbcUtil;
import com.bluedot.domain.Funs;
import com.bluedot.domain.Menu;
import com.bluedot.domain.Role;
import com.bluedot.domain.User;
import com.bluedot.exception.ApplicationException;
import com.bluedot.exception.DataAccessException;
import com.bluedot.persist.SystemOperatorDao;

public class SystemOperatorDaoImpl implements SystemOperatorDao {

	@Override
	public User userLogin(String userName) {
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
				PreparedStatement ps2 = conn.prepareStatement("select r.roleid,r.rolename , m.menuid ,m.menuname,m.connurl,m.fatherid from roles r ,roles_menus rm ,menus m where r.roleid = rm.roleid and rm.menuid = m.menuid and r.roleid = ?");
				ps2.setLong(1, roleId);
				ResultSet rs2 = ps2.executeQuery();
				while(rs2.next()){
					role.setRoleId(rs2.getLong("roleid"));
					role.setRoleName(rs2.getString("rolename"));
					Menu m = new Menu();
					m.setConnUrl(rs2.getString("connurl"));
					m.setFatherId(rs2.getInt("fatherid"));
					m.setMenuId(rs2.getLong("menuid"));
					m.setMenuName(rs2.getString("menuname"));
					u.getMenus().add(m);
				}
				PreparedStatement ps3 = conn.prepareStatement("select f.funid,f.funname,f.funurl from roles r ,roles_menus rm ,menus m,funs f where r.roleid = rm.roleid and rm.menuid = m.menuid and m.menuid = f.menuid and r.roleid = ?");
				ps3.setLong(1, roleId);
				ResultSet rs3 = ps3.executeQuery();
				while(rs3.next()){
					Funs f = new Funs();
					f.setFunId(rs3.getLong("funid"));
					f.setFunName(rs3.getString("funname"));
					f.setFunUrl(rs3.getString("funurl"));
					role.getFuns().add(f);
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

}
