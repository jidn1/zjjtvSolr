package com.htstd.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

import com.htstd.domain.equipmentPojo;

/**
 * 
 * @描述 jsp页面转换Html
 * @author 吉德宁
 * @日期 2017年9月1日
 *
 */
public class ToHtml extends HttpServlet {

	public static void JspToHtmlFile(String filePath, String HtmlFile, equipmentPojo equipment) {
		String str = "";
		long beginDate = (new Date()).getTime();
		try {

			String tempStr;
			FileInputStream is = new FileInputStream(filePath + "\\template.html");// 读取模块文件
			BufferedReader br = new BufferedReader(new InputStreamReader(is));
			while ((tempStr = br.readLine()) != null){
				str = str + tempStr;
			}
			is.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			// 替换掉模块中相应的地方
			str =str.replaceAll("###fileNumber###", equipment.getFileNumber());
			str =str.replaceAll("###equipmentName###", equipment.getEquipmentName());
			str =str.replaceAll("###customerNumber###", equipment.getCustomerNumber());
			File f = new File(HtmlFile + ".html");
			BufferedWriter o = new BufferedWriter(new FileWriter(f));
			o.write(str);
			o.close();
			System.out.println("共用时：" + ((new Date()).getTime() - beginDate) + "ms");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
