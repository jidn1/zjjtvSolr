package com.htstd.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htstd.dao.FieldEnumDao;
import com.htstd.domain.FieldCustomPojo;
import com.htstd.domain.enumCustomPojo;
import com.htstd.service.FieldEnumService;

@Service
public class FieldEnumServiceImpl implements FieldEnumService {
	
	@Autowired
	FieldEnumDao fieldEnumDao;
	
	public List<FieldCustomPojo> selectfieldByuserId(String userId) {
		return fieldEnumDao.selectfieldByuserId(userId);
	}

	public void insertField(FieldCustomPojo field) {
		fieldEnumDao.insertField(field);
	}

	public List<FieldCustomPojo> selectfield(String userId) {
		return fieldEnumDao.selectfield(userId);
	}

	public void deleteField(int id) {
		fieldEnumDao.deleteField(id);
	}

	public List<FieldCustomPojo> selectfieldEnum(String userId) {
		return fieldEnumDao.selectfieldEnum(userId);
	}

	public void insertEnum(enumCustomPojo enums) {
		fieldEnumDao.insertEnum(enums);
	}

	public void deleteEnum(int enumid) {
		fieldEnumDao.deleteEnumField(enumid);
	}

	public List<enumCustomPojo> selectEnum(Map<String, Object> maps) {
		return fieldEnumDao.selectEnum(maps);
	}

}
