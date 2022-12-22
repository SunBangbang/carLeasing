package com.bluedot.exception;

public class ApplicationException extends RuntimeException {
	public ApplicationException(){
		super();
	}
	public ApplicationException(String msg){
		super(msg);
	}
	public ApplicationException(String msg,Throwable t){
		super(msg,t);
	}
}
