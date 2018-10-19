package com.htstd.util.quartz.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerUtils;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.htstd.util.quartz.job.openXbbJob;


/**
 * 
 * @描述 调度器quartz 
 * @author 吉德宁
 * @日期 2017年6月24日
 *
 */
@SuppressWarnings("serial")
public class QuartzServlet extends HttpServlet  {
	
	public QuartzServlet() {
		super();
	}
	
	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	//初始化启动quartz
	public void init() throws ServletException {
		try {
			//获得调度器，并启动
			Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler();
			//scheduler.start();
			PayinventoryXbbopen(scheduler,"openXbbJob",openXbbJob.class,60);//
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
	}
	
	
	
	private void PayinventoryXbbopen(Scheduler scheduler,String jobName,Class jobClass,int scanInterval) throws SchedulerException{
		JobDetail jobDetail = new JobDetail(jobName, Scheduler.DEFAULT_GROUP,jobClass);
		
		//获取service并作为参数放入JobDataMap
		WebApplicationContext wac=WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());  
		
		/*XbbService xbbService = (XbbService) wac.getBean("xbbService");
		JdJobService jdJobService = (JdJobService) wac.getBean("jdJobService");
		DaAreaService daAreaService = (DaAreaService) wac.getBean("daAreaService");
		JdCapacityService jdCapacityService = (JdCapacityService) wac.getBean("jdCapacityService");
		JdSocMemberService jdSocMemberService = (JdSocMemberService) wac.getBean("jdSocMemberService");
		JdSdmsXbbLogService jdSdmsXbbLogService = (JdSdmsXbbLogService) wac.getBean("jdSdmsXbbLogService");
		PayinventoryService payinventoryService = (PayinventoryService) wac.getBean("payinventoryService");
		SdmsPayinventoryService sdmsPayinventoryService = (SdmsPayinventoryService) wac.getBean("sdmsPayinventoryService");
		
		jobDetail.getJobDataMap().put("xbbService", xbbService); 
		jobDetail.getJobDataMap().put("jdJobService", jdJobService); 
		jobDetail.getJobDataMap().put("jdCapacityService", jdCapacityService); 
		jobDetail.getJobDataMap().put("jdSocMemberService", jdSocMemberService);
		jobDetail.getJobDataMap().put("jdSdmsXbbLogService", jdSdmsXbbLogService);
		jobDetail.getJobDataMap().put("payinventoryService", payinventoryService);
		jobDetail.getJobDataMap().put("sdmsPayinventoryService", sdmsPayinventoryService);
		jobDetail.getJobDataMap().put("daAreaService", daAreaService);*/
		
		//触发器
		Trigger trigger = TriggerUtils.makeSecondlyTrigger(scanInterval);
		trigger.setName(jobName+"-Trigger");

		// 启动job与其他job时间错开
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.add(Calendar.SECOND, 10);
		Date fireDate = calendar.getTime();
		
		trigger.setStartTime(fireDate);
		scheduler.scheduleJob(jobDetail, trigger);
	}

	
}
