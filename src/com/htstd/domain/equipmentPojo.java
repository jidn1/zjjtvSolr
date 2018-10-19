package com.htstd.domain;

import java.io.Serializable;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * @描述 器具类
 * @author 吉德宁
 * @日期 2017年7月6日
 *
 */
public class equipmentPojo implements Serializable{

	
	private static final long serialVersionUID = -3731527957053132264L;
	
	private String equipmentUUID;//器具UUID
	private String equipmentName;//器具名称
	private String equipmentModel;//器具型号
	private String equipmentSpecification;//器具规格
	private String serialNumber;//出厂编号
	private String equipmentStatus;//器具状态 （在用EQUIPMENT_STATUS_1；停用2；损坏3；降级4；准用5；在库6；封存7；报废8；遗失9；备用10；限用11；其他12）
	private String accuracyLevel;//准确度等级
	private String abcClassification;//ABC分类
	private String abcNumber;//ABC编号
	private String colorAppendix;//彩色附录
	private String equipmentPerson;//负责人
	private String equipmentVerified;//检定员
	private String manufacturer;//生产厂家
	private String measuringRange;//测量范围
	private String uncertainty;//不确定度
	private String fileNumber;//档案号
	private String customerNumber;//客户编号
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date productionDate;//出厂日期
	private String measurementCategory;//计量类别
	private Integer equipmentCount;//器具数量
	private String basicRemark;//基本信息备注
	private String checkRemark;//校检信息备注
	private String equipmentCreater;//创建人
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createrDate;//创建日期
	private String verificationInstitution;//检定机构
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date verificationDate;//校验日期
	private Integer verificationCycle;//检定周期
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date validDate;//有效日期
	private String verificationResult;//检定结果（RESULT_STATUS_0合格；1不合格） 
	private String inspectionType;//送检类型
	private Double calibrationFee;//校准费
	private Double budgetFee;//预算费用
	private String certificateNumber;//证书编号
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date firstInspectionDate;//首次校验日期
	private String verificationUnit;//检定单位
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date completionDate;//完成日期
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date purchaseDate;//购置日期
	private Double purchasePrice;//购置价
	private String storageRemark;//保管信息备注
	private String subordinateSector;//所属部门
	private String equipmentUser;//使用人
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date receiveDate;//接收日期
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date enableDate;//启用日期
	private String equipmentUseunit;//使用单位
	private String receiveState;//接收状态
	private String planNumber;//计划编号
	private String orderNumber;//订单编号
	private String planState;//计划状态
	private String orderState;//订单状态
	//自定义字段
	private String spare_1;//
	private String spare_2;//
	private String spare_3;//
	private String spare_4;//
	private String spare_5;//
	private String spare_6;//
	
	//备用字段
	private String alterField_1;
	private String alterField_2;
	private String alterField_3;
	private String alterField_4;
	
	
	
	public String getColorAppendix() {
		return colorAppendix;
	}
	public void setColorAppendix(String colorAppendix) {
		this.colorAppendix = colorAppendix;
	}
	public String getEquipmentUUID() {
		return equipmentUUID;
	}
	public void setEquipmentUUID(String equipmentUUID) {
		this.equipmentUUID = equipmentUUID;
	}
	public String getEquipmentName() {
		return equipmentName;
	}
	public void setEquipmentName(String equipmentName) {
		this.equipmentName = equipmentName;
	}
	public String getEquipmentModel() {
		return equipmentModel;
	}
	public void setEquipmentModel(String equipmentModel) {
		this.equipmentModel = equipmentModel;
	}
	public String getEquipmentSpecification() {
		return equipmentSpecification;
	}
	public void setEquipmentSpecification(String equipmentSpecification) {
		this.equipmentSpecification = equipmentSpecification;
	}
	public String getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}
	public String getEquipmentStatus() {
		return equipmentStatus;
	}
	public void setEquipmentStatus(String equipmentStatus) {
		this.equipmentStatus = equipmentStatus;
	}
	public String getAccuracyLevel() {
		return accuracyLevel;
	}
	public void setAccuracyLevel(String accuracyLevel) {
		this.accuracyLevel = accuracyLevel;
	}
	public String getAbcClassification() {
		return abcClassification;
	}
	public void setAbcClassification(String abcClassification) {
		this.abcClassification = abcClassification;
	}
	public String getAbcNumber() {
		return abcNumber;
	}
	public void setAbcNumber(String abcNumber) {
		this.abcNumber = abcNumber;
	}
	public String getEquipmentPerson() {
		return equipmentPerson;
	}
	public void setEquipmentPerson(String equipmentPerson) {
		this.equipmentPerson = equipmentPerson;
	}
	public String getEquipmentVerified() {
		return equipmentVerified;
	}
	public void setEquipmentVerified(String equipmentVerified) {
		this.equipmentVerified = equipmentVerified;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getMeasuringRange() {
		return measuringRange;
	}
	public void setMeasuringRange(String measuringRange) {
		this.measuringRange = measuringRange;
	}
	public String getUncertainty() {
		return uncertainty;
	}
	public void setUncertainty(String uncertainty) {
		this.uncertainty = uncertainty;
	}
	public String getFileNumber() {
		return fileNumber;
	}
	public void setFileNumber(String fileNumber) {
		this.fileNumber = fileNumber;
	}
	public String getCustomerNumber() {
		return customerNumber;
	}
	public void setCustomerNumber(String customerNumber) {
		this.customerNumber = customerNumber;
	}
	public Date getProductionDate() {
		return productionDate;
	}
	public void setProductionDate(Date productionDate) {
		this.productionDate = productionDate;
	}
	public String getMeasurementCategory() {
		return measurementCategory;
	}
	public void setMeasurementCategory(String measurementCategory) {
		this.measurementCategory = measurementCategory;
	}
	public Integer getEquipmentCount() {
		return equipmentCount;
	}
	public void setEquipmentCount(Integer equipmentCount) {
		this.equipmentCount = equipmentCount;
	}
	public Integer getVerificationCycle() {
		return verificationCycle;
	}
	public void setVerificationCycle(Integer verificationCycle) {
		this.verificationCycle = verificationCycle;
	}
	public String getBasicRemark() {
		return basicRemark;
	}
	public void setBasicRemark(String basicRemark) {
		this.basicRemark = basicRemark;
	}
	public String getCheckRemark() {
		return checkRemark;
	}
	public void setCheckRemark(String checkRemark) {
		this.checkRemark = checkRemark;
	}
	public String getEquipmentCreater() {
		return equipmentCreater;
	}
	public void setEquipmentCreater(String equipmentCreater) {
		this.equipmentCreater = equipmentCreater;
	}
	public Date getCreaterDate() {
		return createrDate;
	}
	public void setCreaterDate(Date createrDate) {
		this.createrDate = createrDate;
	}
	public String getVerificationInstitution() {
		return verificationInstitution;
	}
	public void setVerificationInstitution(String verificationInstitution) {
		this.verificationInstitution = verificationInstitution;
	}
	public Date getVerificationDate() {
		return verificationDate;
	}
	public void setVerificationDate(Date verificationDate) {
		this.verificationDate = verificationDate;
	}
	public Date getValidDate() {
		return validDate;
	}
	public void setValidDate(Date validDate) {
		this.validDate = validDate;
	}
	public String getVerificationResult() {
		return verificationResult;
	}
	public void setVerificationResult(String verificationResult) {
		this.verificationResult = verificationResult;
	}
	public String getInspectionType() {
		return inspectionType;
	}
	public void setInspectionType(String inspectionType) {
		this.inspectionType = inspectionType;
	}
	public Double getCalibrationFee() {
		return calibrationFee;
	}
	public void setCalibrationFee(Double calibrationFee) {
		this.calibrationFee = calibrationFee;
	}
	public Double getBudgetFee() {
		return budgetFee;
	}
	public void setBudgetFee(Double budgetFee) {
		this.budgetFee = budgetFee;
	}
	public String getCertificateNumber() {
		return certificateNumber;
	}
	public void setCertificateNumber(String certificateNumber) {
		this.certificateNumber = certificateNumber;
	}
	public Date getFirstInspectionDate() {
		return firstInspectionDate;
	}
	public void setFirstInspectionDate(Date firstInspectionDate) {
		this.firstInspectionDate = firstInspectionDate;
	}
	public String getVerificationUnit() {
		return verificationUnit;
	}
	public void setVerificationUnit(String verificationUnit) {
		this.verificationUnit = verificationUnit;
	}
	public Date getCompletionDate() {
		return completionDate;
	}
	public void setCompletionDate(Date completionDate) {
		this.completionDate = completionDate;
	}
	public Date getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public Double getPurchasePrice() {
		return purchasePrice;
	}
	public void setPurchasePrice(Double purchasePrice) {
		this.purchasePrice = purchasePrice;
	}
	public String getStorageRemark() {
		return storageRemark;
	}
	public void setStorageRemark(String storageRemark) {
		this.storageRemark = storageRemark;
	}
	public String getSubordinateSector() {
		return subordinateSector;
	}
	public void setSubordinateSector(String subordinateSector) {
		this.subordinateSector = subordinateSector;
	}
	public String getEquipmentUser() {
		return equipmentUser;
	}
	public void setEquipmentUser(String equipmentUser) {
		this.equipmentUser = equipmentUser;
	}
	public Date getReceiveDate() {
		return receiveDate;
	}
	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}
	public Date getEnableDate() {
		return enableDate;
	}
	public void setEnableDate(Date enableDate) {
		this.enableDate = enableDate;
	}
	public String getEquipmentUseunit() {
		return equipmentUseunit;
	}
	public void setEquipmentUseunit(String equipmentUseunit) {
		this.equipmentUseunit = equipmentUseunit;
	}
	public String getReceiveState() {
		return receiveState;
	}
	public void setReceiveState(String receiveState) {
		this.receiveState = receiveState;
	}
	public String getPlanNumber() {
		return planNumber;
	}
	public void setPlanNumber(String planNumber) {
		this.planNumber = planNumber;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getPlanState() {
		return planState;
	}
	public void setPlanState(String planState) {
		this.planState = planState;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	public String getAlterField_1() {
		return alterField_1;
	}
	public void setAlterField_1(String alterField_1) {
		this.alterField_1 = alterField_1;
	}
	public String getAlterField_2() {
		return alterField_2;
	}
	public void setAlterField_2(String alterField_2) {
		this.alterField_2 = alterField_2;
	}
	public String getAlterField_3() {
		return alterField_3;
	}
	public void setAlterField_3(String alterField_3) {
		this.alterField_3 = alterField_3;
	}
	public String getAlterField_4() {
		return alterField_4;
	}
	public void setAlterField_4(String alterField_4) {
		this.alterField_4 = alterField_4;
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
	public String getSpare_5() {
		return spare_5;
	}
	public void setSpare_5(String spare_5) {
		this.spare_5 = spare_5;
	}
	public String getSpare_6() {
		return spare_6;
	}
	public void setSpare_6(String spare_6) {
		this.spare_6 = spare_6;
	}
	
	
	
	
	
	
	
	
	
	
}
