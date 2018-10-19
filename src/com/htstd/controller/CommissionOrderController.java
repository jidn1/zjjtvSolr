package com.htstd.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @描述 我的订单controller 
 * @author 吉德宁
 * @日期 2017年7月15日
 *
 */
@Controller
@RequestMapping("commissionOrder")
public class CommissionOrderController {

	
	
	//我的订单信息列表
	@RequestMapping("myOrderList.do")
	public String myOrderList(HttpServletRequest request, Model model) {  
	  
	    return "EC/My_order_list";  
	} 
	
}
