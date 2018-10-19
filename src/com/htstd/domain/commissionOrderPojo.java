package com.htstd.domain;

import java.util.Date;

/**
 * 
 * @描述 送检委托单Pojo
 * @author 吉德宁
 * @日期 2017年7月24日
 *
 */
public class commissionOrderPojo {

	private String commissionUUID;//委托单UUID
	private String commissionCode;//委托单编号
	private Date orderTime;//下单时间
	private Date commissionDate;//委托日期
	private Date intendedDate;//拟取时间
	private Date submissionDate;//送检时间
	private Date retrieveDate;//取回日期
	private String entrustedUnit;//委托单位  (当前客户)
	private String contactsPerson;//联系人
	private String contactsAddress;//联系地址
	private String contactsPhone;//联系方式
	private String certificateName;//证书名称
	private String certificateAddress;//证书地址
	private String invoiceHeader;//发票抬头
	private String deliveryPlatform;//送检平台
	private String remark;//备注
	private String commissionType;//订单类型
	private Double totalFee;//总计费用
	private String spare_1;
	private String spare_2;
	private String spare_3;
	private String spare_4;
	
	
	public Double getTotalFee() {
		return totalFee;
	}
	public void setTotalFee(Double totalFee) {
		this.totalFee = totalFee;
	}
	public String getCommissionUUID() {
		return commissionUUID;
	}
	public void setCommissionUUID(String commissionUUID) {
		this.commissionUUID = commissionUUID;
	}
	public String getCommissionCode() {
		return commissionCode;
	}
	public void setCommissionCode(String commissionCode) {
		this.commissionCode = commissionCode;
	}
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	public Date getCommissionDate() {
		return commissionDate;
	}
	public void setCommissionDate(Date commissionDate) {
		this.commissionDate = commissionDate;
	}
	public Date getIntendedDate() {
		return intendedDate;
	}
	public void setIntendedDate(Date intendedDate) {
		this.intendedDate = intendedDate;
	}
	public Date getSubmissionDate() {
		return submissionDate;
	}
	public void setSubmissionDate(Date submissionDate) {
		this.submissionDate = submissionDate;
	}
	public Date getRetrieveDate() {
		return retrieveDate;
	}
	public void setRetrieveDate(Date retrieveDate) {
		this.retrieveDate = retrieveDate;
	}
	public String getEntrustedUnit() {
		return entrustedUnit;
	}
	public void setEntrustedUnit(String entrustedUnit) {
		this.entrustedUnit = entrustedUnit;
	}
	public String getContactsPerson() {
		return contactsPerson;
	}
	public void setContactsPerson(String contactsPerson) {
		this.contactsPerson = contactsPerson;
	}
	public String getContactsAddress() {
		return contactsAddress;
	}
	public void setContactsAddress(String contactsAddress) {
		this.contactsAddress = contactsAddress;
	}
	public String getContactsPhone() {
		return contactsPhone;
	}
	public void setContactsPhone(String contactsPhone) {
		this.contactsPhone = contactsPhone;
	}
	public String getCertificateName() {
		return certificateName;
	}
	public void setCertificateName(String certificateName) {
		this.certificateName = certificateName;
	}
	public String getCertificateAddress() {
		return certificateAddress;
	}
	public void setCertificateAddress(String certificateAddress) {
		this.certificateAddress = certificateAddress;
	}
	public String getInvoiceHeader() {
		return invoiceHeader;
	}
	public void setInvoiceHeader(String invoiceHeader) {
		this.invoiceHeader = invoiceHeader;
	}
	public String getDeliveryPlatform() {
		return deliveryPlatform;
	}
	public void setDeliveryPlatform(String deliveryPlatform) {
		this.deliveryPlatform = deliveryPlatform;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getCommissionType() {
		return commissionType;
	}
	public void setCommissionType(String commissionType) {
		this.commissionType = commissionType;
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
