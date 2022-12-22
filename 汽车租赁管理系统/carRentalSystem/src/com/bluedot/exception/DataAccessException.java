package com.bluedot.exception;

public class DataAccessException extends RuntimeException {
	public DataAccessException(){
		super();
	}
	public DataAccessException(String msg){
		super(msg);
	}
	public DataAccessException(String msg,Throwable t){
		super(msg,t);
	}
}
