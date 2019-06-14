package com.bean;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 销售记录表
 * 
 * @author Administrator
 *
 */
public class Sale implements Serializable{

	private Integer sId;
	private Double price;
	private Integer quantity;
	private Double totalPrice;
	private Date saleDate;
	private Integer userId;
	private Integer productId;
	private Users user;
	private Product product;

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Sale() {
	}

	public Sale(Integer sId, Double price, Integer quantity, Double totalPrice, Date saleDate, Integer userId,
			Integer productId) {
		this.sId = sId;
		this.price = price;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
		this.saleDate = saleDate;
		this.userId = userId;
		this.productId = productId;
	}

	public Sale(Double price, Integer quantity, Double totalPrice, Date saleDate, Integer userId, Integer productId) {
		this.price = price;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
		this.saleDate = saleDate;
		this.userId = userId;
		this.productId = productId;
	}

	@Override
	public String toString() {
		return "Sale [sId=" + sId + ", price=" + price + ", quantity=" + quantity + ", totalPrice=" + totalPrice
				+ ", saleDate=" + saleDate + ", userId=" + userId + ", productId=" + productId + "]";
	}

	public Integer getsId() {
		return sId;
	}

	public void setsId(Integer sId) {
		this.sId = sId;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getSaleDate() {
		return saleDate;
	}

	public void setSaleDate(Date saleDate) {
		this.saleDate = saleDate;
	}

	public void setSaleDate(String saleDate) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			this.saleDate = format.parse(saleDate);
		} catch (ParseException e) {
			e.printStackTrace();
			this.saleDate = new Date();
		}
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

}
