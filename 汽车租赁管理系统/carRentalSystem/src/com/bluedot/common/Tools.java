package com.bluedot.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Tools {
	public static String formatDate(Date date, String pattren) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattren);
		return sdf.format(date);
	}

	public static Date formatString(String source, String pattren) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattren);
		Date date = null;
		try {
			date = sdf.parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	public static  Date getSystemDate() {
		Date date = new Date();
		return date;
	}
}
