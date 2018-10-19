package com.test;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.htstd.VO.demoVO;
import com.htstd.util.RedisApi;
import com.htstd.util.SerializeUtil;


public class Test extends HttpServlet{
	
	@org.junit.Test
	public void test() { 
		StringBuffer sb = new StringBuffer("");
		sb.append("equipmentCusname").append("equipmentFile").append("equipmentNmae");
		sb.toString().replaceAll("equipmentCusname", "asd");
		String str = "equipmentNameequipmetnCusnameequipmentFile";
		str = str.replace("equipmentName", "asd123123");
		System.out.println(str);
	}

	@org.junit.Test
	public void test1(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//System.out.println(UUID.randomUUID().toString());
		String str = "Wed Jul 19 00:00:00 CST 2017";
		System.out.println(sdf.format(new Date(str)));
		
	}
	
	public String listToString(List list, char separator) {
		return org.apache.commons.lang.StringUtils.join(list.toArray(), separator);
	}
	
	public   List<Integer> compare(Integer[] files, Integer[] exitFiles) {
	    List<Integer> list1 = Arrays.asList(files);
	    List<Integer> list2 = new ArrayList<Integer>();
	    for (Integer t : exitFiles) {
	      if (!list1.contains(t)) {
	        list2.add(t);
	      }
	    }
	    return list2;
	}
	
	public void  test2(){
		String str = "role_perssimtion_1,role_perssimtion_2,role_perssimtion_3";
		String[] role = str.split(",");
		
		for(int i =1;i<role.length+1;i++){
		if(role[i-1].equals("role_perssimtion_3")){
			role[i-1] = role[role.length-1];
			//数组缩容
			role = Arrays.copyOf(role, role.length-1);
		}
	}
	System.out.println(Arrays.toString(role).substring(1,Arrays.toString(role).length()-1));
	}
	
	@org.junit.Test
	public void test3(){
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ");
        //Date d = format.parse(str.replace("Z", " UTC"));//注意是空格+UTC
        //System.out.println(d);
        Date date=new Date();
        Calendar calendar=Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, calendar.get(Calendar.HOUR_OF_DAY) - 1);//获得昨天时间
        System.out.println(date);
        String temp=format.format(date);
        String hours=format.format(calendar.getTime());
        System.out.println(temp);
        System.out.println(":::"+hours);
        int end=temp.indexOf("+");
        String re=temp.substring(0,end)+"Z";
        int end2=hours.indexOf("+");
        String re2=hours.substring(0,end2)+"Z";
        System.out.println("当前时间"+re);
        System.out.println("前一小时"+re2);
        try {
            System.out.println(format.parse(re.replace("Z", "UTC")));
        } catch (Exception e1) {
            e1.printStackTrace();
        }
		
	}
	
	
	@org.junit.Test
	public void test4 (){
		
		demoVO demo = new demoVO();
		
		demo.setName("jidenign");
		demo.setAddress("北京");
		demo.setAge(23);
		
	
		
		RedisApi.set("demo", demo);
		
		
		 byte[] value = RedisApi.get("demo");
		 
		 demoVO d = (demoVO)SerializeUtil.unserialize(value);
		 
		 System.out.println(d.getName()+",\t"+d.getAddress()+",\t"+d.getAge());
		
	}
	
	@org.junit.Test
	public void test5(){
		
		int a = 586;
		int b = 1160;
	    float c = (a/b)*100;
		//System.out.println(c);
		
		int num1 = 586;
		int num2 = 1160;
		// 创建一个数值格式化对象
		NumberFormat numberFormat = NumberFormat.getInstance();

		// 设置精确到小数点后2位

		numberFormat.setMaximumFractionDigits(2);

		String result = numberFormat.format((float) num1 / (float) num2 * 100);

		System.out.println("num1和num2的百分比为:" + result + "%");
	}
	
	
}
