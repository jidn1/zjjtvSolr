package com.test;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.htstd.service.EquipmentService;
import com.htstd.service.PersonService;


/**
 * 
 * @描述 spring junit4测试类
 * @author 吉德宁
 * @日期 2017年7月5日
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/applicationContext-*.xml")
public class spring {

	@Autowired
	private EquipmentService equipmentService;
	@Autowired
	PersonService personservice;
	
	
	@Test
	public void insert(){
	
		
	}
	
}
