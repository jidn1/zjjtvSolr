package com.htstd.util;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import net.sf.json.JSONObject;

/**
 * 密码加密MD5
 * @author zap
 *
 */
public class DataUtil {     
	public static final int FIRST_DAY_OF_WEEK = Calendar.MONDAY;
	 /** 
     * 判断str1中包含str2的个数 
      * @param str1 
     * @param str2 
     * @return counter 
     */  
    public static int countStr(String str1, String str2) {  
    	int counter = 0;
        if (str1.indexOf(str2) == -1) {  
            return 0;  
        } else if (str1.indexOf(str2) != -1) {  
            counter++;  
            countStr(str1.substring(str1.indexOf(str2) +  
                   str2.length()), str2);  
               return counter;  
        }  
            return 0;  
    }  
	 /**
     * String类型转化成list
     * @param stringList
     * @return
     */
    public static List<String> toListByString(String stringList){
    	List<String> list = new ArrayList<String>();
    	if(validateUtil.validationStringIsNull(stringList)){
    		String[] strArray = stringList.split(",");
    		for (int i = 0; i < strArray.length; i++) {
    			list.add(strArray[i]);
			}
    	}
    	return list;
    }
	/**
	 * 数组去重
	 */
	public static String[] arraysRepeat(Object[] s){
		List<Object> list = Arrays.asList(s);
		Set<Object> set = new HashSet<Object>(list);
		return (String[])set.toArray(new String[0]);
	}
	/**
	 * 数组至list
	 */
	public static List<String> arraysRepeatList(String s){
		return Arrays.asList(s.split(","));
	}
	/**
	 * 返回流
	 * @param response
	 * @param obj
	 */
	public static void print(HttpServletResponse response, Object obj)
    {
	try
	{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json;charset=UTF-8");
	    PrintWriter pw = response.getWriter();
	    pw.print(obj);
	    pw.flush();
	    pw.close();
	} catch (IOException e)
	{
	    e.printStackTrace();
	}
    }
	/**
	 * 获取项目编号
	 * @param date
	 * @return
	 */
	public static String getTaskOrderId() {  
		SimpleDateFormat df = new SimpleDateFormat("-dd-MM-yyyy");
		return df.format(new Date());
	} 
	/**
	 * 获取年代号
	 * @param date
	 * @return
	 */
	public static String getStandardId() {  
        SimpleDateFormat df = new SimpleDateFormat("yyyy");
		return df.format(new Date());
    } 
	/**
	 * 获取年代
	 * @param date
	 * @return
	 */
	public static String getYear(Integer num) {  
		SimpleDateFormat df = new SimpleDateFormat("yyyy");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.add(Calendar.YEAR,-num);
		return df.format(calendar.getTime());
	} 
	/**
	 * 获取文件后缀
	 */
	public static String resolveContentType(String fileName){
		try{
			return fileName.substring(fileName.lastIndexOf(".") + 1);
		}catch (StringIndexOutOfBoundsException e){
			return "";
		}
	}
	/**
	 * 获取本周的第一天
	 * @param date
	 * @return
	 */
	public static Date getMondayOfWeek(Date date) {  
        Calendar monday = Calendar.getInstance();  
        monday.setTime(date);  
        monday.setFirstDayOfWeek(FIRST_DAY_OF_WEEK);  
        monday.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);  
		return monday.getTime();
    } 
	/**
	 * 获取前几天yyyy-MM-dd
	 */
	public static String getPrevDateTime(Integer num,Date date){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");//格式化对象
		Calendar calendar = Calendar.getInstance();//日历对象
		calendar.setTime(date);//设置当前日期
		calendar.add(Calendar.DATE, -num);//天数
		return format.format(calendar.getTime());
	}
	/**
	 * 获取yyyy-MM-dd
	 */
	public static String getStringTime(Date date){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");//格式化对象
		return format.format(date);
	}
	/**
	 * 获取yyyy-MM-dd HH:mm:ss
	 */
	public static String getStringTime2(Date date){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");//格式化对象
		return format.format(date);
	}
	
	 /** 
     * 取得周的剩余天数 中国+1
     *  
     * @param date 
     * @return 
     */  
    public static int getRemainDayOfWeek(Date date) {  
        int DayOfWeek = getDayOfWeek(date);  
        int day = getPassDayOfWeek(date);  
        return DayOfWeek - day + 1;  
    }  
  
    /** 
     * 取得周已经过的天数 
     *  
     * @param date 
     * @return 
     */  
    public static int getPassDayOfWeek(Date date) {  
        Calendar c = Calendar.getInstance();  
        c.setTime(date);  
        return c.get(Calendar.DAY_OF_WEEK);  
    }
    /** 
     * 取得周天数 
     *  
     * @param date 
     * @return 
     */  
    public static int getDayOfWeek(Date date) {  
        Calendar c = Calendar.getInstance();  
        c.setTime(date);  
        return c.getActualMaximum(Calendar.DAY_OF_WEEK);  
    } 
	
	/**
	 * 获取时间id
	 */
	public static String newDateId(Date date) throws Exception{
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		return df.format(date);
	}
	/**
	 * 获取时间yyyy-MM-dd HH:mm:ss
	 */
	public static String newDate(Date date) throws Exception{
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(date);
	}
	/**
	 * 获取时间yyyy-MM-dd
	 */
	public static String newDater(Date date) throws Exception{
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(date);
	}
	/**
	 * 获取时间
	 */
	
	public static long currentTimeMillis(){
		return new Date().getTime();
	}
	
	/**
	 * 日期+时间
	 */
	public static String getStringTime(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(new Date());
	}
	/**
	 * 日期
	 */
	public static String getYmDate() throws Exception{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
		return format.format(new Date());
	}
	/**
	 * 日期+时间
	 */
	public static Date getDateTime() throws Exception{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.parse(format.format(new Date()));
	}
	/**
	 * 日期
	 */
	public static Date getDate() throws Exception{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.parse(format.format(new Date()));
	}

	/**
	 *日期
	 *
	 * @param String 
	 * @return Date
	 */
	public static Date getDate(String date)throws Exception{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.parse(date);
	}
	
	
    /** 
     * 取得月第一天 
     *  
     * @param date 
     * @return 
     */  
    public static String getFirstDateOfMonth(Date date) throws Exception{  
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String str = format.format(date) + " 00:00:00";
        return str;  
    }  
  
    /** 
     * 取得月最后一天 
     *  
     * @param date 
     * @return 
     */  
    public static String getLastDateOfMonth(Date date) throws Exception{  
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();  
        c.setTime(date);  
        c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));  
        String str = format.format(c.getTime()) + " 23:59:59";
        return str;  
    } 
    /**
     * 月份之间的月份
     * @param stime
     * @param etime
     * @return
     * @throws Exception
     */
    public static List<String> getNumMonthBetween(String stime,String etime) throws Exception {
		List<String> dateList = new ArrayList<String>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");

        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();

        c1.setTime(sdf.parse(stime));
        c2.setTime(sdf.parse(etime));

        Integer result = (c2.get(Calendar.YEAR) - c1.get(Calendar.YEAR))*12 + c2.get(Calendar.MONTH) - c1.get(Calendar.MONTH);
        Date parse = sdf.parse(stime);
		for (int i = 0;i <= result;i++){
			c1.setTime(parse);//设置当前日期
			c1.add(Calendar.MONTH, +i);//天数
			dateList.add(sdf.format(c1.getTime()));
		}	
		return dateList;
	}
    /**
     * 后几天yyyy-MM-dd
     * @param num
     * @param time
     * @return
     * @throws Exception
     */
    public static String getNextDateTime(Integer num,String stime) throws Exception{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();//日历对象
		calendar.setTime(format.parse(stime));//设置当前日期
		calendar.add(Calendar.DATE, +num);//天数
		String string = format.format(calendar.getTime());
		return string;
	}
    /**
     * 计算两个日期之间的天数
     * @return
     * @throws Exception
     */
    public static 	Integer getDayBetween(Date beginDate,Date endDate) throws Exception {
    	//格式化时间
     	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
 		Integer betweenDate = (int) ((df.parse(df.format(endDate)).getTime()-df.parse(df.format(beginDate)).getTime())/(1000*60*60*24)) +1;
 		return betweenDate;
    }
    /**
     * 计算两个日期之间的天数
     * @param stime
     * @param etime
     * @return
     * @throws Exception
     */
    public static List<String> getDayBetween(Integer aa,String stime,String etime) throws Exception {
     	//格式化时间
     	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
 		Date beginDate = df.parse(stime);
 		Date endDate = df.parse(etime);
 		Integer betweenDate = (int) ((endDate.getTime()-beginDate.getTime())/(1000*60*60*24)) +1;
 		Calendar calendar = Calendar.getInstance();//日历对象
 		calendar.setTime(df.parse(stime));//设置当前日期
 		List<String> list = new ArrayList<String>();
 		if(aa == 0){
 			for (int i = 0; i < betweenDate; i++) {
 				if(i == 0){
 					list.add("'"+stime+"'");
 				}else{
 					calendar.add(Calendar.DATE, +1);//天数
 					list.add("'"+df.format(calendar.getTime())+"'");
 				}
 			}
 		}else {
 			for (int i = 0; i < betweenDate; i++) {
 				if(i == 0){
 					list.add(stime);
 				}else{
 					calendar.add(Calendar.DATE, +1);//天数
 					list.add(df.format(calendar.getTime()));
 				}
 			}

 		}
    	return list;
    }

	/**
	 * 获取ip
	 */
	public static String getIp(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
		            if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
		                 //多次反向代理后会有多个ip值，第一个ip才是真实ip
		                 int index = ip.indexOf(",");
		                 if(index != -1){
		                     return ip.substring(0,index);
		                 }else{
		                     return ip;
		                }
		            }
		            ip = request.getHeader("X-Real-IP");
		            if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
		                return ip;
		            }
		            return request.getRemoteAddr();
    }
	/**
	 * 采用md5加密
	 */
	public static String md5(String src){
		try {
			StringBuffer buffer = new StringBuffer();
			char[] chars= {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] data = md.digest(src.getBytes());
			for(byte b : data){
				//高4位
				buffer.append(chars[(b >> 4) & 0x0F]);
				//低4位
				buffer.append(chars[b & 0x0F]);
			}
			return buffer.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null ;
	}
	
	/**
	 * ajax返回数据
	 */
	public static void responseAjaxData(String str,HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out =response.getWriter();
		out.write(str);
		out.flush();
		out.close();
	}
	
	/**
	 * ajax返回text\html数据
	 */
	public static void responseTextAjaxData(String str,HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out =response.getWriter();
		out.write(str);
		out.flush();
		out.close();
	}
	
	/**
	 * 分页工具类
	 */
	public static Map<String,Integer> groupPages(Integer pageNo,Integer totalCount,Integer _pageSize ){
		Map<String,Integer> map = new HashMap<String,Integer>();
		//初始化页码信息
		Integer _pageNo = 0;
		if(pageNo == null || pageNo == 0 ){
			_pageNo = 1;
		}else{
			_pageNo = pageNo;
		}
		
		//计算页数
		int pageCount = totalCount/_pageSize + (totalCount%_pageSize == 0 ? 0 : 1);
		//计算从第几行开始查询
		int start = (_pageNo - 1)*_pageSize;
		//对分页的数据在分页
		int showSize = _pageSize;//每次显示几个页号
		int showStart = 0;//默认开始显示的页号
		int showEnd = 0;//显示到第几个页号
		//如果所有页码不足showSize则showStart =1，showEnd=最后的页码
		if(pageCount <= showSize){
			showStart = 1;
			showEnd = pageCount;
		}else{
			//计算开始页
			if(_pageNo <= (showSize/2)){
				showStart = 1;
			}else{
				showStart = _pageNo - (showSize/2);
			}
			//计算结束页
			showEnd = showStart + showSize -1;
			//如果大于最大页号
			if(showEnd > pageCount){
				showEnd = pageCount;
				showStart = showEnd - showSize -1;
			}
		}
		map.put("pageCount", pageCount);
		map.put("currentPage", _pageNo);
		map.put("showStart", showStart);
		map.put("showEnd", showEnd);
		map.put("start", start);
		return map;
	}
	
	/**
	 * json to java
	 */
	public static Map<String,Object> json2Object(String str){
		JSONObject fromObject = JSONObject.fromObject(str);
		 @SuppressWarnings("rawtypes")
		Iterator iter = fromObject.keySet().iterator();  
	    Map<String,Object> map = new HashMap<String,Object>();  
	    while (iter.hasNext()) {  
	       String key = (String) iter.next();  
	       String value = fromObject.getString(key);  
	       map.put(key, value); 
	    }  
		return map;
	}
	
	/**
	 * 返回一个四位随机数
	 */
	public static String getCode(HttpServletRequest request){
		
	    String   code="";    
        int   intCount=0;    
        intCount=(new Random()).nextInt(9999);//    
        if(intCount<1000)intCount+=1000;    
        code=intCount+""; 
        return code;
	}
	
	/**
	 * 返回一个三位随机数
	 */
	public static String getNum(){
		
		String   code="";    
		int   intCount=0;    
		intCount=(new Random()).nextInt(999);//    
		if(intCount<100)intCount+=100;    
		code=intCount+""; 
		return code;
	}
	
	
	/**
	 * 更改名字
	 */
	public static String renameUp(String srcName){
		srcName = UUID.randomUUID().toString().replaceAll("-", "").trim() + srcName.substring(srcName.lastIndexOf("."));
		return srcName;
	}
	
	/**
	 * solr处理特殊字符
	 */

	public static String escapeQueryChars(String s) {
	    StringBuilder sb = new StringBuilder();
	    for (int i = 0; i < s.length(); i++) {
	      char c = s.charAt(i);
	      if (c == '\\' || c == '+' || c == '-' || c == '!'  || c == '(' || c == ')' || c == ':'
	        || c == '^' || c == '[' || c == ']' || c == '\"' || c == '{' || c == '}' || c == '~'
	        || c == '*' || c == '?' || c == '|' || c == '&'  || c == ';' || c == '/'
	        || Character.isWhitespace(c)) {
	        sb.append('\\');
	      }
	      sb.append(c);
	    }
	    return sb.toString();
	  }
	
    /** 
     * 下面的代码将字符串以正确方式显示（包括回车，换行，空格） 
     */  
    public static String jspBr(String str) {  
  
    	while (str.indexOf("<br>") != -1) {  
    		str = str.substring(0, str.indexOf("\n")) + "<br>"  
    				+ str.substring(str.indexOf("\n") + 1);  
    	}  
        while (str.indexOf("\n") != -1) {  
            str = str.substring(0, str.indexOf("\n")) + "<br>"  
                    + str.substring(str.indexOf("\n") + 1);  
        }  
        return str;  
    } 
    
 // 将 UTF-8 编码的字符串转换为 GB2312 编码格式：

    public static String utf8Togb2312(String str){

            StringBuffer sb = new StringBuffer();

            for ( int i=0; i<str.length(); i++) {

                char c = str.charAt(i);

                switch (c) {

                   case '+' :

                       sb.append( ' ' );

                   break ;

                   case '%' :

                       try {

                            sb.append(( char )Integer.parseInt (

                            str.substring(i+1,i+3),16));

                       }

                       catch (NumberFormatException e) {

                           throw new IllegalArgumentException();

                      }

                      i += 2;

                      break ;

                   default :

                      sb.append(c);

                      break ;

                 }

            }

            String result = sb.toString();

            String res= null ;

            try {

                 byte [] inputBytes = result.getBytes( "8859_1" );

                res= new String(inputBytes, "UTF-8" );

            }

            catch (Exception e){}

            return res;

      }

    // 将 GB2312 编码格式的字符串转换为 UTF-8 格式的字符串：

    public static String gb2312ToUtf8(String str) {

            String urlEncode = "" ;

            try {

                urlEncode = URLEncoder.encode (str, "UTF-8" );

            } catch (UnsupportedEncodingException e) {

                e.printStackTrace();

            }

            return urlEncode;

    } 
    
	/**
     * 判断路径是否存在不存在创建
     * @param path
     * @return
     */
    public static boolean isexitsPath(String path)throws InterruptedException{
        String [] paths=path.split("\\\\");
        StringBuffer fullPath=new StringBuffer();
        for (int i = 0; i < paths.length; i++) {
            fullPath.append(paths[i]).append("\\\\");
            File file=new File(fullPath.toString());
         if(paths.length-1!=i){
            if(!file.exists()){
                file.mkdir();
                System.out.println("创建目录为:"+fullPath.toString());
                Thread.sleep(1500);
            }
         }
        }
        File file=new File(fullPath.toString());
        if (!file.exists()) {
            return true;
        }else{
            return false;
        }
    }
    
    // 删除指定文件夹下所有文件  
    // param path 文件夹完整绝对路径  
    public static boolean delAllFile(String path) {  
        boolean flag = false;  
        File file = new File(path);  
        if (!file.exists()) {  
            return flag;  
        }  
        if (!file.isDirectory()) {  
            return flag;  
        }  
        String[] tempList = file.list();  
        File temp = null;  
        for (int i = 0; i < tempList.length; i++) {  
            if (path.endsWith(File.separator)) {  
                temp = new File(path + tempList[i]);  
            } else {  
                temp = new File(path + File.separator + tempList[i]);  
            }  
            if (temp.isFile()) {  
                temp.delete();  
            }  
            if (temp.isDirectory()) {  
                delAllFile(path + "/" + tempList[i]);// 先删除文件夹里面的文件  
//              delFolder(path + "/" + tempList[i]);// 再删除空文件夹  
                flag = true;  
            }  
        }  
        return flag;  
    }  
    public static String FormetFileSize(long fileS) {//转换文件大小
        DecimalFormat df = new DecimalFormat("#.00");
        String fileSizeString = "";
        //fileSizeString = df.format((double) fileS / 1048576);
        
        if (fileS < 1024) {
            fileSizeString = df.format((double) fileS) + "B";
        } else if (fileS < 1048576) {
            fileSizeString = df.format((double) fileS / 1024) + "K";
        } else if (fileS < 1073741824) {
            fileSizeString = df.format((double) fileS / 1048576) + "M";
        } else {
            fileSizeString = df.format((double) fileS / 1073741824) +"G";
        }
        return fileSizeString;
     }
	
}
