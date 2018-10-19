package com.htstd.dao;

import java.util.List;
import java.util.Map;

import com.htstd.domain.equipmentPojo;

public interface EquipmentDao {

	
	/**
	 * 查询器具列表分页
	 * @param maps
	 * @return
	 */
	public List<equipmentPojo> selectEquipmentList(Map<String,Object> maps);
	/**
	 * 查询器具总行数
	 * @return
	 */
	public int selectEquipmentListTotal();
	/**
	 * 添加器具信息
	 */
	public int insertEquipment(equipmentPojo equipment);
	/**
	 * 批量修改器具信息
	 * @param maps
	 */
	public int updateEquipment(Map<String,Object> maps);
	/**
	 * 刪除器具信息
	 * @param maps
	 */
	public int deleteEquipment(Map<String,Object> maps);
	/**
	 * 根據多个UUID查詢器具信息
	 * @param maps
	 * @return
	 */
	public List<equipmentPojo> selectEquipmentByUUIDs(Map<String,Object> maps);
	/**
	 * 根据UUID查看器具信息
	 * @param equipmentUUID
	 * @return
	 */
	public equipmentPojo selectEquipmentByUUID(String equipmentUUID);
	/**
	 * 根据 器具名称 出厂编号 器具型号 生产厂家  确定唯一器具
	 * @return
	 */
	public equipmentPojo selectEquipmentByNameAndModel(Map<String,Object> maps);
	/**
	 * 修改器具
	 */
	public int updateEquipmentByUUID(equipmentPojo equipment);
}
