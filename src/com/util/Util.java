package com.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 辅助工具
 * @author Administrator
 *
 */
public class Util {

	/**
	 * 生成4~6位的随机用户名
	 * @return
	 */
	public static String getUserName() {
		
		int num = (int) (Math.random()*3) + 4;
		
		StringBuffer sb = new StringBuffer();
		
		for(int i = 0; i < num; i++) {
			
			char k = (char) ((int)(Math.random()*26) + 97);
			sb.append(k);
		}
		
		return sb.toString();
	}
	
	/**
	 * 生成四位随机密码
	 * @return
	 */
	public static String getPassword() {
		
		StringBuffer sb = new StringBuffer();
		
		for(int i = 0; i < 4; i++) {
			sb.append((int)(Math.random()*10));
		}
		
		return sb.toString();
	}
	
	/**
	 * 生成随机时间
	 * @return
	 */
	public static Date getDate() {
		
		int year = (int)(Math.random()*20) + 1990;
		int month = (int) (Math.random()*12) + 1;
		int date = (int) (Math.random()*30) + 1;
		int hour = (int) (Math.random()*24);
		int min = (int) (Math.random()*60);
		int sec = (int) (Math.random()*60);
		
		StringBuffer sb = new StringBuffer();
		sb.append(year);
		sb.append("-");
		sb.append(month);
		sb.append("-");
		sb.append(date);
		sb.append(" ");
		sb.append(hour);
		sb.append(":");
		sb.append(min);
		sb.append(":");
		sb.append(sec);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date now = null;
		try {
			now = format.parse(sb.toString());
		} catch (ParseException e) {
		}
		
		return now;
	}
}













