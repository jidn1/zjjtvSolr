package com.htstd.controller;

import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("index")
public class IndexController {
	private static final Logger logger = Logger.getLogger(IndexController.class); 
	
	/**
	 * 首页初始化
	 */
	@RequestMapping("init.do")
	public String initIndexPage(Model model,HttpServletRequest request) throws Exception{
		logger.info("====================首页初始化==========PageController.initIndexPage========================start");
		
		logger.info("====================首页初始化==========PageController.initIndexPage========================end");		
		return "index/index";
	}
	
	
}
