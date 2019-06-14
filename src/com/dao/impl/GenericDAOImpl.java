package com.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.dao.GenericDAO;
/**
 * 通用dao实现
 * @author Administrator
 *
 */
public class GenericDAOImpl<T> extends HibernateDaoSupport implements GenericDAO<T>{
	
	private String className;

	public GenericDAOImpl(String className) {
		this.className = className;
	}

	public void save(T t) {
		/*this.getSession();//使用原始hibernate编程方式
		this.getHibernateTemplate();//使用Spring提供模板工具*/	
		this.getHibernateTemplate().save(t);
	}

	public void update(T t) {
		this.getHibernateTemplate().update(t);
	}

	public void delete(T t) {
		this.getHibernateTemplate().delete(t);
	}

	public T findById(Serializable id) {
		Class<?> clazz = null;
		try {
			clazz = Class.forName(className);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return (T)this.getHibernateTemplate().get(clazz, id);
	}

	public List<T> findAll() {
		return this.getHibernateTemplate().find("from " + className);//注意空格
	}

	public List<T> findByNamedQuery(String queryName, Object... objects) {
		return this.findByNamedQuery(queryName, objects);
	}

	public List<T> findByCriteria(DetachedCriteria criteria) {
		return this.findByCriteria(criteria);
	}

}
