package com.htstd.domain;

import java.util.Date;

/**
 * 
 * @描述 送检计划Pojo 
 * @author 吉德宁
 * @日期 2017年7月21日
 *
 */
public class inspectionPlanPojo {

	
	public inspectionPlanPojo(){}
	
	private String planUUID;//计划UUID
	private String planNumber;//计划编号
	private Date compilingDate;//编制时间
	private String planName;//计划名称
	private String planDepartment;//所属部门
	private Date starTime;//开始时间
	private Date endTime;//结束时间
	private Date planNextCheckTime;//计划下次检定日期
	private String planPerson;//计划人
	private String planEcplain;//说明
	private String planStatus;//计划状态
	private Double totalFee;//总计费用
	private String executor;//执行人
	private String spare_1;//备用字段1
	private String spare_2;//备用字段2
	private String spare_3;//备用字段3
	private String spare_4;//备用字段4
	
	
	public Date getPlanNextCheckTime() {
		return planNextCheckTime;
	}
	public void setPlanNextCheckTime(Date planNextCheckTime) {
		this.planNextCheckTime = planNextCheckTime;
	}
	public String getPlanUUID() {
		return planUUID;
	}
	public void setPlanUUID(String planUUID) {
		this.planUUID = planUUID;
	}
	public String getPlanNumber() {
		return planNumber;
	}
	public void setPlanNumber(String planNumber) {
		this.planNumber = planNumber;
	}
	public Date getCompilingDate() {
		return compilingDate;
	}
	public void setCompilingDate(Date compilingDate) {
		this.compilingDate = compilingDate;
	}
	public String getPlanName() {
		return planName;
	}
	public void setPlanName(String planName) {
		this.planName = planName;
	}
	public String getPlanDepartment() {
		return planDepartment;
	}
	public void setPlanDepartment(String planDepartment) {
		this.planDepartment = planDepartment;
	}
	public Date getStarTime() {
		return starTime;
	}
	public void setStarTime(Date starTime) {
		this.starTime = starTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getPlanPerson() {
		return planPerson;
	}
	public void setPlanPerson(String planPerson) {
		this.planPerson = planPerson;
	}
	public String getPlanEcplain() {
		return planEcplain;
	}
	public void setPlanEcplain(String planEcplain) {
		this.planEcplain = planEcplain;
	}
	public String getPlanStatus() {
		return planStatus;
	}
	public void setPlanStatus(String planStatus) {
		this.planStatus = planStatus;
	}
	public Double getTotalFee() {
		return totalFee;
	}
	public void setTotalFee(Double totalFee) {
		this.totalFee = totalFee;
	}
	public String getExecutor() {
		return executor;
	}
	public void setExecutor(String executor) {
		this.executor = executor;
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
