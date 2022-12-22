package com.bluedot.exception;

public class NotFoundValueException extends RuntimeException {
	public NotFoundValueException() {
		super();
	}

	public NotFoundValueException(String msg) {
		super(msg);
	}

	public NotFoundValueException(String msg, Throwable t) {
		super(msg, t);
	}
}
