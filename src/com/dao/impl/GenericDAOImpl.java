package com.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.dao.GenericDAO;
/**
 * ͨ��daoʵ��
 * @author Administrator
 *
 */
public class GenericDAOImpl<T> extends HibernateDaoSupport implements GenericDAO<T>{
	
	private String className;

	public GenericDAOImpl(String className) {
		this.className = className;
	}

	public void save(T t) {
		/*this.getSession();//ʹ��ԭʼhibernate��̷�ʽ
		this.getHibernateTemplate();//ʹ��Spring�ṩģ�幤��*/	
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
		return this.getHibernateTemplate().find("from " + className);//ע��ո�
	}

	public List<T> findByNamedQuery(String queryName, Object... objects) {
		return this.findByNamedQuery(queryName, objects);
	}

	public List<T> findByCriteria(DetachedCriteria criteria) {
		return this.findByCriteria(criteria);
	}

}
