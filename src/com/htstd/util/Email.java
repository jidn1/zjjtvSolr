package com.htstd.util;

import java.util.Calendar;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;




/**
 * 
 * @描述 邮件发送 工具类
 * @author 吉德宁
 * @日期 2017年6月20日
 *
 */
public class Email {
	/**
	 * 
	 * @param smtpHost 邮箱smtp 端口
	 * @param from 发送者
	 * @param fromUserPassword 发送者邮箱 smtp密码
	 * @param to 接收者
	 * @param subject 邮箱名
	 * @param messageText 内容
	 * @param messageType  编码格式
	 * @throws Exception
	 */
    @SuppressWarnings("static-access")  
    public static String sendMessage(String smtpHost, String from,  
            String fromUserPassword, String to, String subject,  
            String messageText, String messageType) {  
        // 第一步：配置javax.mail.Session对象  
        System.out.println("为" + smtpHost + "配置mail session对象");  
          
        Properties props = new Properties();  
        props.setProperty("mail.transport.protocol", "smtp"); // 设置传输协议
        props.put("mail.smtp.host", smtpHost);                //设置邮箱smtp端口
        props.put("mail.smtp.starttls.enable","true");        //使用 STARTTLS安全连接  
        //props.put("mail.smtp.port", "465");                 //google使用465或587端口  
        props.put("mail.smtp.auth", "true");                  // 使用验证  
        props.put("mail.debug", "true");  			          //开启debug模式
        Session mailSession = Session.getDefaultInstance(props,new MyAuthenticator(from,fromUserPassword));
       
        // 第二步：编写消息  
        System.out.println("编写消息from——to:" + from + "——" + to);  
        
        try {
    	 InternetAddress fromAddress = new InternetAddress(from); //发送者
         InternetAddress toAddress = new InternetAddress(to);     //接收者
         MimeMessage message = new MimeMessage(mailSession);  //登录到发送者邮箱
         message.setFrom(fromAddress);                        //设置邮件发送人
         message.addRecipient(RecipientType.TO, toAddress);   //设置邮件接收人
         message.setSentDate(Calendar.getInstance().getTime()); //设置邮件发送时间
         message.setSubject(subject);                           //邮件标题
         message.setContent(messageText, messageType);          //设置邮件内容和编码格式
         // 第三步：发送消息  
         Transport transport = mailSession.getTransport("smtp");   //Transport  用于连接STMP  把邮件通过STMP连接发送出去
         transport.connect(smtpHost,25,from, fromUserPassword);  
         transport.send(message, message.getRecipients(RecipientType.TO));  
         System.out.println("message yes");  
         return "ok";
        } catch (MessagingException e) {
			e.printStackTrace();
			return "fail";
		}  
    }  
  
    public static void main(String[] args) {  
        try {  
        	/**
        	 * @param smtpHost 邮箱smtp 端口
        	 * @param from 发送者
        	 * @param fromUserPassword 发送者邮箱 smtp密码
        	 * @param to 接收者
        	 * @param subject 邮箱名
        	 * @param messageText 内容
        	 * @param messageType 编码格式
        	 * @throws Exception
        	 */
            Email.sendMessage("smtp.exmail.qq.com", "jidening@yuanh.net",  
                    "密码", "jidn_jd@126.com", "中检远航（北京）科技有限公司来信请回复",  
                    "欢迎使用数据分析系统，请点击<a href='http://120.27.30.230:8082/ec/control/login'>这里</a>进行登录",  
                    "text/html;charset=utf-8");  
        } catch (Exception e) {  
        	System.out.println(e.getMessage());
            e.printStackTrace();  
        }  
    }  
}  

/**
 * 
 * @描述 继承Authenticator 重写构造方法
 * @author 吉德宁
 * @日期 2017年6月20日
 *
 */
class MyAuthenticator extends Authenticator{  
    String userName="";  
    String password="";  
    public MyAuthenticator(){  
          
    }  
    public MyAuthenticator(String userName,String password){  
        this.userName=userName;  
        this.password=password;  
    }  
     protected PasswordAuthentication getPasswordAuthentication(){     
        return new PasswordAuthentication(userName, password);     
     }   
}  
