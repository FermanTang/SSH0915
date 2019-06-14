package com.dao;

import java.util.List;

import com.util.PageAssistant;

/**
 * 基础数据层接口
 * @author Administrator
 *
 * @param <T>
 */
public interface BaseDao<T> {

	void insert(T t);
	void delete(T t);
	void update(T t);
	List<T> select(String hql, Object...param);
	
	int count(String hql, Object...param);
	PageAssistant<T> selectByPage
		(PageAssistant<T> pa, String hql, Object...param);
}













