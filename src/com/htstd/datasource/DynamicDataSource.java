package com.htstd.datasource;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

public class DynamicDataSource extends AbstractRoutingDataSource {

	public DynamicDataSource(){ 
	    
    }
	@Override
	protected Object determineCurrentLookupKey() {
		return DataSourceContextHolder.getDbType();    
	}

}
