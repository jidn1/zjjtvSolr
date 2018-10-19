package com.htstd.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/**
 * @描述 自定义异常处理器
 * @author 吉德宁
 * @日期 2017年7月7日
 *
 */
public class CustomExceptionResolver implements HandlerExceptionResolver {
	//声明自定义异常
	CustomException customException = null;
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object obj, Exception exception) {
		
		if(exception instanceof CustomException){
			customException = (CustomException)exception;
		}else{
			customException = new CustomException("抱歉，访问网页出错，请刷新重试！");
		}
		//获取错误信息
		String message = customException.getMessage();
		ModelAndView modelAndView = new ModelAndView();
		//将错误信息传到页面
		modelAndView.addObject("message",message);
		//指向错误页面
		modelAndView.setViewName("error/error");
		return modelAndView;
	}

	

}
