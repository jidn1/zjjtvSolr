package com.htstd.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.htstd.dao.EquipmentDao;
import com.htstd.domain.equipmentPojo;
import com.htstd.service.EquipmentService;

@Service
public class EquipmentServiceImpl implements EquipmentService{

	@Autowired
	EquipmentDao equipmentDao;
	
	public List<equipmentPojo> selectEquipmentList(Map<String, Object> maps) {
		return equipmentDao.selectEquipmentList(maps);
	}

	public int selectEquipmentListTotal() {
		return equipmentDao.selectEquipmentListTotal();
	}

	public int insertEquipment(equipmentPojo equipment) {
		return equipmentDao.insertEquipment(equipment);		
	}

	public int updateEquipment(Map<String, Object> maps) {
		return equipmentDao.updateEquipment(maps);		
	}

	public int deleteEquipment(Map<String, Object> maps) {
		return equipmentDao.deleteEquipment(maps);		
	}

	public List<equipmentPojo> selectEquipmentByUUIDs(Map<String, Object> maps) {
		return equipmentDao.selectEquipmentByUUIDs(maps);
	}

	public equipmentPojo selectEquipmentByNameAndModel(Map<String, Object> maps) {
		return equipmentDao.selectEquipmentByNameAndModel(maps);
	}

	public int updateEquipmentByUUID(equipmentPojo equipment) {
		return equipmentDao.updateEquipmentByUUID(equipment);		
	}

	public equipmentPojo selectEquipmentByUUID(String equipmentUUID) {
		return equipmentDao.selectEquipmentByUUID(equipmentUUID);
	}

}
