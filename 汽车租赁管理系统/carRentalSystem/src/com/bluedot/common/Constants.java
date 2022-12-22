package com.bluedot.common;

public abstract class Constants {
	public final static String DB_DRIVER = "oracle.jdbc.driver.OracleDriver";
	public final static String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public final static String DB_USER = "zys";
	public final static String DB_PASSWORD = "zys";
	public final static int PAGE_NUMBER = 2;
	
	public final static String USER_LOGIN_SESSION_KEY = "user";
	public final static String MESSAGE_KEY = "msg";
	public final static String ACCESS_DB_EXCEPTION = "操作失败，请重试！";
}
