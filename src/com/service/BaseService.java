package com.service;

import java.util.List;

import com.util.PageAssistant;

/**
 * 基础业务逻辑层接口
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













