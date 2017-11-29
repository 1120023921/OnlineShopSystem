package cn.doublehh.business.utils;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;


/**
 * 发邮件
 * @author 11200
 *
 */
public class ApacheMailUtil {

	public static String sendEmail(String title,String content,String toAddress){
    	Email email = new SimpleEmail();
        email.setHostName("smtp.exmail.qq.com");
        email.setSmtpPort(465);
        email.setAuthenticator(new DefaultAuthenticator("1120023921@doublehh.cn", "1024768Hh"));
        email.setSSLOnConnect(true);
        try {
			email.setFrom("1120023921@doublehh.cn");
			email.addTo(toAddress);
			email.setCharset("UTF-8");
			email.setSubject(title);
			email.buildMimeMessage();
			 //设置内容的字符集为UTF-8,先buildMimeMessage才能设置内容文本   
	        email.getMimeMessage().setText(content,"UTF-8");
	        email.sendMimeMessage(); 
	        return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
    }
}