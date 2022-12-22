package com.bluedot.common;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class JdbcUtil {
	private static Properties props = new Properties();
	static{
		try {
			InputStream in = JdbcUtil.class.getClassLoader().getResourceAsStream("database.properties");
			props.load(in);
			in.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection(){
		Connection conn = null;
		try {
				String drivers = props.getProperty("jdbc.drivers");
				if (drivers != null) {
					Class.forName(drivers);
				}
				String url = props.getProperty("jdbc.url");
				String username = props.getProperty("jdbc.username");
				String password = props.getProperty("jdbc.password");         
				conn = DriverManager.getConnection(url, username, password);	
			} catch(Exception e) {
				e.printStackTrace();
			}
		return conn;
	}
	public static void closeConn(Connection conn){
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 	}
	public static void rollback(Connection conn){
		
			try {
				conn.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
}
