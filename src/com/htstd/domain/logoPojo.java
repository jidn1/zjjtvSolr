package com.htstd.domain;

public class logoPojo {

	private int id;
	private String path;
	//private String userId;
	private String userId;
	public logoPojo(){}
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public void setId(int id) {
		this.id = id;
	}
	
	
	
}
