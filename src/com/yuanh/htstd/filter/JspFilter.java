package com.yuanh.htstd.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JspFilter implements Filter, com.sun.org.apache.xalan.internal.xsltc.dom.Filter {


	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		 HttpServletRequest hreq = (HttpServletRequest) request;
		    HttpServletResponse hresp = (HttpServletResponse) response;
		    String name = hreq.getRequestURL().substring(
		          hreq.getRequestURL().lastIndexOf("/") + 1,
		          hreq.getRequestURL().lastIndexOf("."));
		    if (hreq.getRequestURL().indexOf(".jsp") != -1 && (null == hreq.getParameter("type") || hreq.getParameter("type").equals(""))) {
		        hresp.sendRedirect(hreq.getContextPath()+"/conversion?name="+hreq.getRequestURL());
		        return ;
		    }
		    chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

	public boolean test(int node) {
		// TODO Auto-generated method stub
		return false;
	}

}
