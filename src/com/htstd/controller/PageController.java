package com.htstd.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.htstd.domain.equipmentPojo;
import com.htstd.service.FieldEnumService;
import com.htstd.util.MakeHtm;

/**
 * 
 * @描述 我的首页
 * @author 吉德宁
 * @日期 2017年7月24日
 *
 */
@Controller
@RequestMapping("page")
public class PageController {
	private static final Logger logger = Logger.getLogger(PageController.class);

	@Autowired
	private FieldEnumService fieldEnumService;

	// 我的首页
	@RequestMapping("myHome.do")
	public String myHome(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "EC/Home_main";
	}

	// 近7天订单
	@RequestMapping("sevenOrder.do")
	public String sevenOrder(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "EC/home/Seven_day_orderList";
	}

	// 计划到期提醒
	@RequestMapping("planDue.do")
	public String planDue(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "EC/home/Plan_dueList";
	}

	// 器具到期提醒
	@RequestMapping("applianceDue.do")
	public String applianceDue(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "EC/home/Appliance_expiredList";
	}

	// 器具到期提醒
	@RequestMapping("demotohtml")
	public String demotohtml(HttpServletRequest request, HttpServletResponse response, Model model) {

		return "EC/demoToHtml";
	}

	// 器具到期提醒
	@RequestMapping("writeHtml.do")
	public String writeHtml(HttpServletRequest request, HttpServletResponse response, Model model,
			equipmentPojo equipment) {

		String reqTarget = request.getRequestURI();
		String name = reqTarget.substring(reqTarget.lastIndexOf("/") + 1, reqTarget.lastIndexOf("."));
		String path = request.getSession().getServletContext().getRealPath("html");
		com.htstd.util.ToHtml.JspToHtmlFile(path, path + "\\" + name, equipment);

		return "EC/home/Appliance_expiredList";
	}

	@RequestMapping("toHtml1.do")
	public String ToHtml(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		String url = "";
		String name = "";

		ServletContext sc = request.getServletContext();
		String ster = request.getParameter("fileNumber");
		String file_name = request.getParameter("file_name");// 你要访问的jsp文件,如news.jsf。
		// file_name如：fileDetail.jsf?fileId=56.要是有参数， 只有一个参数。并且以参数名作为文件名。
		String realName = request.getParameter("realName");// 要保存的文件名。如aaa;注意可以没有这个参数。

		String path = request.getParameter("path");// 你要访问的jsp文件路径。如news。注意可以没有这个参数。

		String realPath = request.getParameter("realPath");// 你要保存的文件路径,如htmlNews.注意可以没有这个参数。
		// 下面确定要保存的文件名字。
		if (realName == null || realName == "") {
			int a = 0;
			a = file_name.indexOf("=") + 1;
			realName = file_name.substring(a);
			if (realName.indexOf(".") > 0) {
				realName = file_name.substring(0, file_name.indexOf("."));
			}
		}
		// 下面构造要访问的页面。
		if (path == null || path == "") {
			url = "/" + file_name;// 这是你要生成HTML的jsp文件,如
		} else {
			url = "/" + path + "/" + file_name;// 这是你要生成HTML的jsp文件,如
		}
		// 下面构造要保存的文件名，及路径。
		// 1、如果有realPath，则保存在realPath下。
		// 2、如果有path则保存在path下。
		// 3、否则，保存在根目录下。
		if (realPath == null || realPath == "") {
			if (path == null || path == "") {
				name = request.getServletContext().getRealPath("/") + "\\" + realName + ".html";// 这是生成的html文件名,如index.htm.说明：
																								// ConfConstants.CONTEXT_PATH为你的上下文路径。
			} else {
				name = request.getServletContext().getRealPath("/") + "\\" + path + "\\" + realName + ".html";// 这是生成的html文件名,如index.htm.
			}
		} else {
			name = request.getServletContext().getRealPath("/") + "\\" + realPath + "\\" + realName + ".html";// 这是生成的html文件名,如index.htm.
		}
		File dest = new File(path + "/" + file_name);
		// 访问请求的页面，并生成指定的文件。
		RequestDispatcher rd = sc.getRequestDispatcher(url);

		final ByteArrayOutputStream os = new ByteArrayOutputStream();

		final ServletOutputStream stream = new ServletOutputStream() {
			public void write(byte[] data, int offset, int length) {
				os.write(data, offset, length);
			}

			public void write(int b) throws IOException {
				os.write(b);
			}
		};

		final PrintWriter pw = new PrintWriter(new OutputStreamWriter(os));

		HttpServletResponse rep = new HttpServletResponseWrapper(response) {
			public ServletOutputStream getOutputStream() {
				return stream;
			}

			public PrintWriter getWriter() {
				return pw;
			}
		};
		rd.include(request, rep);
		pw.flush();
		FileOutputStream fos = new FileOutputStream(name); // 把jsp输出的内容写到xxx.htm
		os.writeTo(fos);
		fos.close();
		PrintWriter out = response.getWriter();
		out.print("<p align=center><font size=3 color=red>success！</font></p>");

		return "EC/home/Appliance_expiredList";
	}

}
