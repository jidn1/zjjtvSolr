package com.htstd.util.quartz.job;


import java.util.Date;
import java.util.List;
import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;


public class openXbbJob implements Job {
	

	
	public void execute(JobExecutionContext context) throws JobExecutionException {
		//1.获取JobDetail,JobDetail 类持有 Job 的详细信息，包括为 Job 实例指定的名称，Job 所属组
		JobDetail jobDetail = context.getJobDetail();
		//2.获得参数Map
		JobDataMap dataMap = jobDetail.getJobDataMap();
		System.out.println("=============================================================================quartz      启动成功了！");
		/*XbbService xbbService = (XbbService) dataMap.get("xbbService");
		JdSdmsXbbLogService jdSdmsXbbLogService = (JdSdmsXbbLogService) dataMap.get("jdSdmsXbbLogService");
		PayinventoryService payinventoryService = (PayinventoryService) dataMap.get("payinventoryService");
		
		Date fireTime = context.getFireTime();
		List<JdSdmsXbbLog> orderCode = jdSdmsXbbLogService.getXbbOrderCode();//得到新添加的订单编码
		//System.out.println("==================开始想帮帮开单==================");
		if(orderCode!=null && orderCode.size()>0){
			for(int i=0;i<orderCode.size();i++){
				jdPayConfirmVo payVo = new jdPayConfirmVo(); 
				JdPayInventory pay = new JdPayInventory();
	    		pay.setOrderCode(orderCode.get(i).getOrderCode());
	    		pay = payinventoryService.PayInventorybyPro(pay);
	    		payVo = new jdPayConfirmVo();
	    		if(pay!=null){
	    			payVo.setOrderCode(pay.getOrderCode());
		    		payVo.setClientName(this.string2Unicode(pay.getClientName()));
		    		payVo.setMobilePhone(pay.getMobilePhone());
		    		payVo.setOrderPrice(pay.getOrderPrice().toString());
		    		payVo.setItemCode(pay.getItemCode());
		    		payVo.setCityCode(this.string2Unicode(pay.getCityName()));
		    		payVo.setLongitude(pay.getLongitude().toString());
		    		payVo.setLatitude(pay.getLatitude().toString());
		    		payVo.setServiceAddress(this.string2Unicode(pay.getServiceAddress()));
		    		payVo.setQuantity(pay.getQuantity().toString());
		    		payVo.setStartTimestamp(pay.getStartTimestamp().toString());
		    		payVo.setOrderBuyerRemark(pay.getOrderBuyerRemark()==null?"":string2Unicode(pay.getOrderBuyerRemark()));
	    		
	    		if(orderCode.get(i).getXbbStatus().equals("1")|| orderCode.get(i).getXbbStatus().equals("3")){
	    			JdSdmsXbbLog sxl = new JdSdmsXbbLog();
	    			sxl.setOrderCode(orderCode.get(i).getOrderCode()); 
	    			String xbbRus = xbbService.payConfirm(payVo);//xbb开单
	    			 JSONObject xbbResult = null;
	    			 String apiCode ="";
					try {
						System.out.println(xbbRus);
						xbbResult = new JSONObject().fromObject(xbbRus);
						apiCode = xbbResult.get("code").toString();//代表调用接口是否成功
					    } catch (Exception e) {
					}
	    	    		if(apiCode.trim().equals("0")){//成功
	    	    			sxl.setXbbId(xbbResult.get("data").toString());
	    	    			sxl.setXbbStatus("2");
	    	    			System.out.println("==================想帮帮成功开启一单==================");
	    	    		}else{//不成功
	    	    			sxl.setXbbStatus("3");
	    	    			System.out.println("===xbb开单失败====================="+apiCode.toString());
	    	    		}
	    	    		jdSdmsXbbLogService.updateSdmsXbbLog(sxl);//更新 sdms&xbb 日志
	    		}
	    	   
	    		}
	    	}
			 
		}*/
		//System.out.println("==================结束想帮帮开单==================");
		}
	public static String string2Unicode(String string) {
		 
	    StringBuffer unicode = new StringBuffer("");
	    if(string!=null&&!"".equals(string)){
		   for (int i = 0; i < string.length(); i++) {
				 
		        // 取出每一个字符
		        char c = string.charAt(i);
		 
		        // 转换为unicode
		        unicode.append("\\u" + Integer.toHexString(c));
		    }
	    }
	    
	    return unicode.toString();
	}

}
