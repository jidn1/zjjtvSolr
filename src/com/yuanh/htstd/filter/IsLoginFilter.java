package com.yuanh.htstd.filter;

import java.io.IOException;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.htstd.domain.userLoginPojo;
/**
 * 
 * @描述 是否登录过滤器
 * @author 吉德宁
 * @日期 2017年7月7日
 *
 */
public class IsLoginFilter implements Filter {

	private static final Logger logger = Logger.getLogger(IsLoginFilter.class);
	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		
	}

	/**
	 *是否登录过滤器
	 */
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		//判断用户是否登录
		/*userLoginPojo userLogin = (userLoginPojo) request.getSession().getAttribute("userLogin");
		//获取项目根路径
		String path = request.getServletContext().getContextPath();
		//如果没有登录，直接跳转到登录界面
		if(null == userLogin){
			response.sendRedirect(path+"/index.html");
		}else {
			
			
			
			//获取application
			ServletContext application = request.getServletContext();
			String sessionId = (String) application.getAttribute(userLogin.getUserUUID()+"ID");
			if (null == sessionId || !sessionId.equals(request.getSession().getId())) {这说明用户已经在其他电脑或其它浏览器登录了，那么之前登录的session就无效了，自动被后面的登录给踢掉 
				//request.getSession().removeAttribute(user.getName());
				logger.info("====================过滤==========IsLoginFilter.doFilter========================"+sessionId);
				request.getSession().removeAttribute("userLogin");
				response.sendRedirect(path+"/index.html");// 跳转到首页或登录页面
			}else {
				chain.doFilter(request, response);
			}
		}*/
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
