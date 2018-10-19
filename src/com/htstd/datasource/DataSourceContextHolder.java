package com.htstd.datasource;

/**
 * 
 * @描述 配置多数据源 
 * @author 吉德宁
 * @日期 2017年6月24日
 *
 */
public class DataSourceContextHolder {    
	   
    private static final ThreadLocal<String> contextHolder = new ThreadLocal<String>();    
    
    public static void setDbType(String dbType) {    
        contextHolder.set(dbType);    
    }    
    
    public static String getDbType() {    
        return ((String) contextHolder.get());    
    }    
    
    public static void clearDbType() {    
        contextHolder.remove();    
    }    
} 
