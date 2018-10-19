package com.htstd.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.htstd.service.EquipmentService;
import com.htstd.service.FieldEnumService;
import com.htstd.service.PersonService;

/**
 * 
 * @描述 送检计划 Controller 
 * @author 吉德宁
 * @日期 2017年7月10日
 *
 */
@Controller
@RequestMapping("inspectionPlan")
public class InspectionPlanController {
	private static final Logger logger = Logger.getLogger(PageController.class);
	
	
	//我的计划信息列表
	@RequestMapping("myPlanList.do")
	public String myPlanList(HttpServletRequest request, Model model) {  
	  
	    return "EC/My_plan_list";  
	} 
	
}
