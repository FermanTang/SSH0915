package com.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

/**
 * 用户
 * @author Administrator
 *
 */
public interface GenericDAO<T> {
	
	/**
	 * 保存
	 * @param t
	 */
	public void save(T t);
	
	/**
	 * 修改
	 * @param t
	 */
	public void update(T t);
	
	/**
	 * 删除
	 * @param t
	 */
	public void delete(T t);
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public T findById(Serializable id);
	
	/**
	 * 查询所有数据
	 * @param criteria
	 * @return
	 */
	public List<T> findAll();
	
	/**
	 * 条件查询
	 * @param criteria
	 * @return
	 */
	public List<T> findByNamedQuery(String queryName, Object...objects);//根据hql查询
	
	/**
	 * 条件查询
	 * @param criteria
	 * @return
	 */
	public List<T> findByCriteria(DetachedCriteria criteria);//面向对象条件查询
	
}
