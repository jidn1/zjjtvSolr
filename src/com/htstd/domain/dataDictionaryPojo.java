package com.htstd.domain;

/**
 * @描述 数据字典
 * @author 吉德宁
 * @日期 2017年7月6日
 *
 */
public class dataDictionaryPojo {

	
	private int id;//主键
	private String dictionaryName; //字典名称
	private String dictionaryValue; //字典值
	private String dictionaryStatus; //字典状态
	
	public dataDictionaryPojo(){}
	
	
	public dataDictionaryPojo(int id, String dictionaryName, String dictionaryValue, String dictionaryStatus) {
		super();
		this.id = id;
		this.dictionaryName = dictionaryName;
		this.dictionaryValue = dictionaryValue;
		this.dictionaryStatus = dictionaryStatus;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDictionaryName() {
		return dictionaryName;
	}
	public void setDictionaryName(String dictionaryName) {
		this.dictionaryName = dictionaryName;
	}
	public String getDictionaryValue() {
		return dictionaryValue;
	}
	public void setDictionaryValue(String dictionaryValue) {
		this.dictionaryValue = dictionaryValue;
	}
	public String getDictionaryStatus() {
		return dictionaryStatus;
	}
	public void setDictionaryStatus(String dictionaryStatus) {
		this.dictionaryStatus = dictionaryStatus;
	}
	
	
	
}
