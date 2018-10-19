package com.htstd.VO;

import java.io.Serializable;

import com.htstd.domain.userLoginPojo;

/**
 * 
 * @描述 用户VO类 
 * @author 吉德宁
 * @日期 2017年7月15日
 *
 */
public class userVO extends userLoginPojo implements Serializable{

	private String userUUID;
	private String userName;
	private String userLevel;
	private String state;
	private String userPhone;
	private String companyName;
	private String departmentName;
	private String departmentUUID;
	private String companyUUID;
	
	
	public String getDepartmentUUID() {
		return departmentUUID;
	}
	public void setDepartmentUUID(String departmentUUID) {
		this.departmentUUID = departmentUUID;
	}
	public String getCompanyUUID() {
		return companyUUID;
	}
	public void setCompanyUUID(String companyUUID) {
		this.companyUUID = companyUUID;
	}
	public String getUserUUID() {
		return userUUID;
	}
	public void setUserUUID(String userUUID) {
		this.userUUID = userUUID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	
	
	
	
}
