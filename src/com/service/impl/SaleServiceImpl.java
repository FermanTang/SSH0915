package com.service.impl;

import java.util.List;

import com.bean.Sale;
import com.dao.SaleDao;
import com.service.SaleService;
import com.util.PageAssistant;

/**
 * ����ҵ���߼���ʵ����
 * @author Administrator
 *
 */
public class SaleServiceImpl implements SaleService {

	/** ��serviceʵ������, ��Ҫ���ö�Ӧ�����ݲ�ӿڶ��� */
	private SaleDao saleDao;

	@Override
	public void insert(Sale t) {
		saleDao.insert(t);
		
	}

	@Override
	public void delete(Sale t) {
		saleDao.delete(t);
		
	}

	@Override
	public void update(Sale t) {
		saleDao.delete(t);
		
	}

	@Override
	public List<Sale> select(String hql, Object... param) {
		return saleDao.select(hql, param);
	}

	@Override
	public int count(String hql, Object... param) {
		return saleDao.count(hql, param);
	}

	@Override
	public PageAssistant<Sale> selectByPage(PageAssistant<Sale> pa, String hql, Object... param) {
		return saleDao.selectByPage(pa, hql, param);
	}

	public SaleDao getSaleDao() {
		return saleDao;
	}

	public void setSaleDao(SaleDao saleDao) {
		this.saleDao = saleDao;
	}
	
	
}
