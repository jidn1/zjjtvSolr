package com.htstd.util;

import java.awt.Image;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Collection;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;


/**
 * @描述 验证工具类
 * @author 吉德宁
 * @日期 2017年7月7日
 *
 */
public class validateUtil {
	
	//验证集合是否为空
	public static boolean validationListIsEmpty(Collection col){
		if(col == null || col.isEmpty()){
			return false ;
		}
		return true ;
	}
	/**
	 * 判断对象是否为空
	 */
	public static Object isVal(Object str){
		if(str == null || "".equals(str)){
			return "";
		}
		return str;
	}
	/**
	 * 判断对象是否为空
	 */
	public static boolean isNotEmpty(Object str){
		if(str == null || "".equals(str)){
			return false;
		}
		return true;
	}
	/**
	 * 判断字符串有效性 
	 */
	public static boolean validationStringIsNull(String str){
		if(str == null || "".equals(str.trim())){
			return false ;
		}
		return true ;
	}
	
	/**
     * 获取字符串的长度，如果有中文，则每个中文字符计为2位
     * @param value 指定的字符串
     * @return 字符串的长度
     */
    public static int length(String value) {
        int valueLength = 0;
        String chinese = "[\u0391-\uFFE5]";
        /* 获取字段值的长度，如果含中文字符，则每个中文字符长度为2，否则为1 */
        for (int i = 0; i < value.length(); i++) {
            /* 获取一个字符 */
            String temp = value.substring(i, i + 1);
            /* 判断是否为中文字符 */
            if (temp.matches(chinese)) {
                /* 中文字符长度为2 */
                valueLength += 2;
            } else {
                /* 其他字符长度为1 */
                valueLength += 1;
            }
        }
        return valueLength;
    }
    
    /**
     * 验证手机号码
     */
    public static boolean isPhoneNO(String phone){
    	String regExp = "^((13[0-9])|(15[^4,\\D])|(17[0-9])|(18[0,5-9]))\\d{8}$";
    	Pattern p = Pattern.compile(regExp);
    	Matcher m = p.matcher(phone);
    	return m.find();
    }
    
    /**
     * 验证是否是图片
     * @param imageContent
     * @return
     */
    public static boolean isImage(byte[] imageContent) {
        if (imageContent == null || imageContent.length == 0) {
            return false;
        }
        Image img = null;
        InputStream is = null;
        try {
            is = new ByteArrayInputStream(imageContent);
            img = ImageIO.read(is);
            if (img == null || img.getWidth(null) <= 0
                    || img.getHeight(null) <= 0) {
                return false;
            }
            return true;
        } catch (Exception e) {
            return false;
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (Exception e) {
                	throw new RuntimeException(e.getMessage(),e);
                }
            }
        }
    }
    
    

}
