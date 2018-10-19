package com.htstd.service;

import java.util.List;
import java.util.Map;

import com.htstd.domain.FieldCustomPojo;
import com.htstd.domain.enumCustomPojo;

public interface FieldEnumService {

	/**
	 * 根据登录用户查看 器具字段
	 * @param userId
	 * @return
	 */
	public List<FieldCustomPojo> selectfieldByuserId(String userId);
	/**
	 * 用户自定义字段
	 * @param field
	 */
	public void insertField(FieldCustomPojo field);
	/**
	 * 查看字段使用情况
	 * @param filed
	 * @return
	 */
	public List<FieldCustomPojo> selectfield(String userId);
	/**
	 * 根据主键删除自定义字段
	 * @param id
	 */
	public void deleteField(int enumid);
	/**
	 * 查看枚举字段
	 * @param userId
	 * @return
	 */
	public List<FieldCustomPojo> selectfieldEnum(String userId);
	/**
	 * 插入枚举值
	 * @param enums
	 */
	public void insertEnum(enumCustomPojo enums);
	/**
	 * 删除枚举值
	 * @param id
	 */
	public void deleteEnum(int id);
	/**
	 * 查看枚举值
	 * @param maps
	 * @return
	 */
	public List<enumCustomPojo> selectEnum(Map<String,Object> maps);
}
