package com.bean;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

/**
 * ”√ªß
 * 
 * @author Administrator
 *
 */
public class Users implements Serializable {

	private Integer uId;
	private String userName;
	private String password;
	private String realName;
	private Set<Sale> saleUserId;

	public Set<Sale> getSaleUserId() {
		return saleUserId;
	}

	public void setSaleUserId(Set<Sale> saleUserId) {
		this.saleUserId = saleUserId;
	}

	public Users(Integer uId, String userName, String password, String realName) {
		this.uId = uId;
		this.userName = userName;
		this.password = password;
		this.realName = realName;
	}

	@Override
	public String toString() {
		return "Users [uId=" + uId + ", userName=" + userName + ", password=" + password + ", realName=" + realName
				+ "]";
	}

	public Users() {
	}

	public Users(Integer uId, String userName, String password) {
		this.uId = uId;
		this.userName = userName;
		this.password = password;
	}

	public Users(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}

	public Integer getuId() {
		return uId;
	}

	public void setuId(Integer uId) {
		this.uId = uId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

}
