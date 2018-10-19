package com.htstd.domain;

public class FieldCustomPojo {

	private Integer id;
	private String fieldName;
	private String fieldType;
	private String fieldDescrib;
	private String userId;
	
	
	public FieldCustomPojo(){}
	public FieldCustomPojo(Integer id, String fieldName, String fieldType, String fieldDescrib, String userId) {
		super();
		this.id = id;
		this.fieldName = fieldName;
		this.fieldType = fieldType;
		this.fieldDescrib = fieldDescrib;
		this.userId = userId;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	public String getFieldType() {
		return fieldType;
	}
	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}
	public String getFieldDescrib() {
		return fieldDescrib;
	}
	public void setFieldDescrib(String fieldDescrib) {
		this.fieldDescrib = fieldDescrib;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	
}
