package com.bluedot.exception;

public class NotFoundUserException extends RuntimeException {
	public NotFoundUserException() {
		super();
	}

	public NotFoundUserException(String msg) {
		super(msg);
	}

	public NotFoundUserException(String msg, Throwable t) {
		super(msg, t);
	}
}
