package com.service;

import java.util.List;

import com.util.PageAssistant;

/**
 * ����ҵ���߼���ӿ�
 * @author Administrator
 *
 * @param <T>
 */
public interface BaseService<T> {

	void insert(T t);
	void delete(T t);
	void update(T t);
	List<T> select(String hql, Object...param);
	
	int count(String hql, Object...param);
	PageAssistant<T> selectByPage
		(PageAssistant<T> pa, String hql, Object...param);
}













