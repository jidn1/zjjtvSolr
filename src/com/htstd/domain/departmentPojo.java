package com.htstd.domain;

/**
 * 
 * @描述 部门类 
 * @author 吉德宁
 * @日期 2017年7月13日
 *
 */
public class departmentPojo {

	public departmentPojo(){}
	
	private String departmentUUID;//部门UUID
	private String departmentCode;//部门编号
	private String departmentName;//部门名称
	private String departmentCompanyUUID;//所属客户
	private String departmentParent;//上级部门
	private int departmentNumber;//部门序号
	private String spare_1;//备用字段1
	private String spare_2;//备用字段2
	private String spare_3;//备用字段3
	public String getDepartmentUUID() {
		return departmentUUID;
	}
	public void setDepartmentUUID(String departmentUUID) {
		this.departmentUUID = departmentUUID;
	}
	public String getDepartmentCode() {
		return departmentCode;
	}
	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getDepartmentCompanyUUID() {
		return departmentCompanyUUID;
	}
	public void setDepartmentCompanyUUID(String departmentCompanyUUID) {
		this.departmentCompanyUUID = departmentCompanyUUID;
	}
	public String getDepartmentParent() {
		return departmentParent;
	}
	public void setDepartmentParent(String departmentParent) {
		this.departmentParent = departmentParent;
	}
	public int getDepartmentNumber() {
		return departmentNumber;
	}
	public void setDepartmentNumber(int departmentNumber) {
		this.departmentNumber = departmentNumber;
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
	
	
	
}
