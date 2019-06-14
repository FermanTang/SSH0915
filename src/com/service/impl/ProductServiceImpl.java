package com.service.impl;

import java.util.List;

import com.bean.Product;
import com.dao.ProductDao;
import com.service.ProductService;
import com.util.PageAssistant;

/**
 * ��Ʒҵ���߼���ʵ����
 * @author Administrator
 *
 */
public class ProductServiceImpl implements ProductService {

	/** ��serviceʵ������, ��Ҫ���ö�Ӧ�����ݲ�ӿڶ��� */
	private ProductDao productDao;

	@Override
	public void insert(Product t) {
		productDao.insert(t);
		
	}

	@Override
	public void delete(Product t) {
		productDao.delete(t);
		
	}

	@Override
	public void update(Product t) {
		productDao.update(t);
		
	}

	@Override
	public List<Product> select(String hql, Object... param) {
		return productDao.select(hql, param);
	}

	@Override
	public int count(String hql, Object... param) {
		return productDao.count(hql, param);
	}

	@Override
	public PageAssistant<Product> selectByPage(PageAssistant<Product> pa, String hql, Object... param) {
		return productDao.selectByPage(pa, hql, param);
	}

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
}
