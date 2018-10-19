package com.htstd.domain;

/**
 * 
 * @描述 客户实体类 
 * @author 吉德宁
 * @日期 2017年7月12日
 *
 */
public class companyPojo {

	public companyPojo(){}
	
	private String companyUUID;//主键
	private String companyName;//客户名称
	private String companyCode;//客户编码
	private String companyAddress;//客户地址
	private String companyZipCode;//邮编
	private String companyOpenBank;//开户行
	private String companyCardNumber;//账号/卡号
	private String cretificateName;//证书名称
	private String cretificateAddress;//证书地址
	private String invoiceHead;//发票抬头
	private String spare_1;//备用字段1
	private String spare_2;//备用字段2
	private String spare_3;//备用字段3
	
	public String getCompanyUUID() {
		return companyUUID;
	}
	public void setCompanyUUID(String companyUUID) {
		this.companyUUID = companyUUID;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}
	public String getCompanyAddress() {
		return companyAddress;
	}
	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}
	public String getCompanyZipCode() {
		return companyZipCode;
	}
	public void setCompanyZipCode(String companyZipCode) {
		this.companyZipCode = companyZipCode;
	}
	public String getCompanyOpenBank() {
		return companyOpenBank;
	}
	public void setCompanyOpenBank(String companyOpenBank) {
		this.companyOpenBank = companyOpenBank;
	}
	public String getCompanyCardNumber() {
		return companyCardNumber;
	}
	public void setCompanyCardNumber(String companyCardNumber) {
		this.companyCardNumber = companyCardNumber;
	}
	public String getCretificateName() {
		return cretificateName;
	}
	public void setCretificateName(String cretificateName) {
		this.cretificateName = cretificateName;
	}
	public String getCretificateAddress() {
		return cretificateAddress;
	}
	public void setCretificateAddress(String cretificateAddress) {
		this.cretificateAddress = cretificateAddress;
	}
	public String getInvoiceHead() {
		return invoiceHead;
	}
	public void setInvoiceHead(String invoiceHead) {
		this.invoiceHead = invoiceHead;
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
