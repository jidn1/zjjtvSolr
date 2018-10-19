package com.htstd.util;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

public class DbcontextHolder extends AbstractRoutingDataSource {

	private static final ThreadLocal<String> contextHolder = new ThreadLocal<String>();
	
	//设置当前数据源
	public static void setDbType(String dbType){
		contextHolder.set(dbType);
	}
	
	//获得当前数据源
	public static String getDbType(){
		return (String)contextHolder.get();
	}
	
	//清楚上下文
	public static void removeDbType(){
		contextHolder.remove();
	}
	
	@Override
	protected Object determineCurrentLookupKey() {
		return DbcontextHolder.getDbType();
	}
	
}
