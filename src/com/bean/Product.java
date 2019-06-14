package com.bean;

import java.io.Serializable;
import java.util.Set;

/**
 * …Ã∆∑¿‡
 * 
 * @author Administrator
 *
 */
public class Product implements Serializable{

	private Integer pId;
	private String productName;
	private Integer quantity;
	private Set<Sale> saleProductId;

	public Set<Sale> getSaleProductId() {
		return saleProductId;
	}

	public void setSaleProductId(Set<Sale> saleProductId) {
		this.saleProductId = saleProductId;
	}

	public Product() {
	}

	@Override
	public String toString() {
		return "Product [pId=" + pId + ", productName=" + productName + ", quantity=" + quantity + "]";
	}

	public Product(Integer pId, String productName, Integer quantity) {
		this.pId = pId;
		this.productName = productName;
		this.quantity = quantity;
	}

	public Product(String productName, Integer quantity) {
		this.productName = productName;
		this.quantity = quantity;
	}

	public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
		this.pId = pId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

}
