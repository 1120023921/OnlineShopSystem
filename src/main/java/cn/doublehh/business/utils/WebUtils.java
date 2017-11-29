package cn.doublehh.business.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.apache.commons.codec.binary.Base64;

public class WebUtils {

	public static String generateID(){
		return UUID.randomUUID().toString();
	}
	
	public static String generateToken(String token) {


		// 数据指纹 获取摘要 MD5
		try {

			MessageDigest md = MessageDigest.getInstance("md5");
			byte md5[] = md.digest(token.getBytes()); // 128位 16
			// base64编码
			// BASE64Encoder encoder = new BASE64Encoder();
			return Base64.encodeBase64String(md5);

		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}
	
	public static String timeConver(Date date){
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			return df.format(date);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
