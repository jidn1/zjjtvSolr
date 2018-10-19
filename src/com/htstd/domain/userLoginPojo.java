package com.htstd.domain;

/**
 * 
 * @描述 用户表 
 * @author 吉德宁
 * @日期 2017年7月12日
 *
 */
public class userLoginPojo {

	private String userUUID;//用户UUID
	private String loginUser;//登录账号
	private String loginPassWord;//登录密码
	private String userName;//用户名称
	private String userEmail;//用户邮箱
	private String userAddress;//用户地址
	private String userFax;//用户传真
	private String userPhone;//用户手机号
	private String userTelephone;//用户固话
	private String remark;//备注
	private String departmentUUID;//所属部门
	private String companyUUID;//所属客户
	private String userLevel;//用户级别
	private String state;//状态  是否可用  STATE_0 STATE_1
	private String spare_1;//备用字段1
	private String spare_2;//备用字段2
	private String spare_3;//备用字段3
	private String spare_4;//备用字段4
	
	
	public String getLoginUser() {
		return loginUser;
	}
	public void setLoginUser(String loginUser) {
		this.loginUser = loginUser;
	}
	public String getLoginPassWord() {
		return loginPassWord;
	}
	public void setLoginPassWord(String loginPassWord) {
		this.loginPassWord = loginPassWord;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
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
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserFax() {
		return userFax;
	}
	public void setUserFax(String userFax) {
		this.userFax = userFax;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserTelephone() {
		return userTelephone;
	}
	public void setUserTelephone(String userTelephone) {
		this.userTelephone = userTelephone;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
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
	public String getSpare_1() {
		return spare_1;
	}
	public void setSpare_1(String spare_1) {
		this.spare_1 = spare_1;
	}
	public String getSpare_2() {
		return spare_2;
	}
	public void setSpare_2(String spare_2) {
		this.spare_2 = spare_2;
	}
	public String getSpare_3() {
		return spare_3;
	}
	public void setSpare_3(String spare_3) {
		this.spare_3 = spare_3;
	}
	public String getSpare_4() {
		return spare_4;
	}
	public void setSpare_4(String spare_4) {
		this.spare_4 = spare_4;
	}
	
	
	
}
