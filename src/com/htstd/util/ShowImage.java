package com.htstd.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * @描述 图片处理类
 * @author 吉德宁
 * @日期 2017年7月7日
 *
 */
@SuppressWarnings("serial")
public class ShowImage extends HttpServlet{
	private String realImagePath;
	private String imageName;
	
	
	/**
	 * 初始化条形码对象
	 */
	public void init(ServletConfig conf) throws ServletException {
		super.init(conf);
	}

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("image/gif");//设置输出流内容格式
		resp.setHeader("Pragma", "no-cache");//设置header
		resp.setHeader("Cache-Control", "no-cache");
		resp.setCharacterEncoding("utf-8");//设置编码格式
		req.setCharacterEncoding("utf-8");
		realImagePath=req.getParameter("realImagePath");//获取图片路径
		//System.out.println(realImagePath);
		imageName=req.getParameter("imageName");
		if(realImagePath!=null&&!"".equals(realImagePath)){
			File file = new File(realImagePath);
			if(file.exists()){
				InputStream in =new  FileInputStream(realImagePath);
				OutputStream os = resp.getOutputStream();  //创建输出流
				byte[] b = new byte[1024];  
				while( in.read(b)!= -1){  
					os.write(b);     
				}
				in.close(); 
				os.flush();
				os.close();
			}
		}
		
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			doGet(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	
	
	
}
