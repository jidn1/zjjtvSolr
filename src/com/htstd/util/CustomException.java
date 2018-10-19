package com.htstd.util;
/**
 * 
 * @描述 自定义异常
 * @author 吉德宁
 * @日期 2017年7月7日
 *
 */
public class CustomException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2360985732615532759L;
	//异常信息
	private String message;

	public CustomException(String message) {
		super(message);
		this.message = message;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
